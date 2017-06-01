
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

public class CryptexOTPCheck extends HttpServlet {

    private static final String COMPANY_DB_LOCATION = "localhost";
    private static final String BROKER_DB_LOCATION = "localhost";
    private static final String C_DETAILS_SERVER = "localhost";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("invalid request");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            String guid = request.getParameter("guid");
            String otp = request.getParameter("psw1") + request.getParameter("psw2") + request.getParameter("psw3") + request.getParameter("psw4");

            // Validate OTP from CompanyDetails server
            // Send access request to company details server for OTP generation
            CloseableHttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost("http://" + C_DETAILS_SERVER + ":8080/CryptexWebsite/ServerOTPCheck");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("guid", guid));
            params.add(new BasicNameValuePair("email", email));
            params.add(new BasicNameValuePair("otp", otp));
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            CloseableHttpResponse answer = client.execute(httpPost);
            if (answer.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity1 = answer.getEntity();
                InputStreamReader is = new InputStreamReader(answer.getEntity().getContent());
                BufferedReader br = new BufferedReader(is);
                String line = br.readLine();
                if (line.equals("allow")) {
                    HttpSession S = request.getSession();
                    S.setAttribute("authenticated", "true");
                    response.sendRedirect("loading/loading.jsp");
                } else if (line.equals("block")) {
                    response.sendRedirect("cryptexLogin.html");
                }
            } else {
                response.getWriter().println("Cryptex Server Down For Maintenance, Please Try Again !");
            }
            client.close();
        } catch (Exception e) {
            System.out.println("Error ");
        }
    }
}
