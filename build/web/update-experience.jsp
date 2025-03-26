<%@page import="java.sql.*, java.util.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Experience</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Container style for the form */
        .form-container {
            max-width: 60%; /* Reduced container width */
         position: absolute;
         left: 300px;
         top: 100px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Title and headings */
        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            width: 10%;
            margin-top: 20px;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        /* Flexbox layout for form fields */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-item {
            flex: 1 1 45%; /* Two fields per row with some gap */
            min-width: 200px;
        }

        .form-control {
            height: 40px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
    <div class="container form-container">
        <h3>Update Experience</h3>
        
        <%
            // Get experience_id from the query string
            String experienceId = request.getParameter("experience_id");

            if (experienceId != null) {
                // Database connection setup
                String jdbcUrl = "jdbc:mysql://localhost:3306/porfolio"; // Replace with your actual DB name
                String dbUsername = "root";  // Replace with your DB username
                String dbPassword = "root";  // Replace with your DB password

                Connection conn = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    // Establish a connection to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                    // SQL query to fetch data based on experience_id
                    String sql = "SELECT * FROM experience WHERE experience_id = ?";
                    pst = conn.prepareStatement(sql);
                    pst.setString(1, experienceId);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        String companyName = rs.getString("company_name");
                        String jobTitle = rs.getString("job_title");
                        int yearsOfExperience = rs.getInt("years_of_experience");
                        String startDate = rs.getString("start_date");
                        String endDate = rs.getString("end_date");
                        String location = rs.getString("location");
                        String jobResponsibilities = rs.getString("job_responsibilities");
                        String skillsUsed = rs.getString("skills_used");
                        String achievements = rs.getString("achievements");
        %>

        <form action="update-experience-action.jsp" method="POST">
            <input type="hidden" name="experience_id" value="<%= experienceId %>">
            <div class="form-row">
                <!-- Company Name -->
                <div class="form-item">
                    <label for="company-name">Company Name</label>
                    <input type="text" class="form-control" id="company-name" name="company_name" value="<%= companyName %>" required>
                </div>
                
                <!-- Job Title -->
                <div class="form-item">
                    <label for="job-title">Job Title</label>
                    <input type="text" class="form-control" id="job-title" name="job_title" value="<%= jobTitle %>" required>
                </div>
            </div>

            <div class="form-row">
                <!-- Years of Experience -->
                <div class="form-item">
                    <label for="years-of-experience">Years of Experience</label>
                    <input type="number" class="form-control" id="years-of-experience" name="years_of_experience" value="<%= yearsOfExperience %>" required>
                </div>
                
                <!-- Start Date -->
                <div class="form-item">
                    <label for="start-date">Start Date</label>
                    <input type="date" class="form-control" id="start-date" name="start_date" value="<%= startDate %>" required>
                </div>
            </div>

            <div class="form-row">
                <!-- End Date -->
                <div class="form-item">
                    <label for="end-date">End Date</label>
                    <input type="date" class="form-control" id="end-date" name="end_date" value="<%= endDate %>" required>
                </div>
                
                <!-- Location -->
                <div class="form-item">
                    <label for="location">Location</label>
                    <input type="text" class="form-control" id="location" name="location" value="<%= location %>" required>
                </div>
            </div>

            <div class="form-row">
                <!-- Job Responsibilities -->
                <div class="form-item">
                    <label for="job-responsibilities">Job Responsibilities</label>
                    <textarea class="form-control" id="job-responsibilities" name="job_responsibilities" required><%= jobResponsibilities %></textarea>
                </div>
                
                <!-- Skills Used -->
                <div class="form-item">
                    <label for="skills-used">Skills Used</label>
                    <input type="text" class="form-control" id="skills-used" name="skills_used" value="<%= skillsUsed %>" required>
                </div>
                
            </div>
   <div class="form-row">
            <!-- Achievements -->
         <div class="form-item">
                <label for="achievements">Achievements</label>
                <textarea class="form-control" id="achievements" name="achievements" required><%= achievements %></textarea>
            </div>
             <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">Update Experience</button>
       
   </div>
            </form>

        <% 
                    } else {
                        out.println("<h3>Experience not found!</h3>");
                    }
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    // Close the database resources
                    try {
                        if (rs != null) rs.close();
                        if (pst != null) pst.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.println("<h3>Invalid Experience ID!</h3>");
            }
        %>
    </div>
    
    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>