
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

public class ClientLogout extends HttpServlet {

    private static final String C_DETAILS_SERVER = "localhost";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("name") != null) {
            String email = session.getAttribute("email").toString();
            String guid = session.getAttribute("guid").toString();
            System.out.println(session.getAttribute("name") + " logged out of system");
            session.removeAttribute("guid");
            session.removeAttribute("name");
            session.removeAttribute("authenticated");
            session.invalidate();

            // Change user status to offline in the ClientDetails website
            CloseableHttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost("http://" + C_DETAILS_SERVER + ":8080/CryptexWebsite/UserInvalidate");
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("guid", guid));
            params.add(new BasicNameValuePair("email", email));
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            CloseableHttpResponse answer = client.execute(httpPost);
            if (answer.getStatusLine().getStatusCode() == 200) {
                System.out.println(guid + " logged out !");
            } else {
                response.getWriter().println("Cryptex Server Down For Maintenance, Please Try Again !");
            }
        }
        response.sendRedirect("../index.html");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("invalid request");
    }
}
