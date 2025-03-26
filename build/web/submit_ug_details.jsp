<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submit UG Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    #container {
      max-width: 800px;
      position: absolute;
      left: 60%;
      top: 100px;
      transform: translateX(-50%);
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    .form-row {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin-bottom: 15px;
    }

    .form-row label {
      font-weight: bold;
      margin-bottom: 5px;
      display: block;
      color: #333;
      width: 100%; /* Ensure labels take full width */
    }

    .form-column {
      width: 48%; /* Two columns with space in between */
      padding: 10px;
      box-sizing: border-box;
    }

    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    #button {
      background-color: #4CAF50;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 10px;
      width: 30%;
      cursor: pointer;
    }

    #button:hover {
      background-color: #45a049;
    }

  </style>
</head>
<body>
  <jsp:include page="includesidebar.jsp"/>
  <div id="container">
    <h2>Submit UG Details</h2>
    <form action="submit_ug_details1.jsp" method="POST">
      <div class="form-row">
        <div class="form-column">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
        </div>
        <div class="form-column">
          <label for="college_name">College/University Name:</label>
          <input type="text" id="college_name" name="college_name" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column">
          <label for="degree">Degree (e.g., B.Sc, B.Com, B.Tech):</label>
          <input type="text" id="degree" name="degree" required>
        </div>
        <div class="form-column">
          <label for="completion_year">Year of Completion:</label>
          <input type="number" id="completion_year" name="completion_year" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column">
          <label for="major_subject">Major Subject:</label>
          <input type="text" id="major_subject" name="major_subject" required>
        </div>
        <div class="form-column">
          <label for="marks">Marks Obtained/CGPA:</label>
          <input type="text" id="marks" name="marks" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column" style="width: 100%;">
          <label for="specialization">Specialization (if any):</label>
          <input type="text" id="specialization" name="specialization">
        </div>
      </div>

      <button id="button" type="submit">Submit</button>
    </form>
    <a href="view_ug_details.jsp"> <button id="viewTableBtn" style="background-color: black;color: white;font-weight: bolder;position: absolute;left: 300px;top: 505px;border-radius: 5px;height: 40px;width: 180px">View Table</button></a>

  </div>
</body>
</html>
