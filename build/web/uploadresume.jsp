<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume Upload</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        header {
            background-color: #333;
            color: white;
            padding: 15px 0;
            text-align: center;
            font-size: 20px;
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        
        #container {
            height: 400px;
            width: 35%;
            position: absolute;
            left: 600px;
            top: 100px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="file"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            header {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <% String username = (String) session.getAttribute("user"); %>
    <jsp:include page="includesidebar.jsp" />
    
  
    
    <div id="container">
          <header>
        <h2>Upload Your Resume</h2>
    </header>
        <form action="uploadResume1.jsp" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="username">Username:</label>
                <!-- Automatically get the username from the session -->
                <input style="border: none;font-size: 20px;" type="text" name="username" value="<%=username%>">
            </div>
            
            <div class="form-group">
                <label for="resume">Choose your resume (PDF format):</label>
                <input type="file" name="resume" id="resume" accept="application/pdf" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Upload Resume">
            </div>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2025 Resume Upload Portal</p>
    </div>

</body>
</html>
