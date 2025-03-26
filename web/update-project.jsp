<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Update Project</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
     <style>
        .form-container {
            width: 400px;
            position: absolute;
            top: 90px;
            height: 600px;
            left: 650px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            margin-bottom: 30px;
            text-align: center;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            width: 40%;
            margin-left: 400px;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        /* Flexbox for 3 columns */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;  /* space between columns */
        }

        .form-item {
            flex: 1;
            min-width: 250px;
            max-width: 30%;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
        }

        .form-group {
           
            margin-bottom: 20px;
            margin-top: 10px;
        }
        #button{
            width: 300px;
            position: absolute;
            right:15px ;
            top: 550px;
        }
    </style>
    <body>
        <jsp:include page="includesidebar.jsp"/>
         <div class="form-container">
            <h2>Update Project</h2>
            <%
                String projectId = request.getParameter("projectId");
                if (projectId != null && !projectId.isEmpty()) {
                    Connection con = null;
                    PreparedStatement pst = null;
                    ResultSet rs = null;
                    try {
                        // Register MySQL driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish connection to the database
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                        // SQL query to fetch project details for editing
                        String sql = "SELECT * FROM projects WHERE project_id = ?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, projectId);
                        rs = pst.executeQuery();

                        // If the project is found, display a form to update its details
                        if (rs.next()) {
            %>
            <form action="update-project-action.jsp" method="post">
                <input type="hidden" name="projectId" value="<%= projectId %>">
                <div class="form-item">
                    <label for="name">Project Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name") %>" required>
                </div>
                <div class="form-item">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" required><%= rs.getString("description") %></textarea>
                </div>
                <div class="form-item">
                    <label for="technologies">Technologies</label>
                    <input type="text" class="form-control" id="technologies" name="technologies" value="<%= rs.getString("technologies") %>" required>
                </div>
                <div class="form-item">
                    <label for="link">Project Link</label>
                    <input type="url" class="form-control" id="link" name="link" value="<%= rs.getString("link") %>" required>
                </div>
                <div class="form-item">
                    <label for="role">Role</label>
                    <input type="text" class="form-control" id="role" name="role" value="<%= rs.getString("role") %>" required>
                </div>
                <div class="form-item">
                    <label for="completion_date">Completion Date</label>
                    <input type="date" class="form-control" id="completion_date" name="completion_date" value="<%= rs.getDate("completion_date") %>" required>
                </div>
                <div class="form-item">
                    <label for="project_level">Project Level</label>
                    <input type="text" class="form-control" id="project_level" name="project_level" value="<%= rs.getString("project_level") %>" required>
                </div>
                <button type="submit" id="button" class="btn btn-primary">Update Project</button>
            </form>
            <%
                        } else {
                            out.println("Project not found.");
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
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
        </div>
    </body>
</html>
