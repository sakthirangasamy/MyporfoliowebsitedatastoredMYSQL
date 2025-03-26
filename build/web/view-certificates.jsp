<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>View Certificates</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            table {
                max-width: 80%;
                /*border-collapse: collapse;*/
                position: absolute;
                top: 100px;
                left: 300px;

            }
            table,tr,td,th{
                border: 5px solid black;
            }
            th, td {
                padding: 5px;
                text-align: left;
                /*border-bottom: 1px solid #ddd;*/
            }
            th {
                background-color: #f2f2f2;
            }
            .action-buttons a {
                margin-right: 10px;
                /*                text-decoration: none;*/
            }
            th:nth-child(7){
                width: 80px;
                /*padding-left: 200px;*/
            }
        </style>
    </head>
    <body>
        <jsp:include page="includesidebar.jsp"/>
        <% String username1 = (String) session.getAttribute("user");%>
        <div class="container">
            <h2>Certification Details for Username: <%= username1%></h2>

            <table class="table" border='2px'>
                <thead>
                    <tr>
                        <th>Certification Name</th>

                        <th>Organization</th>

                        <th>Expiry Date</th>

                        <th>Status</th>

                        <th style="text-align: center;">Action</th> <!-- New column for Action -->
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

                                // SQL query to fetch certificate details based on username
                                String sql = "SELECT * FROM certifications WHERE username = ?";
                                pst = con.prepareStatement(sql);
                                pst.setString(1, username);
                                rs = pst.executeQuery();

                                // Loop through the result set and display data
                                while (rs.next()) {
                                    String certID = rs.getString("certification_id");
                    %>
                    <tr>

                        <td><%= rs.getString("certification_name")%></td>

                        <td><%= rs.getString("organization")%></td>

                        <td><%= rs.getDate("expiry_date")%></td>


                        <td><%= rs.getString("status")%></td>


                        <!-- Action buttons -->
                        <td class="action-buttons" style="text-align: center;">
                            <!-- View button -->
                            <a href="view-certificate-details.jsp?certID=<%= certID%>" class="btn btn-info">
                                <i class="fa fa-eye" aria-hidden="true"></i> View
                            </a>

                            <!-- Update button -->
                            <a href="update-certificate.jsp?certID=<%= certID%>" class="btn btn-warning">
                                <i class="fa fa-pencil" aria-hidden="true"></i> Update
                            </a>

                            <!-- Delete button -->
                            <a href="delete-certificate.jsp?certID=<%= certID%>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this certificate?');">
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
                            out.println("Username is required to display certificate details.");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
