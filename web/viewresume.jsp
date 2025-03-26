<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*, javax.servlet.http.*"%>
<%@page import="java.util.List"%>

<%
    // Retrieve the username from the session
    String username = (String) session.getAttribute("user");
    System.out.println("wertyui" + username);

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/porfolio";  // Change this to your DB URL
    String dbUser = "root";  // Replace with your DB username
    String dbPassword = "root";  // Replace with your DB password
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Fetch all resumes from the database for the logged-in user
        String sql = "SELECT * FROM resumes WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);  // Only fetch the resumes for the logged-in user
        rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Uploaded Resumes</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fc;
                margin: 0;
                padding: 0;
            }

            h2 {
                text-align: center;
                margin-top: 50px;
                color: #333;
            }

            table {
                position: absolute;
                top: 200px;
                left: 350px;
                width: 60%;
                margin: 20px auto;
                border-collapse: collapse;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 12px;
                text-align: center;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .button {
                padding: 8px 16px;
                font-size: 14px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                text-align: center;
                margin-left: 10px;
            }

            .button-download {
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
            }

            .button-download:hover {
                background-color: #45a049;
            }

            .button-delete {
                background-color: #f44336;
                color: white;
            }

            .button-delete:hover {
                background-color: #e53935;
            }

            .button-update {
                background-color: #ffa500;
                color: white;
            }

            .button-update:hover {
                background-color: #ff7f00;
            }
        </style>
    </head>
    <body>
        <jsp:include page="includesidebar.jsp"/>
        <h2>Uploaded Resumes</h2>

        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>File Name</th>
                    <th style="text-align: center">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        String fileName = rs.getString("file_name");
                        String filePath = rs.getString("file_path");
                %>
                <tr>
                    <td><%= username%></td>
                    <td><%= fileName%></td>
                    <td>
                        <!--                     Download Button 
                                            <a href="download.jsp">
                                                <button class="button button-download"></button>Download
                                            </a>-->
                        <button class="button button-download" onclick="viewPDF()">View PDF</button>
                     
                        <!-- Delete Button -->
                        <form action="deleteResume.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="filePath" value="<%= filePath%>">
                            <input type="hidden" name="fileName" value="<%= fileName%>">
                            <input type="hidden" name="username" value="<%= username%>">
                            <button type="submit" class="button button-delete">Delete</button>
                        </form>


                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
  <iframe id="pdfViewer" 
        style="width: 60%; height: 600px; border: none; display: none;margin-left: 400px;" 
        src=""></iframe>

                        <script>
                            function viewPDF() {
                                var iframe = document.getElementById("pdfViewer");
                                iframe.src = "view.jsp"; // Calls JSP page to stream the PDF
                                iframe.style.display = "block";
                            }
                        </script>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>

    </body>
    <script>

    </script>
</html>
