<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% response.setCharacterEncoding("UTF-8"); %>
<c:set var="lang" value="${cookie.lang.value}" />
<fmt:setLocale value="${lang}" scope="session" />
<fmt:setBundle basename="bundle.bundle" />

<html class="no-js" lang="zxx">
    <head>
        <!-- Meta Tags -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="Site keywords here">
		<meta name="description" content="">
		<meta name='copyright' content=''>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Support AI</title>
        <link rel="icon" href="img/favicon.png">
        <!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Nice Select CSS -->
		<link rel="stylesheet" href="css/nice-select.css">
		<!-- Font Awesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- icofont CSS -->
        <link rel="stylesheet" href="css/icofont.css">
		<!-- Slicknav -->
		<link rel="stylesheet" href="css/slicknav.min.css">
		<!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="css/owl-carousel.css">
		<!-- Datepicker CSS -->
		<link rel="stylesheet" href="css/datepicker.css">
		<!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.min.css">
		<!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
		
		<!-- Medipro CSS -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
		
		<!-- Color CSS -->
		<link rel="stylesheet" href="css/color/color1.css">
		<link rel="stylesheet" href="#" id="colors">
		
<!--        -------------------------------------------------->
        <link rel="stylesheet" type="text/css"  href="css/support.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        
    </head>
    <style>
        .sticky {
            position: sticky;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 9999;
        }
        
    </style>
    <body>
 
        <!-- Header Area -->
		<header class="header" >
			<!-- Topbar -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-5 col-12">
							<!-- Contact -->
							<ul class="top-link">
								<li><a href="#">About</a></li>
								<li><a href="#">Doctors</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
							<!-- End Contact -->
						</div>
						<div class="col-lg-6 col-md-7 col-12">
							<!-- Top Contact -->
							<ul class="top-contact">
								<li><i class="fa fa-phone"></i>+880 1234 56789</li>
								<li><i class="fa fa-envelope"></i><a href="mailto:support@yourmail.com">support@yourmail.com</a></li>
							</ul>
							<!-- End Top Contact -->
						</div>
					</div>
				</div>
			</div>
			<!-- End Topbar -->
			<!-- Header Inner -->
			<div class="header-inner">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-12">
								<!-- Start Logo -->
								<div class="logo">
									<a href="index.jsp"><img src="img/logo.png" alt="#"></a>
								</div>
								<!-- End Logo -->
								<!-- Mobile Nav -->
								<div class="mobile-nav"></div>
								<!-- End Mobile Nav -->
							</div>
							<div class="col-lg-7 col-md-9 col-12">
								<!-- Main Menu -->
								<div class="main-menu">
									<nav class="navigation">
										<ul class="nav menu">
											<li class="active"><a href="#">Home <i class="icofont-rounded-down"></i></a>
												<ul class="dropdown">
													<li><a href="${pageContext.request.contextPath}/HomeServlet">Default Homepage</a></li>
													<li><a href="index2.html">Animation Homepage</a></li>
												</ul>
											</li>
											<li><a href="#">Doctos <i class="icofont-rounded-down"></i></a>
												<ul class="dropdown">
													<li><a href="${pageContext.request.contextPath}/doctors">Doctor</a></li>
													<li><a href="${pageContext.request.contextPath}/doctorDetails">Doctor Details</a></li>
												</ul>
											</li>
											<li><a href="#">Services <i class="icofont-rounded-down"></i></a>
												<ul class="dropdown">
													<li><a href="service.html">Service</a></li>
													<li><a href="service-details.html">Service Details</a></li>
												</ul>
											</li>
											<li><a href="#">Pages <i class="icofont-rounded-down"></i></a>
												<ul class="dropdown">
													<li><a href="about.html">About Us</a></li>
													<li><a href="${pageContext.request.contextPath}/appointment">Appointment</a></li>
													<li><a href="time-table.html">Time Table</a></li>
													<li><a href="testimonials.html">Testimonials</a></li>
													<li><a href="pricing.html">Our Pricing</a></li>
													<li><a href="register.html">Sign Up</a></li>
													<li><a href="login.html">Login</a></li>
													<li><a href="faq.html">Faq</a></li>
													<li><a href="mail-success.html">Mail Success</a></li>
													<li><a href="404.html">404 Error</a></li>
												</ul>
											</li>
											<li><a href="#">Blogs <i class="icofont-rounded-down"></i></a>
												<ul class="dropdown">
													<li><a href="blog-grid.html">Blog Grid</a></li>
													<li><a href="blog-single.html">Blog Details</a></li>
												</ul>
											</li>
											<li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
										</ul>
									</nav>
								</div>
								<!--/ End Main Menu -->
							</div>
							<div class="col-lg-2 col-12">
								<div class="get-quote">
									<a href="${pageContext.request.contextPath}/appointment" class="btn">Book Appointment</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Header Inner -->
		</header>
		<!-- End Header Area -->
        <section >
            <div class="view">
                <div class="body">
                    <div class="chatbox-wrapper">
                        <div class="message-box">
                            <div class="chat response">
                                <img src="img/chatgpt.jpg">
                                <span>Hello there! <br> 
                                    How can I help you today.
                                </span>
                            </div>
                        </div>
                        <div class="messagebar">
                            <div class="bar-wrapper">
                                <input type="text" placeholder="Enter your message...">
                                <button>
                                    <span class="material-symbols-rounded">
                                        send
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </section>
        <script src="${pageContext.request.contextPath}/Main Template/support/support.js"></script>
    </body>
</html>