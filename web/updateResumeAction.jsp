<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%

    String username = request.getParameter("username");
    String oldFileName = request.getParameter("oldFileName");
    String oldFilePath = request.getParameter("oldFilePath");
    String uploadedFile = null;
    System.out.println(username);
     System.out.println(oldFileName);
      System.out.println(oldFilePath);
       System.out.println(username);
    
    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {
            if (!item.isFormField()) {
                String fileName = item.getName();
                if (fileName != null && !fileName.isEmpty()) {
                    // Delete the old file from the server
                    File oldFile = new File(oldFilePath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }

                    // Save the new file
                    String filePath = "C:/uploads/" + fileName;  // Modify path as necessary
                    File uploadedFilePath = new File(filePath);
                    item.write(uploadedFilePath);
                    uploadedFile = filePath;
                }
            }
        }

        // Update the database
        String jdbcURL = "jdbc:mysql://localhost:3306/porfolio";  // Change to your DB URL
        String dbUser = "root";  // DB username
        String dbPassword = "root";  // DB password

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "UPDATE resumes SET file_name = ?, file_path = ? WHERE username = ? AND file_name = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uploadedFile);
            stmt.setString(2, uploadedFile);
            stmt.setString(3, username);
            stmt.setString(4, oldFileName);

            int result = stmt.executeUpdate();

            if (result > 0) {
                out.println("Resume updated successfully!");
                response.sendRedirect("viewUploadedResumes.jsp"); // Redirect to view page
            } else {
                out.println("Error updating resume.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while updating the resume.");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>
