<%@page import="java.sql.*, java.io.*"%>
<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Experience</title>
</head>
<body>
    <%
        // Retrieving form parameters
        String username = request.getParameter("username");
        String companyName = request.getParameter("company-name");
        String jobTitle = request.getParameter("job-title");
        int yearsOfExperience = Integer.parseInt(request.getParameter("years-of-experience"));
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");
        String location = request.getParameter("location");
        String jobResponsibilities = request.getParameter("job-responsibilities");
        String skillsUsed = request.getParameter("skills-used");
        String achievements = request.getParameter("achievements");

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/porfolio"; // Replace with your actual DB name
        String dbUsername = "root";  // Replace with your DB username
        String dbPassword = "root";  // Replace with your DB password

        // SQL query to insert experience data into the database
        String sql = "INSERT INTO experience (username, company_name, job_title, years_of_experience, start_date, end_date, location, job_responsibilities, skills_used, achievements) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // Load and establish a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Prepare the statement
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set the values for the SQL query
            pstmt.setString(1, username);
            pstmt.setString(2, companyName);
            pstmt.setString(3, jobTitle);
            pstmt.setInt(4, yearsOfExperience);
            pstmt.setString(5, startDate);
            pstmt.setString(6, endDate);
            pstmt.setString(7, location);
            pstmt.setString(8, jobResponsibilities);
            pstmt.setString(9, skillsUsed);
            pstmt.setString(10, achievements);

            // Execute the insert query
            int result = pstmt.executeUpdate();

            // Provide feedback to the user based on the result
            if (result > 0) {
                out.println("<h3>Experience added successfully!</h3>");
            } else {
                out.println("<h3>Failed to add experience. Please try again.</h3>");
            }

            // Close the connections
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    %>
</body>
</html>
