<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%
    String fileName = (String) session.getAttribute("fileName");
    String filePath1 = (String) session.getAttribute("filePath");
    System.out.println(filePath1);
    System.out.println(fileName);
    // PDF file path
    String filePath = filePath1;  // Change as needed
    File pdfFile = new File(filePath);

    // Check if the file exists
    if (pdfFile.exists()) {
        FileInputStream fis = null;
        OutputStream pdfOutputStream = null;
        
        try {
            // Set the response content type for PDF
            response.setContentType("application/pdf");
            // Content-Disposition header to display the PDF inline in the browser
            response.setHeader("Content-Disposition", "inline; filename=" + pdfFile.getName());
            
            // Initialize FileInputStream and OutputStream
            fis = new FileInputStream(pdfFile);
            pdfOutputStream = response.getOutputStream();
            
            // Buffer to read the file in chunks
            byte[] buffer = new byte[1024];
            int bytesRead;
            
            // Read the file and write to the output stream
            while ((bytesRead = fis.read(buffer)) != -1) {
                pdfOutputStream.write(buffer, 0, bytesRead);
            }

            // Flush and close the output stream
            pdfOutputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
            // If there is an error reading or writing the file, send an error response
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the PDF file.");
        } finally {
            // Close resources in the finally block
            try {
                if (fis != null) {
                    fis.close();
                }
                if (pdfOutputStream != null) {
                    pdfOutputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    } else {
        // If the file doesn't exist, send a friendly message
        response.setContentType("text/html");
        out.println("<h3>File not found!</h3>");
    }
%>
