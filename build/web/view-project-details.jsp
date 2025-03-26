<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>View Project Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
       
        h2 {
            text-align: center;
            color: #333;
        }
        .table {
            /*display: inline-block;*/
            /*padding: 50px;*/
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 100px;
            position: absolute;
            left: 600px;
            top: 100px;
            padding-left: 50px;
        }
        .details p {
            font-size: 16px;
            line-height: 1.6;
            margin: 10px 0;
        }
        .details p span {
            font-weight: bold;
            color: #555;
        }
     
       #button-container {
            text-align: center;
            margin-top: 30px;
            margin-left: -670px;
        }
        #btn {
         
            background-color: black;
          
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        #btn:hover {
            background-color: #45a049;
        }
    </style>
    <body>
        <jsp:include page="includesidebar.jsp"/>
        <div class="container1">
            <h2>Project Details</h2>
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

                        // SQL query to fetch project details
                        String sql = "SELECT * FROM projects WHERE project_id = ?";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, projectId);
                        rs = pst.executeQuery();

                        // If the project is found, display details
                        if (rs.next()) {
            %>
            <table class="table">
                <tr><th>Project Name</th><td><%= rs.getString("name") %></td></tr>
                <tr><th>Description</th><td><%= rs.getString("description") %></td></tr>
                <tr><th>Technologies</th><td><%= rs.getString("technologies") %></td></tr>
                <tr><th>Link</th><td><%= rs.getString("link") %></td></tr>
                <tr><th>Role</th><td><%= rs.getString("role") %></td></tr>
                <tr><th>Completion Date</th><td><%= rs.getDate("completion_date") %></td></tr>
                <tr><th>Project Level</th><td><%= rs.getString("project_level") %></td></tr>
            </table>
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
      
      <button id="btn" onclick="window.history.back();">Go Back</button>
    </body>
</html>
