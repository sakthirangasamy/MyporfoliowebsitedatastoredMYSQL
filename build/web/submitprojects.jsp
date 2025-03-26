<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Project Insertion</title>
    <script type="text/javascript">
        // Check if there's an alertMessage and display it in an alert box
        <% 
            String alertMessage = (String) request.getAttribute("alertMessage");
            if (alertMessage != null) { 
        %>
            alert("<%= alertMessage %>");
        <% } %>
    </script>
</head>
<body>
<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String technologies = request.getParameter("technologies");
    String link = request.getParameter("link");
    String role = request.getParameter("role");
    String certificationId = request.getParameter("project-id");
    String completionDate = request.getParameter("date");
    String projectLevel = request.getParameter("project-level");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

        String sql = "INSERT INTO projects (username, name, description, technologies, link, role, project_id, completion_date, project_level) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);

        stmt.setString(1, username);
        stmt.setString(2, name);
        stmt.setString(3, description);
        stmt.setString(4, technologies);
        stmt.setString(5, link);
        stmt.setString(6, role);
        stmt.setString(7, certificationId);

        if (completionDate != null && !completionDate.isEmpty()) {
            stmt.setDate(8, Date.valueOf(completionDate));
        } else {
            stmt.setNull(8, Types.DATE);
        }

        stmt.setString(9, projectLevel);

        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            // Success: Set the alert message and redirect to the same page
            request.setAttribute("alertMessage", "Project added successfully!");
            out.println("<script type='text/javascript'>"
                        + "window.location.href = 'addproject.jsp';"
                        + "</script>");
        } else {
            // Failure: Set the alert message and redirect to the error page
            request.setAttribute("alertMessage", "Error while adding project!");
            out.println("<script type='text/javascript'>"
                        + "window.location.href = 'error.jsp';"
                        + "</script>");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("alertMessage", "Error: " + e.getMessage());
        out.println("<script type='text/javascript'>"
                    + "window.location.href = 'error.jsp';"
                    + "</script>");
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
