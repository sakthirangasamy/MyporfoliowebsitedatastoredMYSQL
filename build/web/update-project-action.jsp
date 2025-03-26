    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Update Project Action</title>
    </head>
    <body>
        <%
            String projectId = request.getParameter("projectId");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String technologies = request.getParameter("technologies");
            String link = request.getParameter("link");
            String role = request.getParameter("role");
            String completionDate = request.getParameter("completion_date");
            String projectLevel = request.getParameter("project_level");

            if (projectId != null && !projectId.isEmpty()) {
                Connection con = null;
                PreparedStatement pst = null;
                try {
                    // Register MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to the database
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                    // SQL query to update project details
                    String sql = "UPDATE projects SET name = ?, description = ?, technologies = ?, link = ?, role = ?, completion_date = ?, project_level = ? WHERE project_id = ?";
                    pst = con.prepareStatement(sql);

                    // Set parameters
                    pst.setString(1, name);
                    pst.setString(2, description);
                    pst.setString(3, technologies);
                    pst.setString(4, link);
                    pst.setString(5, role);
                    pst.setDate(6, completionDate != null && !completionDate.isEmpty() ? java.sql.Date.valueOf(completionDate) : null);
                    pst.setString(7, projectLevel);
                    pst.setString(8, projectId);

                    // Execute the update
                    int rowsAffected = pst.executeUpdate();

                    if (rowsAffected > 0) {
                        // Redirect to view project details page
                        response.sendRedirect("view-project-details.jsp?projectId=" + projectId);
                    } else {
                        out.println("Error: Project could not be updated.");
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
                out.println("Error: Project ID is missing.");
            }
        %>
    </body>
</html>
