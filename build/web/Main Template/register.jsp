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
        <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
        <!-- Title -->
        <title>Mediplus - Medical and Doctor Directory HTML Template.</title>

        <!-- Favicon -->
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
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
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
                                <img  src="img/register.png" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="register-form">
                                <h2>Register Here</h2>
                                <p>Already have an account ? <a href="login.jsp">Login Here</a></p>
                                <!--                                 Form -->
                                <form id="emailForm" class="form" method="" action="register.jsp">
                                    <div>
                                        <div class="row">                                  
                                            <div class="col-lg-6">
                                                <div style = "background-color: black;border: 3px solid black; border-radius: 10px;">
                                                    <input type="email" id="to" name="email" placeholder="Email" required="" style="border: none; outline: none; padding: 10px; border-radius: 5px; width: 100%; box-sizing: border-box; color: black; background-color: white;">
                                                </div>
                                            </div>                                   
                                            <div>
                                                <input type="hidden" id="tokenInput" name="token" value="">
                                            </div>

                                            <%
                                                // L?y giá tr? c?a tham s? 'token' t? URL
                                                String token = request.getParameter("token");

                                                // Ki?m tra xem token có t?n t?i không
                                                if (token != null && !token.isEmpty()) {
                                                    // Token ???c tìm th?y trong URL
                                                    out.println("Token From URL: " + token);
                                                } else {
                                                    // Không tìm th?y token trong URL
                                                    out.println("No Token in URL");

                                                    if (token != null && !token.isEmpty()) {
                                                        // ??t token vào session
                                                        session.setAttribute("token", token);
                                                    }

                                                }

                                            %>
                                            <%                                                // L?y giá tr? c?a tham s? 'email' t? URL
                                                String email = request.getParameter("email");

                                                // Ki?m tra xem email có t?n t?i không
                                                if (email != null && !email.isEmpty()) {
                                                    // Email ???c tìm th?y trong URL
                                                    out.println("    Email : " + email);
                                                } else {
                                                    // Không tìm th?y email trong URL
                                                    out.println("No Email");
                                                }
                                            %>

                                            <%    if (token != null && !token.isEmpty()) {
                                            %>
                                            <div style="position: relative; left:   300px;top:  63px">      <a href="register2.jsp?token=<%=token%>&email=<%=email%>"
                                                                                                               style="display: inline-block;
                                                                                                               padding: 10px 20px;
                                                                                                               font-size: 16px;
                                                                                                               cursor: pointer;
                                                                                                               text-align: center;
                                                                                                               text-decoration: none;
                                                                                                               outline: none;
                                                                                                               border: none;
                                                                                                               border-radius: 5px;
                                                                                                               box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                                                                                                               background-color: #1A76D1;
                                                                                                               color: white;
                                                                                                               transition: background-color 0.3s;
                                                                                                               margin-top: 10px; /* Optional: Add margin top for spacing */"
                                                                                                               onmouseover="this.style.backgroundColor = '#2C2D3F';"
                                                                                                               onmouseout="this.style.backgroundColor = '#1A76D1';">
                                                    Register Step 2/2 =>
                                                </a>
                                            </div> 

                                            <%
                                                }
                                            %>




                                        </div>
                                </form>
                                <br/>

                                <input style="display: inline-block;
                                       padding: 10px 20px;
                                       font-size: 16px;
                                       cursor: pointer;
                                       text-align: center;
                                       text-decoration: none;
                                       outline: none;
                                       border: none;
                                       border-radius: 5px;
                                       box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                                       background-color: #1A76D1;
                                       color: white;
                                       transition: background-color 0.3s;"
                                       onmouseover="this.style.backgroundColor = '#2C2D3F';"
                                       onmouseout="this.style.backgroundColor = '#1A76D1'" onclick="sendMail()";  type="submit" value="Send Verification Code 1/2">
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
        <script src="js/jquery.min.js"></script>
        <!-- jquery Migrate JS -->
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <!-- jquery Ui JS -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap Datepicker JS -->
        <script src="js/bootstrap-datepicker.js"></script>
        <!-- Jquery Nav JS -->
        <script src="js/jquery.nav.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/jquery.scrollUp.min.js"></script>
        <!-- Niceselect JS -->
        <script src="js/niceselect.js"></script>
        <!-- Tilt Jquery JS -->
        <script src="js/tilt.jquery.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- counterup JS -->
        <script src="js/jquery.counterup.min.js"></script>
        <!-- Steller JS -->
        <script src="js/steller.js"></script>
        <!-- Wow JS -->
        <script src="js/wow.min.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <!-- Counter Up CDN JS -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="js/main.js"></script>




        <!--        <script>
                    function sendMail() {
                        (function () {
                            emailjs.init("7Qhsfv2qBZKUnVVaG"); // Account Public Key
                        })();
                        var params = {
                            // sendername: document.querySelector("#sendername").value,
                            to: document.querySelector("#to").value,
                            // subject: document.querySelector("#subject").value,
                            // replyto: document.querySelector("#replyto").value,
                            // message: document.querySelector("#message").value,
                        };
                        var serviceID = "service_5upst68"; // Email Serv
                        var templateID = "template_qah0i6l"; // Email Te
                        emailjs.send(serviceID, templateID, params)
                                .then(res => {
                                    alert("Email Sent Successfully! Please check your email to activate your account ");
                                })
                                .catch(error => {
                                    console.error("Error sending email:", error);
                                });
                    }
        
        
                </script>-->
        <script>
                                               function sendMail() {
                                                   (function () {
                                                       emailjs.init("Ln9HbpdUdxHyqtE9w"); // Thay YOUR_USER_ID b?ng ID c?a tài kho?n EmailJS c?a b?n
                                                   })();

                                                   var toEmail = document.querySelector("#to").value;

                                                   // T?o m?t mã token ng?u nhiên (ví d?: s? d?ng UUID)
                                                   var token = generateToken();
                                                   document.getElementById("tokenInput").value = token;

// Submit form
                                                   document.getElementById("emailForm").submit();

                                                   var params = {
                                                       to: toEmail,
                                                       token: token // Truy?n mã token vào tham s?
                                                   };

                                                   var serviceID = "service_pwmd1nq"; // Email Serv
                                                   var templateID = "template_vyeb1eu"; // Email Te

                                                   // G?i email
                                                   emailjs.send(serviceID, templateID, params)
                                                           .then(res => {
                                                               alert("Email Sent Successfully! Please check your email to activate your account ");
                                                           })
                                                           .catch(error => {
                                                               console.error("Error sending email:", error);
                                                           });
                                               }

                                               // Bi?n l?u tr? các mã token ?ã ???c t?o ra
                                               var generatedTokens = new Set();

                                               function generateToken() {
                                                   // Hàm t?o UUID ng?u nhiên
                                                   function uuidv4() {
                                                       return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                                                           var r = Math.random() * 16 | 0,
                                                                   v = c == 'x' ? r : (r & 0x3 | 0x8);
                                                           return v.toString(16);
                                                       });
                                                   }

                                                   // T?o mã token m?i
                                                   var token;
                                                   do {
                                                       token = uuidv4();
                                                   } while (generatedTokens.has(token)); // Ki?m tra xem mã token ?ã t?n t?i ch?a

                                                   // Thêm mã token m?i vào danh sách
                                                   generatedTokens.add(token);

                                                   return token;

                                                   window.location.href = "register2.jsp";
                                               }

        </script>

    </body>
</html>