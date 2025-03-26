<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SSLC Details Form</title>
  <style>
    #container {
      max-width: 1200px;
      position: absolute;
      left: 60%;
      top: 100px;
      transform: translateX(-50%);
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      padding: 20px;
      height: 500px;
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
      color: #333;
      display: block;
    }

    .form-row input, .form-row select, .form-row textarea {
      width: 100%; /* Adjust width to fit two columns */
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    .form-row input[type="textarea"] {
      width: 100%;
    }

    #button {
      background-color: #4CAF50;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      width: 30%;
      cursor: pointer;
      display: block;
    
    }

    button:hover {
      background-color: #45a049;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      display: none; /* Initially hidden */
    }

    table, th, td {
      border: 1px solid #ccc;
    }

    th, td {
      padding: 10px;
      text-align: left;
    }

  </style>
</head>
<body>
    <jsp:include page="includesidebar.jsp"/>
    <div id="container">
    <h2>Enter SSLC Details</h2>
    <form action="submit_sslc.jsp" method="POST">
      <div class="form-row">
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="username" name="username" required>
        </div>

        <div class="form-group">
          <label for="school_name">School Name</label>
          <input type="text" id="school_name" name="school_name" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="board">Board of Education</label>
          <select id="board" name="board" required>
            <option value="CBSE">CBSE</option>
            <option value="ICSE">ICSE</option>
            <option value="State Board">State Board</option>
            <option value="Other">Other</option>
          </select>
        </div>

        <div class="form-group">
          <label for="completion_year">Year of Completion</label>
          <input type="number" id="completion_year" name="completion_year" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="marks">Marks Obtained (%)</label>
          <input type="number" id="marks" name="marks" min="0" max="100" required>
        </div>

        <div class="form-group">
          <label for="subjects">Subjects Taken</label>
          <textarea id="subjects" name="subjects" rows="4" style="height: 50px;" required></textarea>
        </div>
      </div>

        <button  id="button" type="submit">Submit Details</button>
    </form> <br>

    <a href="view_sslc_details.jsp"> <button id="viewTableBtn" style="background-color: black;color: white;font-weight: bolder;position: absolute;left: 300px;top: 445px;border-radius: 5px;height: 40px;width: 100px">View Table</button></a>

  </div>
</body>
</html>
