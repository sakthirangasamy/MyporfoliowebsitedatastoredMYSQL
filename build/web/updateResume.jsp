<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*, javax.servlet.http.*"%>

<%
    String username = request.getParameter("username");
    String oldFileName = request.getParameter("fileName");
    String oldFilePath = request.getParameter("filePath");
    System.out.println(username);
     System.out.println(oldFileName);
      System.out.println(oldFilePath);
       System.out.println(username);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Resume</title>
    <style>
        .form-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="file"] {
            padding: 10px;
        }
        .form-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Update Your Resume</h2>

<div class="form-container">
    <form action="updateResumeAction.jsp" method="post" enctype="multipart/form-data">
        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= username %>" readonly><br><br>
        
        <label for="oldFileName">Current Resume:</label>
        <input type="text" name="oldFileName" value="<%= oldFileName %>" readonly><br><br>
        
        <label for="resume">Choose New Resume (PDF format):</label>
        <input type="file" name="resume" accept="application/pdf" required><br><br>

        <input type="submit" value="Update Resume">
        <input type="hidden" name="oldFilePath" value="<%= oldFilePath %>">
    </form>
</div>

</body>
</html>
