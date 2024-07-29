<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">
    <head>
        <!-- Meta Tags -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="Site keywords here">
		<meta name="description" content="">
		<meta name='copyright' content=''>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Title -->
        <title>Mediplus - Medical and Doctor Directory HTML Template.</title>
		
		<!-- Favicon -->
        <link rel="icon" href="img/favicon.png">
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color1.css">
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color2.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color3.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color4.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color5.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color6.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color7.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color8.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color9.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color10.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color11.css">-->
		<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/color/color12.css">-->

		<link rel="stylesheet" href="#" id="colors">
		
    </head>
    <body>
	
		<!-- Preloader -->
        <div class="preloader">
            <div class="loader">
                <div class="loader-outter"></div>
                <div class="loader-inner"></div>

                <div class="indicator"> 
                    <svg width="16px" height="12px">
                        <polyline id="back" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                        <polyline id="front" points="1 6 4 6 6 11 10 1 12 6 15 6"></polyline>
                    </svg>
                </div>
            </div>
        </div>
        <!-- End Preloader -->
	<%@include file="header.jsp" %>
	
		<!-- Breadcrumbs -->
		<div class="breadcrumbs overlay">
			<div class="container">
				<div class="bread-inner">
					<div class="row">
						<div class="col-12">
							<h2>Contact Us</h2>
							<ul class="bread-list">
								<li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
								<li><i class="icofont-simple-right"></i></li>
								<li class="active">Contact Us</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs -->
				
		<!-- Start Contact Us -->
		<section class="contact-us section">
			<div class="container">
				<div class="inner">
					<div class="row"> 
						<div class="col-lg-6">
							<div class="contact-us-left">
								<!--Start Google-map -->
								<div id="myMap"></div>
								<!--/End Google-map -->
							</div>
						</div>
						<div class="col-lg-6">
							<div class="contact-us-form">
								<h2>Contact With Us</h2>
								<p>If you have any questions please fell free to contact with us.</p>
								<!-- Form -->
								<form class="form" method="post" action="${pageContext.request.contextPath}/contact">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<input type="text" name="name" placeholder="Name" required="">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<input type="email" name="email" placeholder="Email" required="">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<input type="text" name="phone" placeholder="Phone" required="">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<input type="text" name="subject" placeholder="Subject" required="">
											</div>
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<textarea name="message" placeholder="Your Message" required=""></textarea>
											</div>
										</div>
										<div class="col-12">
											<div class="form-group login-btn">
												<button class="btn" type="submit">Send</button>
											</div>
											<div class="checkbox">
												<label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox">Do you want to subscribe our Newsletter ?</label>
											</div>
										</div>
									</div>
								</form>
								<!--/ End Form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Contact Us -->
		
		<!-- Footer Area -->
		<footer id="footer" class="footer ">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer">
								<h2>About Us</h2>
								<p>Lorem ipsum dolor sit am consectetur adipisicing elit do eiusmod tempor incididunt ut labore dolore magna.</p>
								<!-- Social -->
								<ul class="social">
									<li><a href="#"><i class="icofont-facebook"></i></a></li>
									<li><a href="#"><i class="icofont-google-plus"></i></a></li>
									<li><a href="#"><i class="icofont-twitter"></i></a></li>
									<li><a href="#"><i class="icofont-vimeo"></i></a></li>
									<li><a href="#"><i class="icofont-pinterest"></i></a></li>
								</ul>
								<!-- End Social -->
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer f-link">
								<h2>Quick Links</h2>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Our Cases</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Other Links</a></li>	
										</ul>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<ul>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Consuling</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Finance</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Testimonials</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>FAQ</a></li>
											<li><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact Us</a></li>	
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer">
								<h2>Open Hours</h2>
								<p>Lorem ipsum dolor sit ame consectetur adipisicing elit do eiusmod tempor incididunt.</p>
								<ul class="time-sidual">
									<li class="day">Monday - Fridayp <span>8.00-20.00</span></li>
									<li class="day">Saturday <span>9.00-18.30</span></li>
									<li class="day">Monday - Thusday <span>9.00-15.00</span></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<div class="single-footer">
								<h2>Newsletter</h2>
								<p>subscribe to our newsletter to get allour news in your inbox.. Lorem ipsum dolor sit amet, consectetur adipisicing elit,</p>
								<form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
									<input name="email" placeholder="Email Address" class="common-input" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Your email address'" required="" type="email">
									<button class="button"><i class="icofont icofont-paper-plane"></i></button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Footer Top -->
			<!-- Copyright -->
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-12">
							<div class="copyright-content">
								<p>© Copyright 2018  |  All Rights Reserved by <a href="https://www.wpthemesgrid.com" target="_blank">wpthemesgrid.com</a> </p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Copyright -->
		</footer>
		<!--/ End Footer Area -->
		
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
                <!-- Load the Google Maps JavaScript API with your API key -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGqTyqoPIvYxhn_Sa7ZrK5bENUWhpCo0w&callback=initMap" async defer></script>
                <script>
        function initMap() {
            // Coordinates for FPT University Da Nang
            const fptUniversityDaNang = { lat: 16.065437, lng: 108.220591 };

            // Create a map centered at FPT University Da Nang
            const map = new google.maps.Map(document.getElementById("myMap"), {
                center: fptUniversityDaNang,
                zoom: 16,
            });

            // Create a marker for FPT University Da Nang
            const marker = new google.maps.marker.AdvancedMarkerElement({
                position: fptUniversityDaNang,
                map: map,
                title: "FPT University Da Nang"
            });

            // Add an info window to the marker
            const infowindow = new google.maps.InfoWindow({
                content: "FPT University Da Nang"
            });

            // Open the info window when the marker is clicked
            marker.addListener("click", () => {
                infowindow.open(map, marker);
            });
        }
    </script>
    
		<!-- Gmaps JS -->
		<script src="${pageContext.request.contextPath}/Main Template/js/gmaps.min.js"></script>
		<!-- Map Active JS -->
		<script src="${pageContext.request.contextPath}/Main Template/js/map-active.js"></script>
		<!-- Bootstrap JS -->
		<script src="${pageContext.request.contextPath}/Main Template/js/bootstrap.min.js"></script>
		<!-- Main JS -->
		<script src="${pageContext.request.contextPath}/Main Template/js/main.js"></script>
                
    </body>
</html>