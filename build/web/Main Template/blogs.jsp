<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <style>
            #paging{
                margin-top: 5px;
                display: flex;
                justify-content: center;
            }
            #paging a {
                display: inline-block;
                padding: 8px 16px;
                margin: 0 4px;
                border: 1px solid #ccc;
                border-radius: 4px;
                text-decoration: none;
                color: #333;
                background-color: #fff;
                transition: all 0.3s ease;
            }

            #paging a:hover {
                background-color: #f0f0f0;
                border-color: #aaa;
            }

            .active {
                background-color: #007bff !important;
                color: #fff !important;
                border-color: #007bff !important;
            }

            .avatar {
                width: 100%; /* Adjust size as needed */
                height: 200px; /* Adjust size as needed */
                border: 2px solid #fff; /* Add a border */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a shadow */
                object-fit: fill;
            }

            .threedot{
                font-size: 26px;
                color: #888;
                font-weight: bold;
                text-decoration: none;
                margin-left: 5px;
                margin-right: 5px;
                margin-top: 2px;
            }
            /* Search container */
            .search-container {
                position: relative;
                display: inline-block;
            }

            /* Search input field */
            .search-input {
                width: 300px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 25px;
                outline: none;
                font-size: 16px;
            }

            /* Search button */
            .search-button {
                position: absolute;
                top: 0;
                right: 0;
                background-color: #007bff;
                border: none;
                padding: 7px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .search-button:hover {
                background-color: #0056b3;
            }

            /* Icon inside the button */
            .search-button i {
                color: #fff;
                font-size: 18px;
            }
        </style>
        <script>
            var gap = 2;
            function paging(url) {
                var currentPage = parseInt($("#curentPage").val());
                var totalPage = $("#totalPage").val();
                var query = $("#query").val();

                if (totalPage <= 1) {
                    return;
                }

                $("#paging").append(
                        `<a id=1 href=${url}`
                        + "?pageNumber=0" + "&query=" + query + "> 1 </a>"
                        );

                if (currentPage - gap - 1 > 1) {
                    $("#paging").append(
                            " <span class='threedot'> ... </span>"
                            );
                }

                for (let i = currentPage - gap; i <= currentPage; i++) {
                    if (i > 1) {
                        $("#paging").append(
                                `<a id=` + i + ` href=${url}`
                                + "?pageNumber=" + (i - 1) + "&query=" + query + " >" + i + "</a>"
                                );
                    }
                }

                for (let i = currentPage + 1; i <= currentPage + gap; i++) {
                    if (i < totalPage) {
                        $("#paging").append(
                                "<a id= " + i + ` href=${url}`
                                + "?pageNumber=" + (i - 1) + "&query=" + query + ">" + i + "</a>"
                                );
                    }
                }
                if (currentPage + gap < (totalPage - 1)) {
                    $("#paging").append(
                            "<span class='threedot'> ... </span>");
                }
                if (currentPage == totalPage)
                    return;
                $("#paging").append(
                        "<a id='" + totalPage + `' href=${url}`
                        + "?pageNumber=" + (totalPage - 1) + "&query=" + query + ">" + totalPage + "</a>"
                        );
            }

            function activePage() {
                var currentPage = parseInt($("#curentPage").val());

                $("#" + currentPage).addClass('active');
            }
        </script>
    </head>
    <body onload="paging('${pageContext.request.contextPath}/blogList');
            activePage()">
        <input type="hidden" id="curentPage" value="${requestScope.pageNumber + 1}">
        <input type="hidden" id="totalPage" value="${requestScope.totalPage}">

        <%@include file="header.jsp" %>
        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Our blogs</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Blogs</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Team -->
        <section id="team" class="team section single-page">
            <div class="container">
                <div class="search-container row">
                    <form action="${pageContext.request.contextPath}/blogList?pageNumber=${requestScope.pageNumber}" method="GET">
                        <input type="text" id="query" placeholder="Search by blog's title or content..." class="search-input" value="${query}" name="query">
                        <button type="submit" class="search-button">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="row">
                    <fmt:setLocale value="vi_VN" />
                    <fmt:setBundle basename="java.text.resources.LocaleElements"/>
                    <c:forEach items="${requestScope.blogs}" var="blog">
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Single Team -->
                            <div class="single-team">
                                <div class="t-bottom">
                                    <h2><a href="${pageContext.request.contextPath}/blogDetail?id=${blog.id}">${blog.title}</a></h2>
                                    <p>${blog.author}</p>
                                    <p>${blog.date}</p>
                                    <h4>Content: </h4>
                                    <c:if test="${fn:length(blog.content) > 150}">
                                        <p> ${fn:substring(blog.content , 0 , 150)} ... </p>
                                    </c:if>
                                    <c:if test="${fn:length(blog.content) <= 150}">
                                        <p> ${blog.content} </p>
                                    </c:if>
                                </div>
                            </div>
                            <!-- End Single Team -->
                        </div>	
                    </c:forEach>
                </div>
                <div id="paging" class="row">
                </div>
            </div>
        </section>
        <!--/ End Team -->

        <!-- Start Newsletter Area -->
        <section class="newsletter section">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-6  col-12">
                        <!-- Start Newsletter Form -->
                        <div class="subscribe-text ">
                            <h6>Sign up for newsletter</h6>
                            <p class="">Cu qui soleat partiendo urbanitas. Eum aperiri indoctum eu,<br> homero alterum.</p>
                        </div>
                        <!-- End Newsletter Form -->
                    </div>
                    <div class="col-lg-6  col-12">
                        <!-- Start Newsletter Form -->
                        <div class="subscribe-form ">
                            <form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
                                <input name="EMAIL" placeholder="Your email address" class="common-input" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'Your email address'" required="" type="email">
                                <button class="btn">Subscribe</button>
                            </form>
                        </div>
                        <!-- End Newsletter Form -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /End Newsletter Area -->

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
