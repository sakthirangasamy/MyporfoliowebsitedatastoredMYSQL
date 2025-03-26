<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
            />

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

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
        
       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    </head>
    <body>
        <%
            String username = (String) session.getAttribute("user");
            String email = (String) session.getAttribute("email");
            String image = (String) session.getAttribute("image");
            String phone = (String) session.getAttribute("phone");
              String location = (String) session.getAttribute("location");

            System.out.println(username);
            System.out.println(email);
//            System.out.println(image);
            System.out.println(phone);

        %>

        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar sidebar-style-2" data-background-color="dark">
                <div class="sidebar-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img
                                src="assets/img/kaiadmin/logo_light.svg"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20"
                                />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item">
                                <a
                                    data-bs-toggle="collapse"
                                    href="userhome.jsp"
                                    class="collapsed"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-home"></i>
                                    <p>Dashboard</p>

                                </a>

                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle=""  href="myprofile.jsp" active>
                                    <i class="far fa fa-address-book" ></i>
                                    <p>Profile</p>

                                </a></li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#base">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Online Job Portal</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="base">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="https://www.naukri.com/registration/createAccount?othersrcp=23531&wExp=N&utm_source=google&utm_medium=cpc&utm_campaign=Brand_Login_Register&gad_source=1&gclid=CjwKCAiA2JG9BhAuEiwAH_zf3omK6fsllxr055rwKGQ4QSidNv2nyh-HiEXGiIvHLZjA9qvJ61tkKBoCIpUQAvD_BwE&gclsrc=aw.ds" target="_blank">
                                                <span class="sub-item">Naukri</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://www.linkedin.com/signup" target="_blank">
                                                <span class="sub-item">Linkedin</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="https://www.shine.com/register/general/?vendorid=31011&utm_source=AdWords&utm_medium=cpc&utm_campaign=Visits&gad_source=1&gclid=CjwKCAiA2JG9BhAuEiwAH_zf3kTT8r2UZMPP9gbFhN-Uwkm4laGcLgruenttCXVOwMkY4rQNXkj5cRoCRtwQAvD_BwE" target="_blank">
                                                <span class="sub-item">Shine</span>
                                            </a>
                                        </li>
                                        <!--                                        <li>
                                                                                    <a href="components/panels.html">
                                                                                        <span class="sub-item">Panels</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="components/notifications.html">
                                                                                        <span class="sub-item">Notifications</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="components/sweetalert.html">
                                                                                        <span class="sub-item">Sweet Alert</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="components/font-awesome-icons.html">
                                                                                        <span class="sub-item">Font Awesome Icons</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="components/simple-line-icons.html">
                                                                                        <span class="sub-item">Simple Line Icons</span>
                                                                                    </a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="components/typography.html">
                                                                                        <span class="sub-item">Typography</span>
                                                                                    </a>
                                                                                </li>-->
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item  submenu">
                                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                    <i class="fas fa-th-list"></i>
                                    <p>Certification</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="sidebarLayouts">
                                    <ul class="nav nav-collapse">
                                        <li class="">
                                            <a href="addcertification.jsp">
                                                <span class="sub-item">Add Certification</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="view-certificates.jsp">
                                                <span class="sub-item">View Certification</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!--                            <li class="nav-item">
                                                            <a data-bs-toggle="collapse" href="#forms">
                                                                <i class="fas fa-pen-square"></i>
                                                                <p>Forms</p>
                                                                <span class="caret"></span>
                                                            </a>
                                                            <div class="collapse" id="forms">
                                                                <ul class="nav nav-collapse">
                                                                    <li>
                                                                        <a href="forms/forms.html">
                                                                            <span class="sub-item">Basic Form</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </li>-->
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#tables">
                                    <i class="fas fa-table"></i>
                                    <p>Projects</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="tables">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="addproject.jsp">
                                                <span class="sub-item">Add Your Project</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="viewproject.jsp">
                                                <span class="sub-item">View Your Projects</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!--                            <li class="nav-item">
                                                            <a data-bs-toggle="collapse" href="#maps">
                                                                <i class="fas fa-map-marker-alt"></i>
                                                                <p>Maps</p>
                                                                <span class="caret"></span>
                                                            </a>
                                                            <div class="collapse" id="maps">
                                                                <ul class="nav nav-collapse">
                                                                    <li>
                                                                        <a href="maps/googlemaps.html">
                                                                            <span class="sub-item">Google Maps</span>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="maps/jsvectormap.html">
                                                                            <span class="sub-item">Jsvectormap</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </li>-->
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#chart">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Experience</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="chart">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="addExperince.jsp">
                                                <span class="sub-item">Add Experience</span>
                                            </a>
                                        </li>
                                      
                                        <li>
                                            <a href="viewExperince.jsp">
                                                <span class="sub-item">View Experience</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                   
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#submenu">
                                    <i class="fas fa-bars"></i>
                                    <p>Education</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="submenu">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav1">
                                                <span class="sub-item">School</span>
                                                <span class="caret"></span>
                                            </a>
                                            <div class="collapse" id="subnav1">
                                                <ul class="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="addsslc.jsp">
                                                            <span class="sub-item">SSLC</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="addhsc.jsp">
                                                            <span class="sub-item">HSC</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav2">
                                                <span class="sub-item">College</span>
                                                <span class="caret"></span>
                                            </a>
                                            <div class="collapse" id="subnav2">
                                                <ul class="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="submit_ug_details.jsp">
                                                            <span class="sub-item">UG</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="submit_pg_details.jsp">
                                                            <span class="sub-item">PG</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                        </li>
                                        <li>
                                            <a href="submit_diploma_details.jsp">
                                                <span class="sub-item">Diploma</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                                     <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#charts">
                                    <i class="fa fa-file-excel"></i>
                                    <p>Resume</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="charts">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="uploadresume.jsp">
                                                <span class="sub-item">Upload Resume</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="viewresume.jsp">
                                                <span class="sub-item">View Resume</span>
                                            </a>
                                        </li>
