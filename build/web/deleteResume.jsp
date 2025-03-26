<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*, javax.servlet.http.*"%>
<%
    String filePath = request.getParameter("filePath");
    String fileName = request.getParameter("fileName");
    String username = request.getParameter("username");

    String jdbcURL = "jdbc:mysql://localhost:3306/porfolio";  // Change this to your DB URL
    String dbUser = "root";  // Replace with your DB username
    String dbPassword = "root";  // Replace with your DB password
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Connect to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Delete record from the database
        String sql = "DELETE FROM resumes WHERE file_name = ? AND username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, fileName);
        stmt.setString(2, username);
        
        int result = stmt.executeUpdate();

        if (result > 0) {
            // If the record is deleted from the database, delete the file from the server
            File fileToDelete = new File(filePath);
            if (fileToDelete.exists()) {
                fileToDelete.delete();  // Delete the file from the server
            }
            response.sendRedirect("viewresume.jsp");  // Redirect back to the resumes page
        } else {
            out.println("Error deleting the resume.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred while deleting the resume.");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
