<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.MultipartConfig, javax.servlet.http.Part" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error.jsp" %>

<%-- Database connection details --%>
<%
    String dbURL = "jdbc:mysql://localhost:3306/porfolio";
    String dbUser = "root";
    String dbPassword = "root";
%>

<%-- Handle form submission --%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Get form data
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String location = request.getParameter("location");
        String address = request.getParameter("address");

// Handle file upload
Part filePart = request.getPart("file1");
String fileName = "";

// Check if file was uploaded
if (filePart != null && filePart.getSize() > 0) {
    fileName = filePart.getSubmittedFileName();

    // Define upload directory to be C:/uploads
    String uploadDirectory = "C:/uploads/";

    // Create the directory if it doesn't exist
    File uploadDir = new File(uploadDirectory);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs(); // This will create the directory if it doesn't exist
    }

    // Save the uploaded file
    String filePath = uploadDirectory + File.separator + fileName;
    try {
        filePart.write(filePath);  // Write the uploaded file to the specified path
        out.println("<script>alert('File uploaded successfully');</script>");
    } catch (IOException e) {
        out.println("<script>alert('File upload failed');</script>");
        e.printStackTrace();
    }
} else {
    out.println("<script>alert('No file uploaded');</script>");
}


        // Database connection
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert data into the database
            String sql = "INSERT INTO users (username, password, email, contact, location, address, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.setString(4, contact);
            pstmt.setString(5, location);
            pstmt.setString(6, address);
            pstmt.setString(7, fileName); // Save the file name in the database

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<script>alert('User registered successfully!');</script>");
            } else {
                out.println("<script>alert('Failed to register user.');</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        } finally {
            // Close resources
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>