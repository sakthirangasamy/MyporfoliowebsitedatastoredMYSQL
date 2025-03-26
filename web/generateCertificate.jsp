<%@page import="com.itextpdf.text.pdf.draw.LineSeparator"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="application/pdf" pageEncoding="UTF-8"%>
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

            // SQL query to fetch certificate details along with the username
            String sql = "SELECT * FROM certifications WHERE certification_id = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, certID);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Create a new PDF document
                Document document = new Document(PageSize.A4);
                PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
                document.open();

                // Set up fonts
                Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 36, Font.BOLD, BaseColor.DARK_GRAY);
                Font nameFont = new Font(Font.FontFamily.HELVETICA, 28, Font.BOLD, new BaseColor(0, 102, 204)); // Blue color
                Font contentFont = new Font(Font.FontFamily.COURIER, 16, Font.NORMAL, BaseColor.BLACK);
                Font smallerContentFont = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL, BaseColor.BLACK); // Smaller font
                Font smallFont = new Font(Font.FontFamily.HELVETICA, 12, Font.ITALIC, BaseColor.GRAY);

                // Add a decorative border
                PdfContentByte canvas = writer.getDirectContentUnder();
                Rectangle rect = new Rectangle(36, 36, PageSize.A4.getWidth() - 36, PageSize.A4.getHeight() - 36);
                rect.setBorder(Rectangle.BOX);
                rect.setBorderWidth(3);
                rect.setBorderColor(new BaseColor(102, 102, 102)); // Gray border
                canvas.rectangle(rect);

                // Add a background image (online image)
                try {
                    Image background = Image.getInstance(""); // Replace with your online image URL
                    background.scaleToFit(PageSize.A4.getWidth() - 36, PageSize.A4.getHeight()- 36);
                    background.setAbsolutePosition(0, 0);
                    background.setTransparency(new int[]{0x7F, 0x7F}); // Adjust transparency (optional)
                    document.add(background);
                } catch (Exception e) {
                    // Handle missing image
                    e.printStackTrace();
                }

                // Add side border design
                PdfContentByte contentByte = writer.getDirectContent();
                contentByte.setColorStroke(BaseColor.GRAY);
                contentByte.setLineWidth(2);
                contentByte.moveTo(50, 50); // Left border
                contentByte.lineTo(50, PageSize.A4.getHeight() - 50);
                contentByte.moveTo(PageSize.A4.getWidth() - 50, 50); // Right border
                contentByte.lineTo(PageSize.A4.getWidth() - 50, PageSize.A4.getHeight() - 50);
                contentByte.stroke();

                // Add decorative header
                Paragraph header = new Paragraph("Certificate of Excellence", new Font(Font.FontFamily.HELVETICA, 24, Font.BOLD, BaseColor.DARK_GRAY));
                header.setAlignment(Element.ALIGN_CENTER);
                header.setSpacingAfter(20);
                document.add(header);

                // Add Certificate Title
                Paragraph title = new Paragraph("Certificate of Achievement", titleFont);
                title.setAlignment(Element.ALIGN_CENTER);
                title.setSpacingAfter(30); // Increased space after title
                document.add(title);

                // Add a decorative line
                Paragraph line = new Paragraph();
                line.add(new Chunk("\n"));
                line.add(new Chunk(new LineSeparator(1, 100, new BaseColor(102, 102, 102), Element.ALIGN_CENTER, -1)));
                document.add(line);

                // Add recipient username (new part)
                String username = rs.getString("username"); // Retrieve the username from the database
                Paragraph usernamePara = new Paragraph("Name: " + username, nameFont);
                usernamePara.setAlignment(Element.ALIGN_CENTER);
                usernamePara.setSpacingAfter(10); // Space after username
                document.add(usernamePara);

                // Add recipient name
                Paragraph name = new Paragraph(rs.getString("certification_name"), nameFont);
                name.setAlignment(Element.ALIGN_CENTER);
                name.setSpacingAfter(20); // Increased space after name
                document.add(name);

                // Add main content with line gaps
                Paragraph content = new Paragraph();
                content.add(new Chunk("This is to certify that ", smallerContentFont)); // Use smaller font
                content.add(Chunk.NEWLINE);
                content.add(Chunk.NEWLINE);
                content.add(new Chunk(rs.getString("organization") + " ", nameFont)); // Keep name font as is
                content.add(Chunk.NEWLINE);
                content.add(Chunk.NEWLINE);
                content.add(new Chunk("has successfully completed the ", smallerContentFont)); // Use smaller font
                content.add(Chunk.NEWLINE);
                content.add(Chunk.NEWLINE);
                content.add(new Chunk(rs.getString("qualification") + " ", nameFont)); // Keep name font as is
                content.add(Chunk.NEWLINE);
                content.setAlignment(Element.ALIGN_CENTER);
                content.setSpacingAfter(60); // Increased space after content
                document.add(content);

                // Add details in a table
                PdfPTable table = new PdfPTable(2);
                table.setWidthPercentage(80);
                table.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.setSpacingBefore(20); // Increased space before table
                table.setSpacingAfter(30); // Increased space after table

                addTableRow(table, "Certification ID:", rs.getString("certification_id"), contentFont);
                addTableRow(table, "Issue Date:", rs.getDate("issue_date").toString(), contentFont);
                addTableRow(table, "Expiry Date:", rs.getDate("expiry_date").toString(), contentFont);
                addTableRow(table, "Certification Level:", rs.getString("certification_level"), contentFont);
                addTableRow(table, "Certification Score:", rs.getString("certification_score"), contentFont);

                document.add(table);

                // Add a decorative line
                document.add(line);

                // Add signature section
                Paragraph signature = new Paragraph();
                signature.add(new Chunk("Authorized Signature\n", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLACK)));
                signature.add(new Chunk("________________________\n", smallFont));
                signature.add(new Chunk("Date: " + new java.util.Date().toString(), smallFont));
                signature.setAlignment(Element.ALIGN_RIGHT);
                document.add(signature);

                // Add decorative footer
                Paragraph footer = new Paragraph("Issued by: Your Organization Name", new Font(Font.FontFamily.HELVETICA, 12, Font.ITALIC, BaseColor.GRAY));
                footer.setAlignment(Element.ALIGN_CENTER);
                footer.setSpacingBefore(20);
                document.add(footer);

                // Closing the document
                document.close();
            } else {
                out.println("No certificate found for this ID.");
            }
        } catch (Exception e) {
            e.printStackTrace();
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

<%!
    // Helper method to add rows to the table
    private void addTableRow(PdfPTable table, String label, String value, Font font) {
        PdfPCell cell1 = new PdfPCell(new Phrase(label, font));
        PdfPCell cell2 = new PdfPCell(new Phrase(value, font));
        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
    }
%>
