<%@ page import="java.sql.*,java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>SSLC Details Submission Status</title>
  <script type="text/javascript">
    function redirectToView() {
      window.location.href = "view_hsc_details.jsp";
    }
  </script>
</head>
<body>
  <h2>SSLC Details Submission Status</h2>

  <%
    // Retrieve form data
    String username = request.getParameter("username");
    String schoolName = request.getParameter("school_name");
    String board = request.getParameter("board");
    String completionYear = request.getParameter("completion_year");
    String stream = request.getParameter("stream");
    String marks = request.getParameter("marks");
    String subjects = request.getParameter("subjects");

    // Database connection setup
    String dbURL = "jdbc:mysql://localhost:3306/porfolio"; // Your database URL
    String dbUser = "root"; // Your MySQL username
    String dbPassword = "root"; // Your MySQL password

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
      // Establish connection to the database
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      // SQL query to insert data into the database
      String sql = "INSERT INTO hsc_details (username, school_name, board, completion_year, stream, marks, subjects) VALUES (?, ?, ?, ?, ?, ?, ?)";

      // Prepare the statement
      stmt = conn.prepareStatement(sql);
      stmt.setString(1, username);
      stmt.setString(2, schoolName);
      stmt.setString(3, board);
      stmt.setInt(4, Integer.parseInt(completionYear));
      stmt.setString(5, stream);
      stmt.setString(6, marks);
      stmt.setString(7, subjects);

      // Execute the query
      int result = stmt.executeUpdate();

      // Success or error message
      if (result > 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('Details submitted successfully!');");
        out.println("redirectToView();");
        out.println("</script>");
      } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('Error submitting details. Please try again.');");
        out.println("</script>");
      }
    } catch (Exception e) {
      e.printStackTrace();
      out.println("<script type='text/javascript'>");
      out.println("alert('Error: " + e.getMessage() + "');");
      out.println("</script>");
    } finally {
      try {
        // Close database resources
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  %>

</body>
</html>
