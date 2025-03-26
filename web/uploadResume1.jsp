<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String username = "";
    String uploadedFile = null;

    // Check if the request is of type multipart
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set the upload limit and temp file size limit
        upload.setSizeMax(1024 * 1024 * 10); // 10MB max file size

        try {
            // Parse the request to get file items
            List<FileItem> items = upload.parseRequest(request);

            // Process the uploaded items
            for (FileItem item : items) {
                if (item.isFormField()) {
                    // Handle form fields (like username)
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();

                    if ("username".equals(fieldName)) {
                        username = fieldValue;
                    }
                } else {
                    // Handle file upload
                    String fileName = item.getName();
                    if (fileName != null && !fileName.isEmpty()) {
                        // Define the upload directory on the server
                        String uploadDir = application.getRealPath("/uploads/");
                        File dir = new File(uploadDir);
                        if (!dir.exists()) {
                            dir.mkdirs(); // Create the directory if it doesn't exist
                        }

                        // Generate file path and ensure unique names to avoid conflicts
                        String filePath = uploadDir + File.separator + fileName;
                        File uploadedFilePath = new File(filePath);

                        // Write the uploaded file to the specified location
                        item.write(uploadedFilePath);
                        uploadedFile = filePath; // Store the file path for database insertion
                        out.println("File uploaded successfully at: " + filePath); // Debugging
                    } else {
                        out.println("No file selected!"); // Debugging
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while processing the file upload.");
        }
    }

    // If file is uploaded successfully, insert into the database
    if (uploadedFile != null && !uploadedFile.isEmpty()) {
        // Connect to the database (MySQL)
        String jdbcURL = "jdbc:mysql://localhost:3306/porfolio";
        String dbUser = "root";
        String dbPassword = "root";
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load the JDBC driver and connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to insert the uploaded file information into the database
            String sql = "INSERT INTO resumes (username, file_name, file_path) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);  // Username
            stmt.setString(2, new File(uploadedFile).getName()); // File name only
            stmt.setString(3, uploadedFile); // Full file path

            // Execute the query
            int result = stmt.executeUpdate();
            if (result > 0) {
                session.setAttribute("fileName", new File(uploadedFile).getName());
                session.setAttribute("filePath", uploadedFile);
                out.println("Resume uploaded and saved successfully!");
            } else {
                out.println("Error uploading resume.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while uploading the resume.");
        } finally {
            try {
                // Close the database resources
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        out.println("No file uploaded.");
    }
%>
