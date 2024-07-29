
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>profile edit data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">|
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>

            body{
                background: #1A76D1;

                margin-top:20px;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }
            .me-2 {
                margin-right: .5rem!important;
            }
        </style>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="Site keywords here">
        <meta name="description" content="">
        <meta name='copyright' content=''>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title -->
        <title>FPT Medical - FMed</title>

        <!-- Favicon -->
        <link rel="icon" href="${pageContext.request.contextPath}/Main Template/img/favicon.png">

        <!-- Google Fonts -->
        <link href="${pageContext.request.contextPath}/Main Template/https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/bootstrap.min.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/nice-select.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/font-awesome.min.css">
        <!-- icofont CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/icofont.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/slicknav.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/owl-carousel.css">
        <!-- Datepicker CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/datepicker.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/animate.min.css">
        <!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/magnific-popup.css">

        <!-- Medipro CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/normalize.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/responsive.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="css/color/color1.css">
        <!--<link rel="stylesheet" href="css/color/color2.css">-->
        <!--<link rel="stylesheet" href="css/color/color3.css">-->
        <!--<link rel="stylesheet" href="css/color/color4.css">-->
        <!--<link rel="stylesheet" href="css/color/color5.css">-->
        <!--<link rel="stylesheet" href="css/color/color6.css">-->
        <!--<link rel="stylesheet" href="css/color/color7.css">-->
        <!--<link rel="stylesheet" href="css/color/color8.css">-->
        <!--<link rel="stylesheet" href="css/color/color9.css">-->
        <!--<link rel="stylesheet" href="css/color/color10.css">-->
        <!--<link rel="stylesheet" href="css/color/color11.css">-->
        <!--<link rel="stylesheet" href="css/color/color12.css">-->

        <link rel="stylesheet" href="#" id="colors">
    </head>
    <body>
        <header class="header style2" >
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-5 col-12">
                            <!-- Contact -->
                            <ul class="top-link">
                                <li><a href="${pageContext.request.contextPath}/Main Template/about.html">About</a></li>
                                <li><a href="${pageContext.request.contextPath}/doctors">Doctors</a></li>
                                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                                <li><a href="${pageContext.request.contextPath}/Main Template/faq.html">FAQ</a></li>
                            </ul>
                            <!-- End Contact -->
                        </div>
                        <div class="col-lg-6 col-md-7 col-12">
                            <!-- Top Contact -->
                            <ul class="top-contact">
                                <li><i class="fa fa-phone"></i>+84 76 2222 764</li>
                                <li><i class="fa fa-envelope"></i><a href="${pageContext.request.contextPath}/Main Template/mailto:support@fptmedical.com">support@fptmedical.com</a></li>
                            </ul>
                            <!-- End Top Contact -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <!-- Middle Header -->
            <div class="middle-header">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-12">
                            <!-- Start Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/Main Template/index.jsp"><img src="${pageContext.request.contextPath}/Main Template/img/logo.png" alt="#"></a>
                            </div>
                            <!-- End Logo -->
                            <!-- Mobile Nav -->
                            <div class="mobile-nav"></div>
                            <!-- End Mobile Nav -->
                        </div>
                        <div class="col-lg-9 col-md-9 col-12">
                            <div class="widget-main">
                                <!-- Single Widget -->
                                <div class="single-widget">
                                    <i class="icofont-ui-call"></i>
                                    <p>Call us anytime</p>
                                    <h4>+84 76 2222 764</h4>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget -->
                                <div class="single-widget">
                                    <i class="icofont-clock-time"></i>
                                    <p>Opening Time</p>
                                    <h4>Mon-Sat: 9.00-18.00</h4>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget -->
                                <div class="single-widget button">
                                    <div class="get-quote">
                                        <a href="${pageContext.request.contextPath}/appointment" class="btn">Book Appointment</a>
                                    </div>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget: Thêm bi?u t??ng ng??i dùng -->
                                <!-- Single Widget: Thêm bi?u t??ng ng??i dùng -->
                                <div class="single-widget">
                                    <a id="user-icon">
                                        <i class="icofont-user-alt-7"></i>
                                    </a>
                                    <!-- Hi?n th? ch? Profile và Login -->
                                    <span id="user-options" style="display: none; position: absolute; background-color: #fff; border: 1px solid #ccc; padding: 5px; z-index: 999;">
                                        <a href="${pageContext.request.contextPath}/Main Template/profile.jsp" style="display: block;
                                           text-decoration: none; color: #333; font-weight: bold">Profile</a>
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="${pageContext.request.contextPath}/Main Template/login.jsp" style="display: block; text-decoration: none;
                                               color: #333; font-weight: bold">Login</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <a href="${pageContext.request.contextPath}/LogOutServlet" style="display: block; text-decoration: none;
                                               color: #333; font-weight: bold">Logout</a>
                                        </c:if>
                                    </span>
                                </div>
                                <!--/ End Single Widget -->

                                <!--/ End Single Widget -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End Middle Header -->
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-12">
                                <!-- Main Menu -->
                                <div class="main-menu">
                                    <nav class="navigation">
                                        <ul class="nav menu">
                                            <li class="active"><a href="#">Home <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="index.jsp">FPT Medical Homepage</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/https://daihoc.fpt.edu.vn">FPT University Homepage</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Doctors <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath}/doctors">Doctor</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/doctorDetails">Doctor Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Services <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/service.html">Service</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/service-details.html">Service Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Pages <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/about.html">About Us</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/appointment">Appointment</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/time-table.html">Time Table</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/testimonials.html">Testimonials</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/pricing.html">Our Pricing</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/register.jsp">Sign Up</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/login.jsp">Login</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/faq.html">Faq</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/mail-success.html">Mail Success</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/404.html">404 Error</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Blogs <i class="icofont-rounded-down"></i></a>
                                                <ul class="dropdown">
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/blog-grid.html">Blog Grid</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/Main Template/blog-single.html">Blog Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!--/ End Main Menu -->
                                <div class="right-bar">
                                    <!-- Search Form -->
                                    <div class="search-top">
                                        <div class="search"><a href="#0"><i class="icofont-search-1"></i></a></div>
                                        <form class="search-form">
                                            <input type="text" placeholder="search" name="search">
                                            <button value="search" type="submit"><i class="icofont-search-1"></i></button>
                                        </form>
                                    </div>
                                    <!--/ End Search Form -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <div class="container">
            <div class="main-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body" >
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="/SWP391_/${user.avatar}" alt="Avatar" class="rounded-circle p-1 bg-primary" width="110">
                                    <div class="mt-3">
                                        <!--256 Name-->
                                        <h4>${user.name}</h4>


                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateProfileModal">
                                            Update Profile
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="updateProfileModal" tabindex="-1" aria-labelledby="updateProfileModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="updateProfileModalLabel">Update Profile</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form method="post" action="/SWP391_/UpdateProfileServlet" enctype="multipart/form-data">
                                                            <div class="form-group">
                                                                <div class="input-group mb-3">
                                                                    <label class="input-group-text" for="avatar">Avatar</label>
                                                                    <input type="file" class="form-control" id="avatar" name="avatar">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="fullName" style="margin-right: 390px; font-weight: bold;color:#1A76D1 ">Full Name:</label>
                                                                <input type="text" class="form-control" id="fullName" name="nameUpdate" placeholder="Enter Full Name" >
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email" style="margin-right: 420px; font-weight: bold;color:#1A76D1 ">Email:</label>
                                                                <input type="email" class="form-control" id="email" name="emailUpdate" placeholder="Enter Email" value="${user.email}" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phone" style="margin-right: 420px; font-weight: bold;color:#1A76D1 ">Phone:</label>
                                                                <input type="text" class="form-control" id="phone"  name="phoneUpdate" placeholder="Enter Phone"
                                                                       pattern="[0-9]+" title="Please enter numbers only" >
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address" style="margin-right: 410px; font-weight: bold;color:#1A76D1 ">Address:</label>
                                                                <input type="text" class="form-control" id="address"  name="addressUpdate" placeholder="Enter Address" >
                                                            </div>
                                                             <div class="modal-footer">
                                                        <input class="btn btn-outline-primary" type="submit" value="Save Changes">
                                                     
                                                    </div>
                                                        </form>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <button class="btn btn-outline-primary">Patient Medical Records</button>
                                    </div>
                                </div>
                                <hr class="my-4">
                                <ul class="list-group list-group-flush">

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <!--Form-->
                        <%--<c:forEach items="user" var="user" >--%>
                        <form method="" action="">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="text" id="" name="name" placeholder="Your Full Name"
                                                   value="${user.name}" disabled/>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="text" id="" name="email" placeholder="Your Email" value="${user.email}" disabled/>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="text" id="" name="phone" placeholder="Your Phone" value="${user.phone}" disabled/>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="text" id="" name="address" placeholder="Your Address" value="${user.address}" disabled/>
                                        </div>
                                    </div>
                              
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
        <!-- jquery Min JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery.min.js"></script>
        <!-- jquery Migrate JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery-migrate-3.0.0.js"></script>
        <!-- jquery Ui JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery-ui.min.js"></script>
        <!-- Easing JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/easing.js"></script>
        <!-- Color JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/colors.js"></script>
        <!-- Popper JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/popper.min.js"></script>
        <!-- Bootstrap Datepicker JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/bootstrap-datepicker.js"></script>
        <!-- Jquery Nav JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery.nav.js"></script>
        <!-- Slicknav JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/slicknav.min.js"></script>
        <!-- ScrollUp JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery.scrollUp.min.js"></script>
        <!-- Niceselect JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/niceselect.js"></script>
        <!-- Tilt Jquery JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/tilt.jquery.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/owl-carousel.js"></script>
        <!-- counterup JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery.counterup.min.js"></script>
        <!-- Steller JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/steller.js"></script>
        <!-- Wow JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/wow.min.js"></script>
        <!-- Magnific Popup JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/jquery.magnific-popup.min.js"></script>
        <!-- Counter Up CDN JS -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/main.js"></script>
        <script>
            document.getElementById("user-icon").addEventListener("click", function () {
                var userOptions = document.getElementById("user-options");
                if (userOptions.style.display === "none") {
                    userOptions.style.display = "inline-block";
                } else {
                    userOptions.style.display = "none";
                }
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>