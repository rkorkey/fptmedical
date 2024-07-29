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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <style>
            .doctor-details-item{
                text-align: center;
                color: white;
            }

            .certificates-list {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                justify-content: space-around;
                margin: 20px auto;
                max-width: 1000px;
            }

            .certificate {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 10px;
                width: 300px;
            }

            .certificate-title {
                font-size: 20px;
                margin-top: 0;
            }

            .certificate-details {
                list-style-type: none;
                color: black;
                padding: 0;
            }

            .certificate-details li {
                margin-bottom: 10px;
            }

            .certificate-details li strong {
                margin-right: 5px;
            }
            
            .checked{
                color: yellow;
            }
            
            .avatar{
                width: 90px;
                height: 70px;
                border-radius: 100%;
                object-fit: contain;
            }
            
            .feedback-list{
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            
            .feedback-item{
                border : 1px solid black;
                border-radius: 2px;
            }
            
            .feedback-header{
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            
            .feedback-body{
                
            }
            
            .feedback-header-left{
                
            }
            
            .feedback-header-right{
                
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Doctor Details</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Doctor Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Doctor Details -->
        <div class="doctor-details-area section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="doctor-details-item doctor-details-left">
                            <img src="${requestScope.doctor.avatar}" alt="#">
                            <div class="t-icon">
                                <a href="${pageContext.request.contextPath}/appointment?doctorId=${requestScope.doctor.doctorId}&majorId=${requestScope.doctor.majorId}" class="btn">Get Appointment</a>
                            </div>
                            <div class="doctor-details-contact">
                                <h3>${doctor.doctorName}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="doctor-details-item">
                            <div class="doctor-details-right">
                                <div class="doctor-name">
                                    <h3 class="name">${doctor.doctorName}</h3>
                                    <p class="deg">${doctor.major}</p>
                                </div>
                                <br>
                                <h2 class="certificate-title">Certificates</h2><br/>
                                <div class="certificates-list">
                                    <c:if test="${empty requestScope.doctor.certificates}"><p>There's no certification</p></c:if>
                                    <c:forEach items="${requestScope.doctor.certificates}" var="certificate">
                                        <div class="certificate">
                                            <h3>${certificate.certificate}</h3>
                                            <ul class="certificate-details">
                                                <li><strong>Experience:</strong> ${certificate.experience} years</li>
                                                <li><strong>Major:</strong> ${certificate.major.nameMajor}</li>
                                                <li><strong>University:</strong> University of ${certificate.university}</li>
                                                <li><strong>Address:</strong> ${certificate.address}</li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                                    <div class="row feedback-list">
                                    <h2>Feedbacks</h2>
                                    <c:if test="${empty requestScope.feedbacks}">There's no feedback</c:if>
                                    <c:forEach items="${requestScope.feedbacks}" var="feedback">
                                        <div class="feedback-item">
                                            <div class="feedback-header">
                                                <div class="feedback-header-left">
                                                    <img src="${feedback.customerAvatar}" alt="avatar of customer" class="avatar"/>
                                                    <span>${feedback.customerEmail}</span>
                                                </div>
                                                <div class="feedback-header-right">
                                                    <label>Vote: </label>
                                                    <span class="fa fa-star ${feedback.vote >= 1 ? 'checked' : ''}" id="star-1"></span>
                                                    <span class="fa fa-star ${feedback.vote >= 2 ? 'checked' : ''}" id="star-2"></span>
                                                    <span class="fa fa-star ${feedback.vote >= 3 ? 'checked' : ''}" id="star-3"></span>
                                                    <span class="fa fa-star ${feedback.vote >= 4 ? 'checked' : ''}" id="star-4"></span>
                                                    <span class="fa fa-star ${feedback.vote >= 5 ? 'checked' : ''}" id="star-5"></span>
                                                    <p>Create date : ${feedback.createDate}</p>
                                                </div>
                                            </div>
                                            <div class="feedback-body">
                                                <label for="content">Content:</label>
                                                <textarea class="form-control" id="content" disabled>${feedback.content}</textarea>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
            </div>
        </div>
        <!-- End Doctor Details -->

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
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/main.js"></script>
    </body>
</html>
