<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Certificate - Processing</title>
</head>

<body>
    <jsp:include page="includesidebar.jsp"/>
    <%
        String certID = request.getParameter("certification_id");
        String certName = request.getParameter("certification_name");
        String qualification = request.getParameter("qualification");
        String organization = request.getParameter("organization");
        String issueDate = request.getParameter("issue_date");
        String expiryDate = request.getParameter("expiry_date");
        String certType = request.getParameter("certification_type");
        String certLevel = request.getParameter("certification_level");
        String duration = request.getParameter("duration");
        String status = request.getParameter("status");
        String certScore = request.getParameter("certification_score");
        String credentialURL = request.getParameter("credential_url");
        String contactInfo = request.getParameter("contact_info");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Register MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

            // SQL query to update certificate details
            String sql = "UPDATE certifications SET certification_name = ?, qualification = ?, organization = ?, issue_date = ?, expiry_date = ?, certification_type = ?, certification_level = ?, duration = ?, status = ?, certification_score = ?, credential_url = ?, contact_info = ? WHERE certification_id = ?";
            pst = con.prepareStatement(sql);

            // Set parameters for the SQL query
            pst.setString(1, certName);
            pst.setString(2, qualification);
            pst.setString(3, organization);
            pst.setString(4, issueDate);
            pst.setString(5, expiryDate);
            pst.setString(6, certType);
            pst.setString(7, certLevel);
            pst.setString(8, duration);
            pst.setString(9, status);
            pst.setString(10, certScore);
            pst.setString(11, credentialURL);
            pst.setString(12, contactInfo);
            pst.setString(13, certID);

            // Execute the update
            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                out.println("Certificate details updated successfully.");
            } else {
                out.println("Error updating certificate details.");
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
    %>
</body>
</html>
