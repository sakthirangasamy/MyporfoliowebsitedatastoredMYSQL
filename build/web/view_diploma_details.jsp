<%@ page import="java.sql.*,java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>View Diploma Details</title>
  <style>
       table {
                max-width: 40%;
                border-collapse: collapse;
                position: absolute;
                top: 200px;
                left: 560px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        </style>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
  <h2>View Diploma Details</h2>

  <%
    // Retrieve the username from session or from the request
    String username = (String) session.getAttribute("user");
    
    // Database connection setup
    String dbURL = "jdbc:mysql://localhost:3306/porfolio"; // Your database URL
    String dbUser = "root"; // Your MySQL username
    String dbPassword = "root"; // Your MySQL password

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
      // Establish connection to the database
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
      
      // SQL query to fetch the Diploma details for the given user
      String sql = "SELECT * FROM diploma_details WHERE username = ?";
      
      // Prepare the statement
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, username);
      
      // Execute the query
      rs = pstmt.executeQuery();

      // If records are found, display them in a table
      if (rs.next()) {
  %>

  <table>
    <tr>
      <th>Institute Name</th>
      <th>Diploma Course Name</th>
      <th>Year of Completion</th>
      <th>Marks Obtained</th>
      <th>Specialization</th>
    </tr>
    <tr>
      <td><%= rs.getString("institute_name") %></td>
      <td><%= rs.getString("course_name") %></td>
      <td><%= rs.getInt("completion_year") %></td>
      <td><%= rs.getString("marks") %></td>
      <td><%= rs.getString("specialization") %></td>
    </tr>
  </table>

  <%
      } else {
  %>
  <p>No Diploma details found for user: <%= username %></p>
  <%
      }
    } catch (Exception e) {
      e.printStackTrace();
      out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
      try {
        // Close database resources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  %>
  <a href="submit_diploma_details.jsp" class="btn btn-primary" style="background-color: black;color: white;position: absolute;top: 400px;left: 800px;">Go Back</a>

</body>
</html>
