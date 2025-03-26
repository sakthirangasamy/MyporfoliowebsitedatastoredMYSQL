<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certification Form</title>
        <!-- Link to Bootstrap CSS for styling -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Optional Custom Styling -->
        <style>
            .form-container {
                width: 1000px;
                position: absolute;
                top: 90px;
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
                width: 10%;
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
            <h3 class="text-center mb-4">Add Certification</h3>

            <form action="submit-certification.jsp" method="POST" enctype="multipart/form-data">

                <div class="form-row">
                    <!-- Username -->
                    <div class="form-item">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>

                    <!-- Qualification -->
                    <div class="form-item">
                        <label for="qualification">Qualification</label>
                        <input type="text" class="form-control" id="qualification" name="qualification" required>
                    </div>

                    <!-- Certification Name -->
                    <div class="form-item">
                        <label for="certification-name">Certification Name</label>
                        <input type="text" class="form-control" id="certification-name" name="certification-name" required>
                    </div>
                </div>

                <div class="form-row">
                    <!-- Issuing Organization -->
                    <div class="form-item">
                        <label for="organization">Issuing Organization</label>
                        <input type="text" class="form-control" id="organization" name="organization" required>
                    </div>

                    <!-- Issue Date -->
                    <div class="form-item">
                        <label for="issue-date">Issue Date</label>
                        <input type="date" class="form-control" id="issue-date" name="issue-date" required>
                    </div>

                    <!-- Expiry Date (Optional) -->
                    <div class="form-item">
                        <label for="expiry-date">Expiry Date (Optional)</label>
                        <input type="date" class="form-control" id="expiry-date" name="expiry-date">
                    </div>
                </div>

                <div class="form-row">
                    <!-- Certification ID -->
                    <div class="form-item">
                        <label for="certification-id">Certification ID</label>
                        <input type="text" class="form-control" id="certification-id" name="certification-id">
                    </div>

                    <!-- Certification Type -->
                    <div class="form-item">
                        <label for="certification-type">Certification Type</label>
                        <select class="form-control" id="certification-type" name="certification-type">
                            <option value="Professional">Professional</option>
                            <option value="Academic">Academic</option>
                            <option value="Online">Online</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- Certification Level -->
                    <div class="form-item">
                        <label for="certification-level">Certification Level</label>
                        <select class="form-control" id="certification-level" name="certification-level">
                            <option value="Beginner">Beginner</option>
                            <option value="Intermediate">Intermediate</option>
                            <option value="Advanced">Advanced</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <!-- Duration -->
                    <div class="form-item">
                        <label for="duration">Duration (Months/Years)</label>
                        <input type="text" class="form-control" id="duration" name="duration">
                    </div>

                    <!-- Certification Status -->
                    <div class="form-item">
                        <label for="status">Certification Status</label>
                        <select class="form-control" id="status" name="status">
                            <option value="Active">Active</option>
                            <option value="Expired">Expired</option>
                            <option value="Pending">Pending</option>
                        </select>
                    </div>
                    <!-- Certification Score/Grade (Optional) -->
                    <div class="form-item">
                        <label for="cert-score">Certification Score/Grade (Optional)</label>
                        <input type="text" class="form-control" id="cert-score" name="cert-score">
                    </div>
                </div>
                <div class="form-row">





                    <!-- Upload Certificate File (Optional) -->
                    <div class="form-item">
                        <label for="certificate-file">Upload Certificate (Optional)</label>
                        <input type="file" class="form-control" id="certificate-file" name="certificate-file">
                    </div>

                    <!-- Credential URL -->
                    <div class="form-item">
                        <label for="credential-url">Credential URL (Optional)</label>
                        <input type="url" class="form-control" id="credential-url" name="credential-url">
                    </div>

                    <!-- Credentialing Authority's Contact Information -->
                    <div class="form-item">
                        <label for="contact-info"> Authority's Contact Information (Optional)</label>
                        <input class="form-control" id="contact-info" name="contact-info"/>
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
