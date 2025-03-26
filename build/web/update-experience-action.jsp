<%@page import="java.sql.*, java.util.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    // Fetch the form data
    String experienceId = request.getParameter("experience_id");
    String companyName = request.getParameter("company_name");
    String jobTitle = request.getParameter("job_title");
    int yearsOfExperience = Integer.parseInt(request.getParameter("years_of_experience"));
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");
    String location = request.getParameter("location");
    String jobResponsibilities = request.getParameter("job_responsibilities");
    String skillsUsed = request.getParameter("skills_used");
    String achievements = request.getParameter("achievements");

    // Database connection setup
    String jdbcUrl = "jdbc:mysql://localhost:3306/porfolio"; 
    String dbUsername = "root";  
    String dbPassword = "root";  

    Connection conn = null;
    PreparedStatement pst = null;

    try {
        // Establish a connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // SQL query to update the experience details
        String sql = "UPDATE experience SET company_name = ?, job_title = ?, years_of_experience = ?, start_date = ?, end_date = ?, location = ?, job_responsibilities = ?, skills_used = ?, achievements = ? WHERE experience_id = ?";
        pst = conn.prepareStatement(sql);

        pst.setString(1, companyName);
        pst.setString(2, jobTitle);
        pst.setInt(3, yearsOfExperience);
        pst.setString(4, startDate);
        pst.setString(5, endDate);
        pst.setString(6, location);
        pst.setString(7, jobResponsibilities);
        pst.setString(8, skillsUsed);
        pst.setString(9, achievements);
        pst.setString(10, experienceId);

        int rowsUpdated = pst.executeUpdate();

        if (rowsUpdated > 0) {
            response.sendRedirect("viewExperince.jsp");
        } else {
            out.println("<h3>Failed to update experience!</h3>");
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
