<%@page import="java.sql.*, java.util.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    // Get experience_id from the query string
    String experienceId = request.getParameter("experience_id");

    // Database connection setup
    String jdbcUrl = "jdbc:mysql://localhost:3306/porfolio"; // Replace with your actual DB name
    String dbUsername = "root";  // Replace with your DB username
    String dbPassword = "root";  // Replace with your DB password

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        // Establish a connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // SQL query to delete the experience record based on experience_id
        String sql = "DELETE FROM experience WHERE experience_id = ?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, experienceId);

        int rowsDeleted = pst.executeUpdate();

        if (rowsDeleted > 0) {
            // Redirect to the view-experience.jsp page after successful deletion
            response.sendRedirect("view-experience.jsp");
        } else {
            out.println("<h3>Failed to delete experience!</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        // Close database resources
        try {
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
