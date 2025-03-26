<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <style>
            /* Body Styling: Add background image */
            /*            body {
                            font-family: Arial, sans-serif;
                            background-image: url('https://www.example.com/background.jpg');  Replace with your online image URL 
                            background-size: cover;
                            background-position: center;
                            color: white;
                            margin: 0;
                            padding: 0;
                            height: 100vh;
                        }*/

            /* Table Styling */
            table {
                color: black;
                width: 40%; /* Adjusted table width for a better layout */
                letter-spacing: 0.3px;
                position: absolute;
                top: 90px;
                left: 500px;
                border-collapse: collapse;
                background-color: rgba(255, 255, 255, 0.8); /* Transparent white background for the table */
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); /* Soft shadow around the table */
            }

            table, th, td {
                border: 1px solid #ddd; /* Light border color for table */
                text-align: left;
                padding: 7px;
            }

            th {
                color: #fff; /* White text for header */
                background-color: #007BFF; /* Blue background for headers */
                font-weight: bold;
            }

            td {
                color: #333;
                font-weight: normal;
                background-color: white;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9; /* Alternating row colors */
            }

            tr:hover {
                background-color: #f1f1f1; /* Highlight row on hover */
            }

            /* Profile Header */
            td[colspan="2"] {
                text-align: center;
                font-size: 1.5em;
                background-color: #007BFF;
                color: white;
                font-weight: bold;
                padding: 20px;
            }

            hr {
                border: 0;
                height: 1px;
                background-color: lightgray;
                margin: 10px 0;
            }
        </style>
    </head>

    <body>
        <jsp:include page="includesidebar.jsp"/>

        <%
            String uname = (String) session.getAttribute("user");
        %>

        <table>
            <tr>
                <td style="text-align: center;" colspan="2">MY Profile</td>
            </tr>

            <%
                Connection con = null;
                PreparedStatement p = null;
                ResultSet r = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");
                    p = con.prepareStatement("SELECT * FROM users WHERE username = ?");
                    p.setString(1, uname);

                    r = p.executeQuery();

                    while (r.next()) {

                        String image = r.getString("image");
                        System.out.println(image);
                        String tid = r.getString("id");
                        String symbol = r.getString("username");
                        String name = r.getString("password");
                        String email = r.getString("email");
                        String location = r.getString("location");
                        String address = r.getString("address");
                        String contact = r.getString("contact");
            %>
            <tr>
                <td>Profile Picture</td>
                <td><img src='uploads/<%=image%>'</td>

            </tr>
            <tr>
                <td>S.NO</td>
                <td><%= tid%></td>
            </tr>
            <tr>
                <td>User Name</td>
                <td><%= symbol%></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><%= name%></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= email%></td>
            </tr>
            <tr>
                <td>Location</td>
                <td><%= location%></td>
            </tr>
            <tr>
                <td>Contact</td>
                <td><%= contact%></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%= address%></td>
            </tr>
            <%
                    }
                } catch (ClassNotFoundException e) {
                    out.println("JDBC Driver not found: " + e.getMessage());
                } catch (SQLException e) {
                    out.println("Database error: " + e.getMessage());
                } finally {
                    try {
                        if (r != null) {
                            r.close();
                        }
                        if (p != null) {
                            p.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (Exception e) {
                        out.println("Error closing resources: " + e.getMessage());
                    }
                }
            %>
        </table>
    </body>
</html>
