<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<html>
<head>
    <title>Download Resumes</title>
</head>
<body>
    <h2>Download Resumes</h2>
    <%
        String jdbcURL = "jdbc:mysql://localhost:3306/porfolio"; // Change to your DB URL
        String dbUser = "root";  // DB username
        String dbPassword = "root";  // DB password
        List<String> fileNames = new ArrayList<>();
        
        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "SELECT * FROM resumes"; // Get all resume details
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String fileName = rs.getString("file_name");
                fileNames.add(fileName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Display file download links
        for (String fileName : fileNames) {
            String filePath = "C:/uploads/" + fileName; // Assuming files are in /uploads/ folder
            out.println("<a href='downloadServlet?fileName=" + fileName + "'>" + fileName + "</a><br>");
        }
    %>
</body>
</html>
