<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submit SSLC Details</title>
  <style>
    #container {
      max-width: 1200px;
      position: absolute;
      left: 50%;
      top: 100px;
      transform: translateX(-50%);
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      padding: 20px;
      height: auto;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
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
      margin-bottom: 5px;
      width: 100%; /* Make sure labels are full width */
    }

    .form-row input, .form-row select, .form-row textarea ,select{
      width: 90%; /* Two columns with space in between */
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
select{
      width: 90%; /* Two columns with space in between */
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    .form-row input[type="textarea"] {
      width: 100%;
    }

    .form-row textarea {
      width: 100%;
      height: 100px;
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
      margin: 0 auto;
    }

    #button:hover {
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

    /* Button for viewing the table */
    #viewTableBtn {
      background-color: black;
      color: white;
      font-weight: bolder;
      position: absolute;
      left: 80%;
      transform: translateX(-50%);
      top:525px;
      border-radius: 5px;
      height: 40px;
      width: 100px;
      cursor: pointer;
    }

    #viewTableBtn:hover {
      background-color: #444;
    }

  </style>
</head>
<body>
  <jsp:include page="includesidebar.jsp"/>
  <div id="container">
    <h2>Submit HSC Details</h2>
    <form action="submit_hsc_details.jsp" method="POST">
      <div class="form-row">
        <div class="form-column">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" required>
        </div>
        <div class="form-column">
          <label for="school_name">School Name:</label>
          <input type="text" id="school_name" name="school_name" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column">
          <label for="board">Board of Education</label>
          <select id="board" name="board" required>
            <option value="CBSE">CBSE</option>
            <option value="ICSE">ICSE</option>
            <option value="State Board">State Board</option>
            <option value="Other">Other</option>
          </select>
        </div>
        <div class="form-column">
          <label for="completion_year">Year of Completion:</label>
          <input type="number" id="completion_year" name="completion_year" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column">
          <label for="stream">Stream:</label>
          <select  id="stream" name="stream" required>
            <option value="Science">Science</option>
            <option value="Commerce">Commerce</option>
            <option value="Arts">Arts</option>
          </select>
        </div>
        <div class="form-column">
          <label for="marks">Marks Obtained (% or GPA):</label>
          <input type="text" id="marks" name="marks" required>
        </div>
      </div>

      <div class="form-row">
        <div class="form-column" style="width: 100%;">
          <label for="subjects">Subjects Taken:</label>
          <textarea id="subjects" name="subjects" rows="4" required></textarea>
        </div>
      </div>

      <button id="button" type="submit">Submit</button>
    </form>
    <a href="view_hsc_details.jsp"> 
      <button id="viewTableBtn">View Table</button>
    </a>
  </div>
</body>
</html>
