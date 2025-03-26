<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%
    // Declare all form fields here to avoid reassigning
    String username = "";
    String qualification = "";
    String certName = "";
    String organization = "";
    String issueDate = "";
    String expiryDate = "";
    String certID = "";
    String certType = "";
    String certLevel = "";
    String duration = "";
    String status = "";
    String certScore = "";
    String credentialURL = "";
    String contactInfo = "";
    String uploadedFile = null;

    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);

        // Process the uploaded items (both form fields and file)
        for (FileItem item : items) {
            if (item.isFormField()) {
                // Process regular form fields
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                
                // Assign the field values to the variables
                if ("username".equals(fieldName)) {
                    username = fieldValue;
                } else if ("qualification".equals(fieldName)) {
                    qualification = fieldValue;
                } else if ("certification-name".equals(fieldName)) {
                    certName = fieldValue;
                } else if ("organization".equals(fieldName)) {
                    organization = fieldValue;
                } else if ("issue-date".equals(fieldName)) {
                    issueDate = fieldValue;
                } else if ("expiry-date".equals(fieldName)) {
                    expiryDate = fieldValue;
                } else if ("certification-id".equals(fieldName)) {
                    certID = fieldValue;
                } else if ("certification-type".equals(fieldName)) {
                    certType = fieldValue;
                } else if ("certification-level".equals(fieldName)) {
                    certLevel = fieldValue;
                } else if ("duration".equals(fieldName)) {
                    duration = fieldValue;
                } else if ("status".equals(fieldName)) {
                    status = fieldValue;
                } else if ("cert-score".equals(fieldName)) {
                    certScore = fieldValue;
                } else if ("credential-url".equals(fieldName)) {
                    credentialURL = fieldValue;
                } else if ("contact-info".equals(fieldName)) {
                    contactInfo = fieldValue;
                }
            } else {
                // Handle file upload
                String fileName = item.getName();
                if (fileName != null && !fileName.isEmpty()) {
                    // Save the file to a specific location on the server
                    String filePath = "C:/uploads/" + fileName;  // Modify this path as needed
                    File uploadedFilePath = new File(filePath);
                    item.write(uploadedFilePath); // Write the file to disk
                    uploadedFile = filePath;  // Store the file path for database insertion
                }
            }
        }
    }

    // Database connection and storing data
    Connection con = null;
    PreparedStatement pst = null;
    try {
        // Register MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/porfolio", "root", "root");

        // SQL insert statement
        String sql = "INSERT INTO certifications (username, qualification, certification_name, organization, issue_date, expiry_date, certification_id, certification_type, certification_level, duration, status, certification_score, credential_url, contact_info, certificate_file) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        pst = con.prepareStatement(sql);

        // Set parameters for the SQL query
        pst.setString(1, username);
        pst.setString(2, qualification);
        pst.setString(3, certName);
        pst.setString(4, organization);
        pst.setString(5, issueDate);
        pst.setString(6, expiryDate);
        pst.setString(7, certID);
        pst.setString(8, certType);
        pst.setString(9, certLevel);
        pst.setString(10, duration);
        pst.setString(11, status);
        pst.setString(12, certScore);
        pst.setString(13, credentialURL);
        pst.setString(14, contactInfo);

        // Store the file path in the database if uploaded
        if (uploadedFile != null) {
            pst.setString(15, uploadedFile);
        } else {
            pst.setNull(15, java.sql.Types.VARCHAR); // In case no file is uploaded
        }

        // Execute the query and check the result
        int rowsAffected = pst.executeUpdate();
        if (rowsAffected > 0) {
            response.getWriter().write("<script>alert('Certification details saved successfully.'); window.location.href='addcertification.jsp';</script>");
        } else {
            response.getWriter().write("<script>alert('Error saving certification details.'); window.location.href='addcertification.jsp';</script>");
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
