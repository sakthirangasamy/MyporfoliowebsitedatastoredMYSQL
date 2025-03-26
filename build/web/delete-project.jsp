<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Delete Project</title>
    </head>
    <body>
        <%
            String projectId = request.getParameter("projectId");
            if (projectId != null && !projectId.isEmpty()) {
                Connection con = null;
                PreparedStatement pst = null;

                try {
                    // Register MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to the database
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                    // SQL query to delete the project
                    String sql = "DELETE FROM projects WHERE project_id = ?";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, projectId);

                    int rowsAffected = pst.executeUpdate();
                    if (rowsAffected > 0) {
                        response.sendRedirect("viewproject.jsp"); // Redirect to the view page
                    } else {
                        out.println("Error: Project not found or could not be deleted.");
                    }

                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    try {
                        if (pst != null) pst.close();
                        if (con != null) con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.println("Project ID is missing.");
            }
        %>
    </body>
</html>