<!--                                        <li>
                                            <a href="generate_resume.jsp">
                                                <span class="sub-item">Genarate Resume</span>
                                            </a>
                                        </li>-->

                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle=""  href="index.html" active>
                                    <i class="fa-solid fa-right-to-bracket" aria-hidden="true" style="transform: rotate(180deg);"></i>
                                    <p>Sign-Out</p>

                                </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="index.html" class="logo">
                                <img
                                    src="assets/img/kaiadmin/logo_light.svg"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="20"
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">
                            <nav
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                >
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa fa-search search-icon"></i>
                                        </button>
                                    </div>
                                    <input
                                        type="text"
                                        placeholder="Search ..."
                                        class="form-control"
                                        />
                                </div>
                            </nav>

                            <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                <li
                                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                                    >
                                    <a
                                        class="nav-link dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        role="button"
                                        aria-expanded="false"
                                        aria-haspopup="true"
                                        >
                                        <i class="fa fa-search"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                                        <form class="navbar-left navbar-form nav-search">
                                            <div class="input-group">
                                                <input
                                                    type="text"
                                                    placeholder="Search ..."
                                                    class="form-control"
                                                    />
                                            </div>
                                        </form>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="messageDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <ul
                                        class="dropdown-menu messages-notif-box animated fadeIn"
                                        aria-labelledby="messageDropdown"
                                        >
                                        <li>
                                            <div
                                                class="dropdown-title d-flex justify-content-between align-items-center"
                                                >
                                                Messages
                                                <a href="#" class="small">Mark all as read</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="message-notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/jm_denis.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jimmy Denis</span>
                                                            <span class="block"> How are you ? </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/profile.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Chad</span>
                                                            <span class="block"> Ok, Thanks ! </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/mlane.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jhon Doe</span>
                                                            <span class="block">
                                                                Ready for the meeting today...
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/talha.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Talha</span>
                                                            <span class="block"> Hi, Apa Kabar ? </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all messages<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="notifDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-bell"></i>
                                        <span class="notification">4</span>
                                    </a>
                                    <ul
                                        class="dropdown-menu notif-box animated fadeIn"
                                        aria-labelledby="notifDropdown"
                                        >
                                        <li>
                                            <div class="dropdown-title">
                                                You have 4 new notification
                                            </div>
                                        </li>
                                        <li>
                                            <div class="notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-icon notif-primary">
                                                            <i class="fa fa-user-plus"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> New user registered </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-success">
                                                            <i class="fa fa-comment"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Rahmad commented on Admin
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/profile2.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Reza send messages to you
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-danger">
                                                            <i class="fa fa-heart"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> Farrah liked Admin </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all notifications<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <i class="fas fa-layer-group"></i>
                                    </a>
                                    <div class="dropdown-menu quick-actions animated fadeIn">
                                        <div class="quick-actions-header">
                                            <span class="title mb-1">Quick Actions</span>
                                            <span class="subtitle op-7">Shortcuts</span>
                                        </div>
                                        <div class="quick-actions-scroll scrollbar-outer">
                                            <div class="quick-actions-items">
                                                <div class="row m-0">
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-danger rounded-circle">
                                                                <i class="far fa-calendar-alt"></i>
                                                            </div>
                                                            <span class="text">Calendar</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-warning rounded-circle"
                                                                >
                                                                <i class="fas fa-map"></i>
                                                            </div>
                                                            <span class="text">Maps</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-info rounded-circle">
                                                                <i class="fas fa-file-excel"></i>
                                                            </div>
                                                            <span class="text">Reports</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-success rounded-circle"
                                                                >
                                                                <i class="fas fa-envelope"></i>
                                                            </div>
                                                            <span class="text">Emails</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-primary rounded-circle"
                                                                >
                                                                <i class="fas fa-file-invoice-dollar"></i>
                                                            </div>
                                                            <span class="text">Invoice</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-secondary rounded-circle"
                                                                >
                                                                <i class="fas fa-credit-card"></i>
                                                            </div>
                                                            <span class="text">Payments</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="nav-item topbar-user dropdown hidden-caret">
                                    <a
                                        class="dropdown-toggle profile-pic"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >

                                        <div class="avatar-sm">
                                            <img
                                                src='uploads/<%=image%>'
                                                alt="image profile"
                                                class="avatar-img rounded"
                                                />
                                        </div>

                                        <span class="profile-username">
                                            <span class="op-7">Hi,</span>
                                            <span class="fw-bold"><%=username%></span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                                        <div class="dropdown-user-scroll scrollbar-outer">
                                            <li>
                                                <div class="user-box">
                                                    <div class="avatar-lg">
                                                        <img
                                                            src='uploads/<%=image%>'
                                                            alt="image profile"
                                                            class="avatar-img rounded"
                                                            />
                                                    </div>
                                                    <div class="u-text">
                                                        <h4><%=username%></h4>
                                                        <p class="text-muted"><%= email%></p>
                                                        <a
                                                            href="myprofile.jsp"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >View Profile</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">My Name is <%=username%></a>
                                                <a class="dropdown-item" href="#">My Mobile No <%= phone%></a>
                                                <a class="dropdown-item" href="#">My Location <%=location%></a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#" style="font-weight: bold; color: #333;">Account Setting</a>

                                                <!--<div class="dropdown-divider"></div>-->
                                                <a class="dropdown-item" href="sign-in.jsp">Logout</a>
                                            </li>
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- End Navbar -->
                </div>


                <!-- Custom template | don't include it in your project! -->

                <!-- End Custom template -->
            </div>
            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery-3.7.1.min.js"></script>
            <script src="assets/js/core/popper.min.js"></script>
            <script src="assets/js/core/bootstrap.min.js"></script>

            <!-- jQuery Scrollbar -->
            <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

            <!-- Chart JS -->
            <script src="assets/js/plugin/chart.js/chart.min.js"></script>

            <!-- jQuery Sparkline -->
            <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

            <!-- Chart Circle -->
            <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

            <!-- Datatables -->
            <script src="assets/js/plugin/datatables/datatables.min.js"></script>

            <!-- Bootstrap Notify -->
            <!--<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>-->

            <!-- jQuery Vector Maps -->
            <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
            <script src="assets/js/plugin/jsvectormap/world.js"></script>

            <!-- Sweet Alert -->
            <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

            <!-- Kaiadmin JS -->
            <script src="assets/js/kaiadmin.min.js"></script>

            <!-- Kaiadmin DEMO methods, don't include it in your project! -->
            <script src="assets/js/setting-demo.js"></script>
            <script src="assets/js/demo.js"></script>
            <script>
            $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#177dff",
                fillColor: "rgba(23, 125, 255, 0.14)",
            });

            $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#f3545d",
                fillColor: "rgba(243, 84, 93, .14)",
            });

            $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
                type: "line",
                height: "70",
                width: "100%",
                lineWidth: "2",
                lineColor: "#ffa534",
                fillColor: "rgba(255, 165, 52, .14)",
            });
            </script>
    </body>
</html>
