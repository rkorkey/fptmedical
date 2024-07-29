<!doctype html>
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
        <%@include file="header.jsp" %>

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Register</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/Main Template/index.jsp">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Register</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Shop Register -->
        <section class="register section">
            <div class="container">
                <div class="inner">
                    <div class="row"> 
                        <div class="col-lg-6">
                            <div class="register-left">
                                <img  src="${pageContext.request.contextPath}/Main Template/img/register.png" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="register-form">
                                <h2>Register Here</h2>
                                <p>Already have an account ? <a href="${pageContext.request.contextPath}/Main Template/login.jsp">Login Here</a></p>
                                <!--                                 Form -->
                                <form  class="form" method="post" action="${pageContext.request.contextPath}/RegisterServlet">
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div style = "background-color: black;border: 3px solid black; border-radius: 10px;">
                                                    <input type="text" name="name" placeholder="Full Name" required=""  style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                </div>
                                            </div>                                                                       
                                            <div class="col-lg-6">
                                                <div  style = "background-color: black;border: 3px solid black; border-radius: 10px;">
                                                    <input type="tel" name="phone" placeholder="Phone" required pattern="[0-9]+" title="Please enter only numbers" style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                </div>
                                            </div>                                                                  
                                            <div class="col-lg-6">
                                                <div style = "background-color: black;border: 3px solid black; border-radius: 10px;">
                                                    <input type="email" id="to" name="emailCheck" placeholder="Email" required="" style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                </div>
                                            </div>                                   
                                            <div class="col-lg-6">
                                                <div style="background-color: black;border: 3px solid black; border-radius: 10px;">
                                                    <input type="password" id="password" name="password" placeholder="Password" required style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                </div>
                                            </div>                                      
                                            <div class="col-lg-6">
                                                <div style = "background-color: #1A76D1;border: 3px solid black; border-radius: 10px;">
                                                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required oninput="checkPasswordMatch()" style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                    <span id="passwordMatchMessage"></span>
                                                </div>
                                            </div>
                                            <br/>
                                            <input type="hidden" id="tokenInput" name="token" value="">
                                            <br/>
                                            <div class="col-lg-12">
                                                <div style = "background-color: #1A76D1;border: 3px solid black; border-radius: 10px;">
                                                    <b style="color: white">Key:</b>   
                                                    <input id="tokenMatchResult" type="text" name="tokenCheck" placeholder="Activate Your Account" required=""  style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">


                                                </div>
                                            </div>  
                                        </div>
                                        <br/>
                                        <div style="color: red; margin-left: 20px"> ${errorRegis2}</div>
                                        <br/>
                                        <div class="col-12">
                                            <div class="form-group login-btn">
                                                <button class="btn" type="submit" onclick="validateForm()">Sign Up</button>
                                            </div>
                                            <%
                                                // L?y giá tr? c?a tham s? 'token' t? URL
                                                String token = request.getParameter("token");

                                                // Ki?m tra xem token có t?n t?i không
                                                if (token != null && !token.isEmpty()) {
                                                    // Token ???c tìm th?y trong URL
                                                    out.println("Token t? URL: " + token);
                                                } else {
                                                    // Không tìm th?y token trong URL
                                                    out.println("Không có Token trong URL");
                                                }
                                            %>
                                            <%
                                                // L?y giá tr? c?a tham s? 'email' t? URL
                                                String email = request.getParameter("email");

                                                // Ki?m tra xem email có t?n t?i không
                                                if (email != null && !email.isEmpty()) {
                                                    // Email ???c tìm th?y trong URL
                                                    out.println("Email t? URL: " + email);
                                                } else {
                                                    // Không tìm th?y email trong URL
                                                    out.println("Không có Email trong URL");
                                                }
                                            %>


                                            <div id="tokenMatchResult"></div>
                                            <div id="emailMatchResult"></div>


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
        <!--/ End Register -->

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
                                <p>© Copyright 2018  |  All Rights Reserved by <a href="${pageContext.request.contextPath}/Main Template/https://www.wpthemesgrid.com" target="_blank">wpthemesgrid.com</a> </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Copyright -->
        </footer>
        <!--/ End Footer Area -->
        <script>
            function checkPasswordMatch() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var message = document.getElementById("passwordMatchMessage");
                if (password === confirmPassword) {
                    message.style.color = "green";
                    message.innerHTML = "Password matched!";
                } else {
                    message.style.color = "red";
                    message.innerHTML = "Password does not match!";
                }
            }
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
        <script src="${pageContext.request.contextPath}/Main Template/http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/main.js"></script>

        <script>
            window.onload = function () {
                // L?y token và email t? URL
                var urlParams = new URLSearchParams(window.location.search);
                var urlToken = urlParams.get('token');
                var urlEmail = urlParams.get('email');

                // L?y ph?n t? input cho token và email
                var inputToken = document.getElementsByName("tokenCheck")[0];
                var inputEmail = document.getElementsByName("emailCheck")[0];

                // L?y ph?n t? nút Sign Up
                var signUpBtn = document.querySelector('.login-btn button');

                // Thêm s? ki?n oninput cho c? inputToken và inputEmail
                inputToken.oninput = function () {
                    validateForm();
                };

                inputEmail.oninput = function () {
                    validateForm();
                };

                function validateForm() {
                    // L?y giá tr? c?a input khi ng??i dùng nh?p
                    var inputtedToken = inputToken.value;
                    var inputtedEmail = inputEmail.value;

                    // So sánh token và email và hi?n th? k?t qu?
                    var tokenResultDiv = document.getElementById("tokenMatchResult");
                    var emailResultDiv = document.getElementById("emailMatchResult");
                    if (urlToken === inputtedToken && urlEmail === inputtedEmail) {
                        tokenResultDiv.style.color = "green";
                        tokenResultDiv.innerHTML = "Token matched!";
                        emailResultDiv.style.color = "green";
                        emailResultDiv.innerHTML = "Email and Token matched!";
                        signUpBtn.disabled = false; // Kích ho?t nút Sign Up
                    } else {
                        tokenResultDiv.style.color = "red";
                        tokenResultDiv.innerHTML = "Token does not match!";
                        emailResultDiv.style.color = "red";
                        emailResultDiv.innerHTML = "Email and Token does not match!";
                        signUpBtn.disabled = true; // Vô hi?u hóa nút Sign Up
                    }
                }
            };
        </script>





    </body>
</html>