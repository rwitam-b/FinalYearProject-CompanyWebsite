
import crypto.SHA256;
import data.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ClientCompanyLogin extends HttpServlet {

    private static final String DB_LOCATION = "localhost";

    private String getParameterValue(HttpServletRequest R, String param) throws NullPointerException {
        String value = R.getParameter(param);
        if (value == null || value.isEmpty()) {
            throw new NullPointerException();
        } else {
            return value.trim();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("invalid request");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("Incoming Sign-In Request From " + request.getRemoteAddr());
            String guid = getParameterValue(request, "user_id");
            String password = getParameterValue(request, "user_pwd");
            password = new SHA256(password).getChecksum();
            System.out.println("Successfully Read All Form Parameters");
            Database DB = new Database(DB_LOCATION, "companydb", "root", "");
            if (DB.checkLogin(guid, password)) {
                String name = DB.getName(guid);
                HttpSession session = request.getSession();
                session.setAttribute("guid", guid);
                session.setAttribute("name", name);
                session.setMaxInactiveInterval(30 * 60);
                System.out.println(name + " Logged in successfully GUID@" + guid);
                response.sendRedirect("ClientCryptex/index.jsp");
            } else {
                System.out.println("Invalid Login Credentials for " + guid);
                response.getWriter().println("Invalid Login Credentials !");
            }
            DB.destroy();
        } catch (Exception e) {
            System.out.println("Error Occured In Company Sign-In !");
        }
    }
}
