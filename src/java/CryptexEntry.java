
import data.Database;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

public class CryptexEntry extends HttpServlet {

    private static final String COMPANY_DB_LOCATION = "localhost";
    private static final String BROKER_DB_LOCATION = "localhost";
    private static final String C_DETAILS_SERVER = "localhost";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String source = request.getHeader("Referer");
        if (source == null) {
            response.sendRedirect("../index.html");
        } else {
            try {
                HttpSession session = request.getSession();
                System.out.println("Entering Cryptex Vault - Request By " + session.getAttribute("name") + " GUID@" + session.getAttribute("guid"));
                Database DB = new Database(COMPANY_DB_LOCATION, "companydb", "root", "");
                String email = DB.getCompanyEmail();
                String guid = session.getAttribute("guid").toString();

                // Send access request to company details server for OTP generation
                CloseableHttpClient client = HttpClients.createDefault();
                HttpPost httpPost = new HttpPost("http://" + C_DETAILS_SERVER + ":8080/CryptexWebsite/Control");
                List<NameValuePair> params = new ArrayList<NameValuePair>();
                params.add(new BasicNameValuePair("guid", guid));
                params.add(new BasicNameValuePair("email", email));
                httpPost.setEntity(new UrlEncodedFormEntity(params));
                CloseableHttpResponse answer = client.execute(httpPost);
                if (answer.getStatusLine().getStatusCode() == 200) {
                    response.sendRedirect("../cryptexLogin.html");
                } else {
                    response.getWriter().println("Cryptex Server Down For Maintenance, Please Try Again !");
                    response.getWriter().println(answer.getStatusLine().getStatusCode());
                }
                client.close();

            } catch (Exception e) {
                System.out.println("Error In Providing Access To The Cryptex Vault !");                
            }

        }
    }
}
