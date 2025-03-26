<%@ page import="javax.servlet.http.*,java.sql.*,java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <title>View SSLC Details</title>
        <style>
            table {
                max-width: 40%;
                border-collapse: collapse;
                position: absolute;
                top: 100px;
                left: 560px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        </style>
    </head>
    <body>
        <jsp:include page="includesidebar.jsp"/>
        <h2>Welcome to the SSLC Details Table</h2>

        <%
            // Retrieve the user attribute from the session
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
                    String sql = "SELECT * FROM sslc_details WHERE username = ?";

                    pst = conn.prepareStatement(sql);
                    pst.setString(1, username);
                    rs = pst.executeQuery();

        %>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>School Name</th>
                    <th>Board</th>
                    <th>Year of Completion</th>
                    <th>Marks Obtained</th>
                    <th>Subjects Taken</th>
                </tr>
            </thead>
            <tbody>
                <%        // Loop through the result set and display the data in the table rows
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String schoolName = rs.getString("school_name");
                        String board = rs.getString("board");
                        int completionYear = rs.getInt("completion_year");
                        int marks = rs.getInt("marks");
                        String subjects = rs.getString("subjects");
                %>
                <tr>
                    <td><%= id%></td>
                    <td><%= username%></td> <!-- Display the username -->
                    <td><%= schoolName%></td>
                    <td><%= board%></td>
                    <td><%= completionYear%></td>
                    <td><%= marks%></td>
                    <td><%= subjects%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
              
            }
            }
        %>
 <a href="addsslc.jsp" class="btn btn-primary" style="background-color: black;color: white;position: absolute;top: 400px;left: 800px;">Go Back</a>
   
    </body>
</html>
