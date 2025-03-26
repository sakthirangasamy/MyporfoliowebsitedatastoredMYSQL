<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Status</title>
</head>
<body>
    <%
        // Get form data from request
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/porfolio";
        String dbUsername = "root"; // Change to your MySQL username
        String dbPassword = "root"; // Change to your MySQL password

        // Connection object
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String email,phone,image,location;
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL query to select user with matching credentials
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

            // Prepare the statement and set parameters
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            

            // Execute the query
            rs = pst.executeQuery();

            if (rs.next()) {
                location=rs.getString("location");
                email=rs.getString("email");
                  phone=rs.getString("contact");
                    image=rs.getString("image");
                 session.setAttribute("user", username);
                  session.setAttribute("location", location);
                  session.setAttribute("email", email);
                    session.setAttribute("image", image);
                   session.setAttribute("phone", phone);
                   
                 out.println("<script type=\"text/javascript\">");
                        out.println("alert(\"WELCOME '" + username + "'\")");
                        out.println("window.location.href='userhome.jsp'");
                        out.println("</script>");
        // Redirect to admin home page
//        response.sendRedirect("userhome.jsp");
            } else {
                out.println("<script>");
        out.println("alert('Invalid username or password! Please try again.');");
        out.println("window.location.href = 'sign-in.jsp';"); // Redirect back to sign-in
        out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
        } finally {
            // Close the database connections
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
