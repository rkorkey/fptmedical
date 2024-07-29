<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <link rel="stylesheet" href="#" id="colors">
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
                height: 300px;
            }
            .container-right{
                display: flex;
                flex-direction: column;
                margin-left: 20px;
            }

            .selected{
                background-color: #008CBA;
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
        <script>
            window.onload = generateTimeSlots;
            var startDate = null;
            var endDate = null;

            function generateTimeSlots() {
                var availableSlots = JSON.parse(document.getElementById("availableSlots").value);
                var doctorId = document.getElementById("selectDoctor").value;
                if (doctorId.length === 0)
                    return;
                var duration = document.getElementById("duration").value;
                var startTime = parseTimeString(document.getElementById("starTime").value);
                var endTime = parseTimeString(document.getElementById("endTime").value);
                var date = new Date(document.getElementById("date").value);
                startTime.setFullYear(date.getFullYear());
                startTime.setMonth(date.getMonth());
                startTime.setDate(date.getDate());
                endTime.setFullYear(date.getFullYear());
                endTime.setMonth(date.getMonth());
                endTime.setDate(date.getDate());
                var count = 0;
                while (startTime < endTime) {
                    var startTimeString = getHourAndMinute(startTime);
                    var startTimeTemp = new Date(startTime);
                    startTime.setMinutes(startTime.getMinutes() + parseInt(duration));
                    var endTimeString = ""
                    var endTimeTemp = new Date(startTime);
                    if (startTime > endTime) {
                        endTimeString = getHourAndMinute(endTime);
                    } else {
                        endTimeString = getHourAndMinute(startTime);
                    }
                    if (availableSlots[count]) {
                        var buttonHTML = '<button  type="button" onclick="booking(event,\'' + startTimeTemp + '\', \'' + endTimeTemp + '\')" class="slot-item col-lg-4 col-md-5 col-12">' + startTimeString + "-" + endTimeString + '</button>';
                    } else {
                        var buttonHTML = '<button type="button" disabled class="slot-item disabled col-lg-4 col-md-5 col-12">' + startTimeString + "-" + endTimeString + '</button>';
                    }
                    const isMorning = startTimeTemp.getHours() < 12;
                    if(isMorning) $(".morning-time-schedule").append(buttonHTML);
                    else $(".afternoon-time-schedule").append(buttonHTML)
                    count++;
                }
            }

            function booking(event, slotStart, slotEnd) {
                var btnSlot = event.target;
                var slots = document.getElementsByClassName("slot-item");
                for (var i = 0; i < slots.length; i++) {
                    slots[i].classList.remove("selected");
                }
                btnSlot.classList.add("selected");
                var btnBooking = document.getElementById("bookAppointment");
                btnBooking.disabled = false;
                startDate = slotStart;
                endDate = slotEnd;
                document.getElementById("selectedStartDate").value = slotStart;
                document.getElementById("selectedEndDate").value = slotEnd;
            }

            function onBook(endPoint) {
                var doctorId = document.getElementById("selectDoctor").value;
                var note = document.getElementById("note").value;

                $.ajax({
                    type: "POST",
                    url: endPoint,
                    data: {
                        doctorId: doctorId,
                        note: note,
                        startDate: startDate,
                        endDate: endDate
                    },
                    success: function (response) {
                        var result = parseInt(response);
                        if (result !== 0) {
                            swal({
                                title: 'Success!',
                                text: 'Book successfully.',
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

            function getHourAndMinute(date) {
                var hour = date.getHours();
                var minute = date.getMinutes();

                // Formatting the hour and minute with leading zeros if necessary
                hour = hour < 10 ? '0' + hour : hour;
                minute = minute < 10 ? '0' + minute : minute;

                return hour + ':' + minute;
            }


            function parseTimeString(timeString) {
                var parts = timeString.split(':');
                var hour = parseInt(parts[0], 10);
                var minute = parseInt(parts[1], 10);

                // Create a new Date object with today's date
                var now = new Date();

                // Set the hours and minutes
                now.setHours(hour);
                now.setMinutes(minute);

                return now;
            }

            function request(url) {
                var doctorId = document.getElementById("selectDoctor").value;
                var majorId = document.getElementById("selectMajor").value;
                var date = document.getElementById("selectDate").value;
                window.location.href = url + "?date=" + date + "&doctorId=" + doctorId + "&majorId=" + majorId;
            }
        </script>
    </head>
    <body>
        <input type="hidden" value="${requestScope.duration}" id="duration">
        <input type="hidden" value="${requestScope.starTime}" id="starTime">
        <input type="hidden" value="${requestScope.endTime}" id="endTime">
        <input type="hidden" value="${requestScope.date}" id="date">
        <input type="hidden" value="${requestScope.availableSlots}" id="availableSlots">
        <input type="hidden" value="${requestScope.majorId}" id="majorId">
        <%@include file="header.jsp" %>

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>Get Your Appointment</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Appointment</li>
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
                                <h3>Book your appointment</h3>
                                <p>We will confirm your appointment within 2 hours</p>
                            </div>
                            <div class="form">
                                <input type="hidden" name="startDate" id="selectedStartDate"/>
                                <input type="hidden" name="endDate" id="selectedEndDate"/>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <input name="name" type="text" placeholder="Name" disabled value="${sessionScope.user.name}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <input name="email" type="email" placeholder="Email" disabled value="${sessionScope.user.email}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <input name="phone" type="text" placeholder="Phone" disabled value="${sessionScope.user.phone}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <select class="form-control" id="selectMajor" name="majorId" onchange="request('${pageContext.request.contextPath}/appointment')">
                                                <option value="">Department</option>
                                                <c:forEach items="${requestScope.majors}" var="major">
                                                    <option value="${major.id}" ${requestScope.majorId == major.id ? 'selected="selected"' : ''} > ${major.nameMajor} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <select class="form-control"  name="doctorId" id="selectDoctor" onchange="request('${pageContext.request.contextPath}/appointment')">
                                                <option  value="">Doctor</option>
                                                <c:forEach items="${requestScope.doctors}" var="doctor">
                                                    <option value="${doctor.doctorId}" ${requestScope.doctorId == doctor.doctorId ? 'selected="selected"' : ''} > ${doctor.doctorName} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <input type="date" placeholder="Date" min="${requestScope.minDate}" id="selectDate" value="${requestScope.date}" name="date" onchange="request('${pageContext.request.contextPath}/appointment')">
                                        </div>
                                    </div>
                                    <div class="morning-time-schedule">
                                        <h4>Morning</h4>
                                    </div>
                                        <div class="slot-break"></div>
                                    <div class="afternoon-time-schedule">
                                        <h4>Afternoon</h4>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <div class="form-group">
                                            <textarea name="note" id="note"  placeholder="Write Your Note Here....."></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <div class="button">
                                                <button disabled class="btn" id="bookAppointment" onclick="onBook('${pageContext.request.contextPath}/appointment')">Book An Appointment</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12 ">
                        <div class="my-container appointment-inner">
                            <div>
                                <img class="avatar" src="${requestScope.doctor != null ? requestScope.doctor.avatar : ""}" />
                            </div>
                            <div class="container-right">
                                <h2>${requestScope.doctor != null ? requestScope.doctor.name : ""}</h2>
                                <c:forEach items="${requestScope.majors}" var="major">
                                    <c:if test="${requestScope.doctor.majorId == major.id}">
                                        <h4>${major.nameMajor}</h4>
                                    </c:if>
                                </c:forEach>
                            </div>
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
    </body>
</html>