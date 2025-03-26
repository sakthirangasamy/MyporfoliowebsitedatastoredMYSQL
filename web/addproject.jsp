<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Form</title>
        <!-- Link to Bootstrap CSS for styling -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Optional Custom Styling -->
        <style>
            .form-container {
                width: 1000px;
                position: absolute;
                top: 150px;
                left: 310px;
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
                margin-left: 800px;
            }

            .form-container button:hover {
                background-color: pink;
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
            <h3 class="text-center mb-4">Add Project</h3>

            <form action="submitprojects.jsp">

                <div class="form-row">
                    <!-- Username -->
                    <div class="form-item">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>

                    <!-- Qualification -->
                    <div class="form-item">
                        <label for="name">Project Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <!-- Certification Name -->
                    <div class="form-item">
                        <label for="description">Project Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                </div>

                <div class="form-row">
                    <!-- Issuing Organization -->
                    <div class="form-item">
                        <label for="technologies">Technologies Used</label>
                        <input type="text" class="form-control" id="technologies" name="technologies" required>
                    </div>

                    <!-- Issue Date -->
                    <div class="form-item">
                        <label for="link">Project Link</label>
                        <input type="text" class="form-control" id="link" name="link" required>
                    </div>

                    <!-- Expiry Date (Optional) -->
                    <div class="form-item">
                        <label for="role">Role</label>
                        <input type="text" class="form-control" id="role" name="role">
                    </div>
                </div>

                <div class="form-row">
                    <!-- Certification ID -->
                    <div class="form-item">
                        <label for="project-id">Project ID</label>
                        <input type="text" class="form-control" id="certification-id" name="project-id">
                    </div>
                    <div class="form-item">
                        <label for="date">Completion Date</label>
                        <input type="date" class="form-control" id="date" name="date">
                    </div>

                    <!-- Certification Level -->
                    <div class="form-item">
                        <label for="project-level">Project Level</label>
                        <select class="form-control" id="project-level" name="project-level">
                            <option value="Beginner">Beginner</option>
                            <option value="Intermediate">Intermediate</option>
                            <option value="Advanced">Advanced</option>
                        </select>
                    </div>
                </div>

               
             
                <!-- Submit Button -->
                <button type="submit" class="btn btn-warning">Add Project</button>

            </form>
        </div>

        <!-- Bootstrap JS and Dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
