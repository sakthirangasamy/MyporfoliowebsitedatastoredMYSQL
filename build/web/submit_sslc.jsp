<%@ page import="java.sql.*,java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>Submit SSLC Details</title>
  <script type="text/javascript">
    function redirectToView() {
      // After displaying the success or error message, redirect to the view page
      window.location.href = "view_sslc_details.jsp";
    }
  </script>
</head>
<body>
  <h2>SSLC Details Submission Status</h2>

  <%
    // Retrieve form data including the new username
    String username = request.getParameter("username");
    String schoolName = request.getParameter("school_name");
    String board = request.getParameter("board");
    String completionYear = request.getParameter("completion_year");
    String marks = request.getParameter("marks");
    String subjects = request.getParameter("subjects");

    // Database connection setup
    String dbURL = "jdbc:mysql://localhost:3306/porfolio"; // Your database URL
    String dbUser = "root"; // Your MySQL username
    String dbPassword = "root"; // Your MySQL password

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
      // Establish connection to database
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      // SQL query to insert data into the database, including username
      String sql = "INSERT INTO sslc_details (username, school_name, board, completion_year, marks, subjects) VALUES (?, ?, ?, ?, ?, ?)";

      // Prepare the statement
      stmt = conn.prepareStatement(sql);
      stmt.setString(1, username);
      stmt.setString(2, schoolName);
      stmt.setString(3, board);
      stmt.setInt(4, Integer.parseInt(completionYear));
      stmt.setInt(5, Integer.parseInt(marks));
      stmt.setString(6, subjects);

      // Execute the query
      int result = stmt.executeUpdate();

      if (result > 0) {
        // If successful, show success alert and redirect
        out.println("<script type='text/javascript'>");
        out.println("alert('Details submitted successfully!');");
        out.println("redirectToView();");
        out.println("</script>");
      } else {
        // If not successful, show error alert
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
        // Close the database connection
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  %>

</body>
</html>
