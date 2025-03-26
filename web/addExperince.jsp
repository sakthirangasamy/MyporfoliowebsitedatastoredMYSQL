<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Experience Form</title>
        <!-- Link to Bootstrap CSS for styling -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom Styles -->
        <style>
            .form-container {
                width: 600px;
                position: absolute;
                top: 90px;
                left: 510px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .form-container label {
                font-weight: bold;
                margin-top: 10px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
            }

            /* Flexbox for 3 columns */
            .form-row {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;  /* space between columns */
            }

            .form-item {
                flex: 1;
                min-width: 250px;
                max-width: 30%;
            }

            .form-container textarea {
                height: 150px;
            }

            .form-container button {
                width: 15%;
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                margin-top: 20px;
                margin-left: 450px;
            }

            .form-container button:hover {
                background-color: #0056b3;
            }

            @media (max-width: 768px) {
                .form-item {
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="includesidebar.jsp"/>

        <div class="form-container">
            <h3 class="text-center mb-4">Add Experience</h3>

            <form action="submit-experience.jsp">

                <div class="form-row">
                    <!-- Experience ID (Hidden or Readonly if auto-generated) -->
<!--                    <div class="form-item">
                        <label for="experience-id">Experience ID (Auto-generated)</label>
                        <input type="text" class="form-control" id="experience-id" name="experience-id" readonly value="Auto-generated">
                    </div>-->

                    <!-- Username -->
                    <div class="form-item">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                      <!-- Company Name -->
                    <div class="form-item">
                        <label for="company-name">Company Name</label>
                        <input type="text" class="form-control" id="company-name" name="company-name" required>
                    </div>

                </div>

                <div class="form-row">
                  
                    <!-- Job Title -->
                    <div class="form-item">
                        <label for="job-title">Job Title</label>
                        <input type="text" class="form-control" id="job-title" name="job-title" required>
                    </div>
                      <!-- Years of Experience -->
                    <div class="form-item">
                        <label for="years-of-experience">Years of Experience</label>
                        <input type="number" class="form-control" id="years-of-experience" name="years-of-experience" required>
                    </div>

                </div>

                <div class="form-row">
                  
                    <!-- Start Date -->
                    <div class="form-item">
                        <label for="start-date">Start Date</label>
                        <input type="date" class="form-control" id="start-date" name="start-date" required>
                    </div>

                    <!-- End Date -->
                    <div class="form-item">
                        <label for="end-date">End Date</label>
                        <input type="date" class="form-control" id="end-date" name="end-date">
                    </div>
                </div>

                <div class="form-row">
                    <!-- Location -->
                    <div class="form-item">
                        <label for="location">Location</label>
                        <input type="text" class="form-control" id="location" name="location" required>
                    </div>

                    <!-- Job Responsibilities -->
                    <div class="form-item">
                        <label for="job-responsibilities">Job Responsibilities</label>
                        <textarea class="form-control" id="job-responsibilities" name="job-responsibilities" required></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <!-- Skills Used -->
                    <div class="form-item">
                        <label for="skills-used">Skills Used</label>
                        <input type="text" class="form-control" id="skills-used" name="skills-used" required>
                    </div>

                    <!-- Achievements -->
                    <div class="form-item">
                        <label for="achievements">Achievements</label>
                        <textarea class="form-control" id="achievements" name="achievements"></textarea>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary">Submit</button>

            </form>
        </div>

        <!-- Bootstrap JS and Dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
