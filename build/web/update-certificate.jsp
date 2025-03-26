<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Certificate</title>
    <!-- Link to Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            width: 900px;
            position: absolute;
            top: 90px;
            left: 400px;
            padding: 30px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            height: 580px;
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
            margin-bottom: 20px;
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
    </style>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>

    <div class="form-container">
        <h2>Update Certificate Details</h2>

        <%
            String certID = request.getParameter("certID");
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
                        String certName = rs.getString("certification_name");
                        String qualification = rs.getString("qualification");
                        String organization = rs.getString("organization");
                        String issueDate = rs.getDate("issue_date").toString();
                        String expiryDate = rs.getDate("expiry_date").toString();
                        String certificationID = rs.getString("certification_id");
                        String certType = rs.getString("certification_type");
                        String certLevel = rs.getString("certification_level");
                        String duration = rs.getString("duration");
                        String status = rs.getString("status");
                        String certScore = rs.getString("certification_score");
                        String credentialURL = rs.getString("credential_url");
                        String contactInfo = rs.getString("contact_info");
                    %>

                    <form action="update-certificate-action.jsp" method="post">
                        <input type="hidden" name="certification_id" value="<%= certID %>">

                        <!-- First Row -->
                        <div class="form-row">
                            <div class="form-item">
                                <label>Certification Name:</label>
                                <input type="text" name="certification_name" class="form-control" value="<%= certName %>" required>
                            </div>

                            <div class="form-item">
                                <label>Qualification:</label>
                                <input type="text" name="qualification" class="form-control" value="<%= qualification %>" required>
                            </div>

                            <div class="form-item">
                                <label>Organization:</label>
                                <input type="text" name="organization" class="form-control" value="<%= organization %>" required>
                            </div>
                        </div><br>

                        <!-- Second Row -->
                        <div class="form-row">
                            <div class="form-item">
                                <label>Issue Date:</label>
                                <input type="date" name="issue_date" class="form-control" value="<%= issueDate %>" required>
                            </div>

                            <div class="form-item">
                                <label>Expiry Date:</label>
                                <input type="date" name="expiry_date" class="form-control" value="<%= expiryDate %>" required>
                            </div>

                            <div class="form-item">
                                <label>Certification ID:</label>
                                <input type="text" name="certification_id" class="form-control" value="<%= certificationID %>" readonly>
                            </div>
                        </div><br>

                        <!-- Third Row -->
                        <div class="form-row">
                            <div class="form-item">
                                <label>Certification Type:</label>
                                <input type="text" name="certification_type" class="form-control" value="<%= certType %>" required>
                            </div>

                            <div class="form-item">
                                <label>Certification Level:</label>
                                <input type="text" name="certification_level" class="form-control" value="<%= certLevel %>" required>
                            </div>

                            <div class="form-item">
                                <label>Duration:</label>
                                <input type="text" name="duration" class="form-control" value="<%= duration %>" required>
                            </div>
                        </div>
<br>
                        <!-- Fourth Row -->
                        <div class="form-row">
                            <div class="form-item">
                                <label>Status:</label>
                                <input type="text" name="status" class="form-control" value="<%= status %>" required>
                            </div>

                            <div class="form-item">
                                <label>Certification Score:</label>
                                <input type="text" name="certification_score" class="form-control" value="<%= certScore %>" required>
                            </div>

                            <div class="form-item">
                                <label>Credential URL:</label>
                                <input type="url" name="credential_url" class="form-control" value="<%= credentialURL %>" required>
                            </div>
                        </div>
<br>
                        <!-- Fifth Row -->
                        <div class="form-row">
                            <div class="form-item">
                                <label>Contact Info:</label>
                                <input type="text" name="contact_info" class="form-control" value="<%= contactInfo %>" required>
                            </div>
                        </div><br><br>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Update Certificate</button>
                    </form>

                    <%
                    } else {
                        out.println("Certificate not found.");
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
                out.println("Certificate ID is missing.");
            }
        %>
    </div>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>