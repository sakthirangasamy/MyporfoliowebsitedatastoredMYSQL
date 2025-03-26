import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(urlPatterns = {"/Reg_Login_Action"})
public class Reg_Login_Action extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement ps = null;

        try {
            HttpSession session = request.getSession();
            ServletContext sc = request.getSession().getServletContext();

            List<String> formData = new ArrayList<>();
            String finalImage = "";
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (!isMultipart) {
                System.out.println("File Not Uploaded");
            } else {
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    List<FileItem> items = upload.parseRequest(request);

    Iterator<FileItem> itr = items.iterator();
    while (itr.hasNext()) {
        FileItem item = itr.next();

        if (item.isFormField()) {
            String value = item.getString();
            formData.add(value);  // Add form field data if necessary
        } else {
            String itemName = item.getName();
            // Remove any unwanted characters from file name (optional)
            Pattern pattern = Pattern.compile("[.*]");
            Matcher matcher = pattern.matcher(itemName);
            StringBuffer buffer = new StringBuffer();

            while (matcher.find()) {
                matcher.appendReplacement(buffer, "");
            }

            // Get file extension
            int indexOfDot = itemName.lastIndexOf(".");
            String domainName = itemName.substring(indexOfDot);

            // Final file name without unwanted characters, keeping the extension
            finalImage = buffer.toString() + domainName;

            // Define the directory where you want to store the uploaded file
            String uploadDirectory = "C:/Users/admin/Documents/NetBeansProjects/MyPortfolio/web/uploads/";

            // Create the directory if it doesn't exist
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Create the 'uploads' directory if it doesn't exist
            }

            // Save the file to the specified path
            File savedFile = new File(uploadDirectory + File.separator + finalImage);
            item.write(savedFile);  // Write the file to the specified location

            System.out.println("File saved to: " + savedFile.getAbsolutePath());
        }
    }
}


            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/porfolio", "root", "root");
            String query = "INSERT INTO users (username, password, email, contact, location, address, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, formData.get(0));  // username
            ps.setString(2, formData.get(1));  // password
            ps.setString(3, formData.get(2));  // email
            ps.setString(4, formData.get(3));  // contact
            ps.setString(5, formData.get(4));  // location
            ps.setString(6, formData.get(5));  // address
            ps.setString(7, finalImage); // image

            ps.executeUpdate();

            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Successfully Registered User\")");
             out.println("window.location.href='sign-in.jsp'");
            out.println("</script>");

//            RequestDispatcher rd = request.getRequestDispatcher("sign-in.jsp");
//            rd.include(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Error: Try again\")");
            out.println("</script>");

            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.include(request, response);
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
                if (out != null) out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration and file uploads";
    }
}