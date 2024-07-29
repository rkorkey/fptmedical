<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <style>
            .slot-item {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 8px;
            }



            .avatar {
                width: 100%; /* Adjust size as needed */
                height: 200px; /* Adjust size as needed */
                border: 2px solid #fff; /* Add a border */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a shadow */
                object-fit: fill;
            }

            .my-container{
                display: flex;
                justify-content: space-between;
            }
            .container-right{
                display: flex;
                flex-direction: column;
                margin-left: 20px;
            }

            .selected{
                background-color: #008CBA;
            }

            #calendar{
                width: 100%;
                height: 40%;
            }

            .disabled{
                background-color: #dddddd;
                color: #aaaaaa;
                cursor: not-allowed;
                border: 1px solid #dddddd;
                text-align: center;
                display: inline-block;
                text-decoration: none;
            }

            .slot-break{
                border-bottom: 1px solid black;
                width: 100%;
                margin: 10px;
            }
        </style>
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>

    </head>
    <body>
        <input type="hidden" value='${requestScope.doctorSchedules}' id="doctorSchedules" />
        <input type="hidden" value="${requestScope.date}" id="date">
        <%@include file="header.jsp" %>

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Time Table Registration</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Time Table Registration</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Appointment -->
        <section class="appointment single-page">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 col-12">
                        <div class="appointment-inner">
                            <div class="title">
                                <h3>Time Table Registration</h3>
                            </div>
                            <form class="form" action="${pageContext.request.contextPath}/timeTableRegistration" method="post">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <input type="date"  min="${requestScope.minDate}" placeholder="Date" id="selectDate" value="${requestScope.date}"  onchange="request('${pageContext.request.contextPath}/timeTableRegistration', this.value)">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="morning-time-schedule">
                                        <h4>Morning</h4>
                                        <c:forEach items="${requestScope.slots}" var="slot">
                                            <c:if test="${slot.startHour.getHours() < 12}">
                                                <c:if test="${slot.isDuplicated}">
                                                    <button type="button" class="slot-item disabled" > <fmt:formatDate value="${slot.startHour}" pattern="HH:mm" />  - <fmt:formatDate value="${slot.endHour}" pattern="HH:mm" /></button>
                                                </c:if>
                                                <c:if test="${!slot.isDuplicated}">
                                                    <button type="button" onclick="register('${slot.startHour}', '${slot.endHour}', '${pageContext.request.contextPath}/timeTableRegistration')" class="slot-item" > <fmt:formatDate value="${slot.startHour}" pattern="HH:mm" />  - <fmt:formatDate value="${slot.endHour}" pattern="HH:mm" /></button>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="slot-break"></div>
                                    <div class="afternoon-time-schedule">
                                        <h4>Afternoon</h4>
                                        <c:forEach items="${requestScope.slots}" var="slot">
                                            <c:if test="${slot.startHour.getHours() >= 12}">
                                                <c:if test="${slot.isDuplicated}">
                                                    <button type="button" class="slot-item disabled" > <fmt:formatDate value="${slot.startHour}" pattern="HH:mm" />  - <fmt:formatDate value="${slot.endHour}" pattern="HH:mm" /></button>
                                                </c:if>
                                                <c:if test="${!slot.isDuplicated}">
                                                    <button type="button" onclick="register('${slot.startHour}', '${slot.endHour}', '${pageContext.request.contextPath}/timeTableRegistration')" class="slot-item" > <fmt:formatDate value="${slot.startHour}" pattern="HH:mm" />  - <fmt:formatDate value="${slot.endHour}" pattern="HH:mm" /></button>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 " style="margin-top: 10px;">
                        <div class="my-container appointment-inner">
                            <h3>Time Table</h3>
                            <div id='calendar'></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/End Appointment -->

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
        <!-- Sweet Alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

                                               document.addEventListener('DOMContentLoaded', function () {
                                                   var calendarEl = document.getElementById('calendar');
                                                   var scheduleJson = document.getElementById('doctorSchedules').value;
                                                   console.log(scheduleJson);
                                                   var schedule = JSON.parse(scheduleJson);
                                                   var dataMapping = schedule.map(schedule => {
                                                       return {
                                                           title: schedule.status == 0 ? 'PENDING' : schedule.status == 1 ? 'CANCELED' : 'APPROVED',
                                                           start: new Date(schedule.startDate),
                                                           end: new Date(schedule.endDate),
                                                           status : schedule.status
                                                       }
                                                   });
                                                   var calendar = new FullCalendar.Calendar(calendarEl, {
                                                       initialView: 'timeGridWeek',
                                                       events: dataMapping,
                                                       eventDidMount: function (info) {
                                                           // Determine color based on status
                                                           var statusColor;
                                                           switch (info.event.extendedProps.status) {
                                                               case 2:
                                                                   statusColor = 'green';
                                                                   break;
                                                               case 0:
                                                                   statusColor = '#daf505';
                                                                   break;
                                                               default:
                                                                   statusColor = 'red'; // Default color
                                                           }
                                                           console.log(statusColor);
                                                           info.el.style.backgroundColor = statusColor;
                                                           info.el.style.borderColor = statusColor;
                                                       }
                                                   });
                                                   calendar.render();
                                               });

                                               function register(startDate, endDate, endPoint) {
                                                   var confirm = window.confirm("Are you sure to register slot from " + startDate + " to " + endDate);
                                                   if (confirm) {
                                                       $.ajax({
                                                           url: endPoint,
                                                           type: 'POST',
                                                           data: {
                                                               startDate: startDate,
                                                               endDate: endDate
                                                           },
                                                           success: function (result) {
                                                               if (parseInt(result) !== 0) {
                                                                   swal({
                                                                       title: 'Success!',
                                                                       text: 'Register successfully.',
                                                                       icon: 'success',
                                                                       confirmButtonText: 'Okay'
                                                                   }).then((result) => {
                                                                       window.location.reload();
                                                                   });
                                                                   return;
                                                               }
                                                               swal({
                                                                   title: 'Fail!',
                                                                   text: 'Something wrong happened!.',
                                                                   icon: 'error'
                                                               })
                                                           }
                                                       });

                                                   }
                                               }

                                               function request(endpoint, dateValue) {
                                                   window.location.href = endpoint + "?date=" + dateValue;
                                               }

        </script>
    </body>
</html>