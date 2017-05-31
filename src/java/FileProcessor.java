
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 100)
public class FileProcessor extends HttpServlet {

    private static final String C_DETAILS_SERVER = "localhost";

    private static final String UPLOAD_DIRECTORY = "upload";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 10;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 50; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 100; // 50MB

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Incoming upload");
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            System.out.println("Request does not contain uploaded data");
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            String uploader = request.getSession().getAttribute("name").toString();
            String guid = request.getSession().getAttribute("guid").toString();
            String email = request.getSession().getAttribute("email").toString();
            // parses the request's content to extract file data
            List<FileItem> formItems = upload.parseRequest(request);

            // iterates over form's fields
            for (FileItem file : formItems) {
                // processes only fields that are not simple form fields
                String filename = file.getName();
                String size = String.valueOf(file.getSize());
                if (!file.isFormField()) {
                    // saves the file on disk
                    file.write(new File(uploadPath + File.separator + file.getName()));
                }

                // update file details in db
                CloseableHttpClient client = HttpClients.createDefault();
                HttpPost httpPost = new HttpPost("http://" + C_DETAILS_SERVER + ":8080/CryptexWebsite/FileUpload");
                List<NameValuePair> params = new ArrayList<NameValuePair>();
                params.add(new BasicNameValuePair("name", uploader));
                params.add(new BasicNameValuePair("guid", guid));
                params.add(new BasicNameValuePair("email", email));
                params.add(new BasicNameValuePair("filename", filename));
                params.add(new BasicNameValuePair("size", size));
                httpPost.setEntity(new UrlEncodedFormEntity(params));
                CloseableHttpResponse answer = client.execute(httpPost);
            }
            System.out.println("Upload has been done successfully!");
        } catch (Exception ex) {
            System.out.println("There was an error uploading the file");
        }
    }
}
