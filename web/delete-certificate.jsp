<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Certificate</title>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
    <%
        String certID = request.getParameter("certID");
        if (certID != null) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                // Register MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection to the database
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                // SQL query to delete certificate based on certID
                String sql = "DELETE FROM certifications WHERE certification_id = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, certID);

                // Execute the delete
                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Certificate deleted successfully.");
                } else {
                    out.println("Error deleting certificate.");
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
            out.println("Certificate ID is missing.");
        }
    %>
</body>
</html>
