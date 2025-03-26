<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>View Projects</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            table {
                max-width: 80%;
                position: absolute;
                top: 100px;
                left: 300px;
            }
            table, tr, td, th {
                border: 5px solid black;
            }
            th, td {
                padding: 5px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .action-buttons a {
                margin-right: 10px;
            }
            th:nth-child(7) {
                width: 80px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="includesidebar.jsp"/>
        <% String username1 = (String) session.getAttribute("user"); %>
        <div class="container">
            <h2>Project Details for Username: <%= username1 %></h2>

            <table class="table" border='2px'>
                <thead>
                    <tr>
                        <th>Project Name</th>
                   
                        <th>Technologies</th>
                       
                        <th>Role</th>
                        <th>Completion Date</th>
                     
                        <th style="text-align: center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String username = (String) session.getAttribute("user");
                        if (username != null && !username.isEmpty()) {
                            Connection con = null;
                            PreparedStatement pst = null;
                            ResultSet rs = null;

                            try {
                                // Register MySQL driver
                                Class.forName("com.mysql.cj.jdbc.Driver");

                                // Establish connection to the database
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                                // SQL query to fetch project details based on username
                                String sql = "SELECT * FROM projects WHERE username = ?";
                                pst = con.prepareStatement(sql);
                                pst.setString(1, username);
                                rs = pst.executeQuery();

                                // Loop through the result set and display data
                                while (rs.next()) {
                                    String projectId = rs.getString("project_id");
                    %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                     
                        <td><%= rs.getString("technologies") %></td>
                       
                        <td><%= rs.getString("role") %></td>
                        <td><%= rs.getDate("completion_date") %></td>
             

                        <!-- Action buttons -->
                        <td class="action-buttons" style="text-align: center;">
                            <!-- View button -->
                            <a href="view-project-details.jsp?projectId=<%= projectId %>" class="btn btn-info">
                                <i class="fa fa-eye" aria-hidden="true"></i> View
                            </a>

                            <!-- Update button -->
                            <a href="update-project.jsp?projectId=<%= projectId %>" class="btn btn-warning">
                                <i class="fa fa-pencil" aria-hidden="true"></i> Update
                            </a>

                            <!-- Delete button -->
                            <a href="delete-project.jsp?projectId=<%= projectId %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this project?');">
                                <i class="fa fa-trash" aria-hidden="true"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <%
                                }
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            } finally {
                                try {
                                    if (rs != null) {
                                        rs.close();
                                    }
                                    if (pst != null) {
                                        pst.close();
                                    }
                                    if (con != null) {
                                        con.close();
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        } else {
                            out.println("Username is required to display project details.");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
