<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />

        <style>
            /* Custom Styles */
            body {
                background-color: #f7f8fa;
            }
            .container{
                position: absolute;
                left: 100px;
                top: 0px;
            }
            .card {

                border-radius: 15px;
                max-width: 400px;
                width: 100%;
                margin: 60px 0px 200px 270px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Light shadow for the card */
                overflow: hidden; /* Ensure rounded corners on the card */
            }

            .card-header {
                background: linear-gradient(45deg, #007bff, #0056b3);
                color: white;
                height: 120px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 15px 15px 0 0; /* Rounded top corners */
            }

            .card-body {
                padding: 40px;
                background-color: #ffffff;
            }

            .form-label {
                font-size: 1rem;
                font-weight: 600;
            }

            .form-control {
                border: 1px solid #ccc;
                border-radius: 8px;
                padding: 12px;
                font-size: 1rem;
                transition: border-color 0.3s;
            }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            .input-group {
                margin-bottom: 20px; /* Add space between input fields */
            }

            .btn {
                border-radius: 10px;
                padding: 12px 20px;
                font-size: 1rem;
                transition: background-color 0.3s;
            }

            .btn.bg-gradient-primary {
                background: linear-gradient(45deg, #007bff, #0056b3);
            }

            .btn.bg-gradient-primary:hover {
                background: linear-gradient(45deg, #0056b3, #007bff);
                color: white;
            }

            .social-login-btn {
                display: inline-block;
                border-radius: 50%;
                padding: 10px;
                padding-right: 100px;
                margin: 10px 230px 0px 0px;
                color: white;
            }

            .social-login-btn i {
                font-size: 50px;
            }
            .social-login-btn:hover {
                color: black;
            }

            .text-primary {
                color: #007bff !important;
            }

            .gradient-text {
                background: linear-gradient(45deg, black, white,pink,red);
                -webkit-background-clip: text;
                font-size: 30px;
                position: relative;
                left: 200px;
                top: -40px;
                color: transparent;
            }
        </style>

    </head>

    <body>
        <jsp:include page="include.jsp"/>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <!-- Card with Sign-in Form -->
            <div class="card">

                <!-- Card Header with Social Login Buttons -->
                <div class="card-header">
                    <h4 class="font-weight-bolder mb-0 gradient-text">
                        SignUp
                    </h4>



                    <div class="row mt-2">
                        <div class="col-4">
                            <a class="social-login-btn" href="javascript:;">
                                <i class="fab fa-linkedin"></i>

                            </a>
                        </div>
                        <div class="col-4">
                            <a class="social-login-btn" href="javascript:;">
                                <i class="fab fa-github"></i>
                            </a>
                        </div>
                        <div class="col-4">
                            <a class="social-login-btn" href="javascript:;">
                                <i class="fab fa-google"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Card Body with Sign-in Form -->
                <div class="card-body">
                    <form role="form" class="text-start" action="Reg_Login_Action" method="post" enctype="multipart/form-data">
                        <!-- Username Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">UserName</label>
                            <input type="text" class="form-control" name="user" required placeholder="Enter Username" />
                        </div>

                        <!-- Password Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="pass" required placeholder="Enter Password" />
                            <small id="passwordHelp" class="form-text text-muted">
                                Your password must be at least 8 characters long.
                            </small>
                        </div>

                        <!-- File Upload Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Upload Image</label>
                            <input type="file" class="form-control" name="file1" required placeholder="Upload Profile Img" />
                        </div>

                        <!-- Email Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required placeholder="Enter Email" />
                            <small id="emailHelp2" class="form-text text-muted">
                                We'll never share your email with anyone else.
                            </small>
                        </div>

                        <!-- Contact Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Contact</label>
                            <input type="number" class="form-control" name="contact" required placeholder="Enter Phone No" />
                        </div>

                        <!-- Location Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location" required placeholder="Enter Location" />
                        </div>

                        <!-- Address Input Field -->
                        <div class="form-group input-group-outline">
                            <label class="form-label">Address</label>
                            <textarea type="text" class="form-control" name="address" required placeholder="Enter Address"></textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="text-center">
                            <button type="submit" class="btn bg-gradient-primary w-100 my-4 mb-2">Sign Up</button>
                        </div>

                        <!-- Link to Sign In -->
                        <p class="mt-4 text-sm text-center">
                            Already have an account?
                            <a href="sign-in.jsp" class="text-primary text-gradient font-weight-bold">Sign In</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>

        <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="../assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="../assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="../assets/js/plugin/datatables/datatables.min.js"></script>


        <!-- jQuery Vector Maps -->
        <script src="../assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
        <script src="../assets/js/plugin/jsvectormap/world.js"></script>

        <!-- Google Maps Plugin -->
        <script src="../assets/js/plugin/gmaps/gmaps.js"></script>

        <!-- Sweet Alert -->
        <script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="../assets/js/kaiadmin.min.js"></script>

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="../assets/js/setting-demo2.js"></script>
    </body>
</html>
