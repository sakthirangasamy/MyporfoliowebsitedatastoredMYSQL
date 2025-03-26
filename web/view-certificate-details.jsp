<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Certificate Details</title>
    <style>
        .container {
            position: absolute;
            top: 110px;
            left: 550px;
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .details {
            display: inline-block;
            padding: 50px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 500px;
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
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        #btn:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        // JavaScript function to generate the certificate
        function generateCertificate(certID) {
            // Send a request to the server to generate the certificate
            window.location.href = "generateCertificate.jsp?certID=" + certID; // Will redirect to the JSP that generates the certificate
        }
    </script>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
    <div class="container">
      
        <%
            String certID = request.getParameter("certID");
            String certificate;
            if (certID != null) {
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    // Register MySQL driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to the database
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

                    // SQL query to fetch certificate details based on certID
                    String sql = "SELECT * FROM certifications WHERE certification_id = ?";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, certID);
                    rs = pst.executeQuery();

                    if (rs.next()) {
                        certificate=rs.getString("certificate_file");
                        // Display certificate details
                    %>
                        <div class="details">
                            <p><span>Certification Name: </span><%= rs.getString("certification_name") %></p>
                            <p><span>Qualification: </span><%= rs.getString("qualification") %></p>
                            <p><span>Organization: </span><%= rs.getString("organization") %></p>
                            <p><span>Issue Date: </span><%= rs.getDate("issue_date") %></p>
                            <p><span>Expiry Date: </span><%= rs.getDate("expiry_date") %></p>
                            <p><span>Certification ID: </span><%= rs.getString("certification_id") %></p>
                            <p><span>Certification Type: </span><%= rs.getString("certification_type") %></p>
                            <p><span>Certification Level: </span><%= rs.getString("certification_level") %></p>
                            <p><span>Duration: </span><%= rs.getString("duration") %></p>
                            <p><span>Status: </span><%= rs.getString("status") %></p>
                            <p><span>Certification Score: </span><%= rs.getString("certification_score") %></p>
                            <p><span>Credential URL: </span><%= rs.getString("credential_url") %></p>
                            <p><span>Contact Info: </span><%= rs.getString("contact_info") %></p>
                            <p><span>Certificate File: </span><%= rs.getString("certificate_file") %></p>
                        </div>
                   
      <div id="button-container">
    <!-- Generate Certificate Button -->
    <button id="btn" onclick="generateCertificate('<%= certID %>')">Generate Certificate</button>

    <!-- View Certificate Button -->
<!--    <button id="btn" onclick="viewCertificate('<%=  rs.getString("certificate_file")  %>')">View Certificate</button>-->

    <!-- Go Back Button -->
    <button id="btn" onclick="window.history.back();">Go Back</button>
</div>
 <%
                    } else {
                        out.println("<p style='color: red;'>No certificate found for this ID.</p>");
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
                out.println("<p style='color: red;'>Certificate ID is missing.</p>");
            }
        %>

<script>
    function viewCertificate(certFile) {
        if (certFile) {
            var filePath = "file:///C:/uploads/" + certFile;
            window.open(filePath, '_blank'); // Opens in a new tab
        } else {
            alert("Certificate file not found.");
        }
    }
</script>

    </div>
</body>
</html>
