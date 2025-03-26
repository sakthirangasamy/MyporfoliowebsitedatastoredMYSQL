<%@page import="java.sql.*, java.util.*"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Experience</title>
    <!-- Link to Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
           max-width: 60%;
            font-size: 30px;
            position: absolute;
            left: 300px;
            top: 150px;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
              
        }
        th, td {
            padding: 10px;
            text-align: left;
         
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons a {
            margin-right: 10px;
        }
      
          th:nth-child(1), td:nth-child(1) { width: 1%; } /* Company Name */
        th:nth-child(2), td:nth-child(2) { width: 2%; } /* Job Title */
        th:nth-child(3), td:nth-child(3) { width: 8%; }  /* Years of Experience */
        th:nth-child(4), td:nth-child(4) { width: 7%; } /* Start Date */
        th:nth-child(5), td:nth-child(5) { width: 7%; } /* End Date */
        th:nth-child(6), td:nth-child(6) { width: 7%; } /* Location */
        th:nth-child(7), td:nth-child(7) { width: 8%; } /* Job Responsibilities */
        th:nth-child(8), td:nth-child(8) { width: 8%; } /* Skills Used */
        th:nth-child(9), td:nth-child(9) { width: 8%; } /* Achievements */
        th:nth-child(10), td:nth-child(10) { width: 30%; } /* Action (buttons) */
    </style>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
    <div class="container">
        <h3>Experience Details</h3>

        <table class="table" cellpadding='10px'>
            <thead>
                <tr>
                    <th>Company Name</th>
                    <th>Job Title</th>
                    <th>YOE</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Location</th>
                    <th>Job Response</th>
                    <th>Skills Used</th>
                    <th>Achievements</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the username of the logged-in user
                    String username = (String) session.getAttribute("user");
                    
                    if (username != null && !username.isEmpty()) {
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

                            // SQL query to fetch experience data based on username
                            String sql = "SELECT * FROM experience WHERE username = ?";
                            pst = conn.prepareStatement(sql);
                            pst.setString(1, username);
                            rs = pst.executeQuery();

                            // Loop through the result set and display data in table rows
                            while (rs.next()) {
                                String experienceId = rs.getString("experience_id");
                %>
                <tr>
                    <td><%= rs.getString("company_name") %></td>
                    <td><%= rs.getString("job_title") %></td>
                    <td><%= rs.getInt("years_of_experience") %></td>
                    <td><%= rs.getDate("start_date") %></td>
                    <td><%= rs.getDate("end_date") %></td>
                    <td><%= rs.getString("location") %></td>
                    <td><%= rs.getString("job_responsibilities") %></td>
                    <td><%= rs.getString("skills_used") %></td>
                    <td><%= rs.getString("achievements") %></td>
                    <td>
                        <!-- Action buttons (Update or Delete) -->
                        <a href="update-experience.jsp?experience_id=<%= experienceId %>" class="btn btn-warning">Update</a><br><br>
                        <a href="delete-experience.jsp?experience_id=<%= experienceId %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this experience?');">Delete</a>
                    </td>
                </tr>
                <%
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
                        out.println("<h3>No user is logged in!</h3>");
                    }
                %>
            </tbody>
        </table>

        <!-- Button to Add New Experience -->
        <a href="addExperince.jsp" class="btn btn-primary" style="background-color: black;color: white;position: absolute;top: 400px;left: 800px;">Add New Experience</a>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
