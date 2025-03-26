<%@ page import="java.sql.*,java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generated Resume</title>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; margin: 20px; }
        .header { text-align: center; }
        .section-title { font-size: 24px; color: #333; }
        .section-content { margin-bottom: 20px; }
        .resume-container { max-width: 800px; margin: auto; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 8px; text-align: left; }
    </style>
</head>
<body>

    <div class="resume-container">
        <div class="header">
            <h1>Resume</h1>
            <h2>Generated for <%= session.getAttribute("username") %></h2>
        </div>

        <% 
            String username = (String) session.getAttribute("username");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String dbURL = "jdbc:mysql://localhost:3306/porfolio"; // Database URL
            String dbUser = "root"; // Database Username
            String dbPassword = "root"; // Database Password

            try {
                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Fetch profile details
                String profileSQL = "SELECT * FROM users WHERE username = ?";
                pstmt = conn.prepareStatement(profileSQL);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
        %>
                    <div class="section-title">My Profile</div>
                    <div class="section-content">
                        <strong>Name:</strong> <%= rs.getString("name") %><br>
                        <strong>Email:</strong> <%= rs.getString("email") %><br>
                        <strong>Phone:</strong> <%= rs.getString("phone") %><br>
                        <strong>Address:</strong> <%= rs.getString("address") %><br>
                    </div>
        <%
                }

                // Fetch education details
                String educationSQL = "SELECT * FROM diploma_details WHERE username = ?";
                pstmt = conn.prepareStatement(educationSQL);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
        %>
                    <div class="section-title">Education</div>
                    <div class="section-content">
                        <table>
                            <tr><th>Institution Name</th><td><%= rs.getString("institution_name") %></td></tr>
                            <tr><th>Degree</th><td><%= rs.getString("course_name") %></td></tr>
                            <tr><th>Year of Completion</th><td><%= rs.getInt("completion_year") %></td></tr>
                            <tr><th>Specialization</th><td><%= rs.getString("specialization") %></td></tr>
                            <tr><th>Marks</th><td><%= rs.getString("marks") %></td></tr>
                        </table>
                    </div>
        <%
                }

                // Fetch certification details
                String certificationSQL = "SELECT * FROM certifications WHERE username = ?";
                pstmt = conn.prepareStatement(certificationSQL);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
        %>
                    <div class="section-title">Certifications</div>
                    <div class="section-content">
                        <table>
                            <tr><th>Certificate Name</th><td><%= rs.getString("certificate_name") %></td></tr>
                            <tr><th>Issuer</th><td><%= rs.getString("issuer") %></td></tr>
                            <tr><th>Issue Date</th><td><%= rs.getDate("issue_date") %></td></tr>
                            <tr><th>Validity Date</th><td><%= rs.getDate("validity_date") %></td></tr>
                        </table>
                    </div>
        <%
                }

                // Fetch experience details
                String experienceSQL = "SELECT * FROM experience WHERE username = ?";
                pstmt = conn.prepareStatement(experienceSQL);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
        %>
                    <div class="section-title">Experience</div>
                    <div class="section-content">
                        <table>
                            <tr><th>Company Name</th><td><%= rs.getString("company_name") %></td></tr>
                            <tr><th>Position</th><td><%= rs.getString("position") %></td></tr>
                            <tr><th>Start Date</th><td><%= rs.getDate("start_date") %></td></tr>
                            <tr><th>End Date</th><td><%= rs.getDate("end_date") %></td></tr>
                            <tr><th>Description</th><td><%= rs.getString("description") %></td></tr>
                        </table>
                    </div>
        <%
                }

                // Fetch project details
                String projectSQL = "SELECT * FROM projects WHERE username = ?";
                pstmt = conn.prepareStatement(projectSQL);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();
                if (rs.next()) {
        %>
                    <div class="section-title">Projects</div>
                    <div class="section-content">
                        <table>
                            <tr><th>Project Title</th><td><%= rs.getString("project_title") %></td></tr>
                            <tr><th>Description</th><td><%= rs.getString("description") %></td></tr>
                            <tr><th>Technologies Used</th><td><%= rs.getString("technologies_used") %></td></tr>
                            <tr><th>Duration</th><td><%= rs.getString("duration") %></td></tr>
                        </table>
                    </div>
        <%
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

</body>
</html>
