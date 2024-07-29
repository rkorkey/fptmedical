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
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
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

        <!-- Include DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.min.css">


        <link rel="stylesheet" href="#" id="colors">
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
        
        <style>
            #team{
                display: flex;
            }
            .fa-star:hover{
                cursor: pointer;
            }

            .checked{
                color: yellow;
            }

            #myTable_wrapper{
                left : 10%;
            }

            #myTable{
                width: 80vw;
            }

            #calendar{
                width: 90%;
                height: 70vh;
            }
            .activeEvent:hover{
                opacity: 0.7;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <input  type="hidden" value="${pageContext.request.contextPath}/bookingDetail" id="bookingDetail" />
        <input type="hidden" value="${pageContext.request.contextPath}/giveFeedback" id="feedbackEndpoint" />

        <!-- Breadcrumbs -->
        <div class="breadcrumbs overlay">
            <div class="container">
                <div class="bread-inner">
                    <div class="row">
                        <div class="col-12">
                            <h2>My Appointment</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">My Appointment</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Team -->
        <section id="team" class="team section single-page">
            <input type="hidden" value='${requestScope.bookings}' id="bookings"/>
            <h3>Booking Schedule</h3>
            <div id='calendar'></div>
        </section>
        <!--/ End Team -->

        <!-- Modal -->
        <div class="modal" tabindex="-1" role="dialog" id="feedbackModel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Give Feedback</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <textarea class="form-control" id="content"></textarea>
                        </div>
                        <div class="form-group" id="vote">
                            <label>Vote: </label>
                            <span class="fa fa-star" id="star-1" onmouseover="checkstar(1)"></span>
                            <span class="fa fa-star" id="star-2" onmouseover="checkstar(2)"></span>
                            <span class="fa fa-star" id="star-3" onmouseover="checkstar(3)"></span>
                            <span class="fa fa-star" id="star-4" onmouseover="checkstar(4)"></span>
                            <span class="fa fa-star" id="star-5" onmouseover="checkstar(5)"></span>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn-save">Save changes</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        <!-- Sweet Alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            var stars = 0;
            var bookingId = 0;
            window.onload = function () {
                var calendar = document.getElementById('calendar');
                var jsonString = document.getElementById("bookings").value;
                var bookings = JSON.parse(jsonString);
                var endPoint = document.getElementById("bookingDetail").value;
                var feedbackEndpoint = document.getElementById("feedbackEndpoint").value;
                $("#btn-save").on('click', function () {
                    var content = $("#content").val();
                    $.ajax({
                        type: "POST",
                        url: feedbackEndpoint,
                        data: {
                            bookingId :  bookingId,
                            content :  content,
                            vote : stars
                        },
                        success: function (response) {
                            var result = parseInt(response);
                            if (result !== 0) {
                                swal({
                                    title: 'Success!',
                                    text: 'Your feedback was saved.',
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
                })

                var dataMapping = bookings.map(booking => {
                    var isHavingFeedback = booking.feedback.id !== 0;
                    return {
                        title: booking.statusName + ( isHavingFeedback ? '    V' : ''),
                        start: new Date(booking.startDate),
                        end: new Date(booking.endDate),
                        status: booking.statusName,
                        extendedProps: {
                            id: booking.id,
                            feedback: booking.feedback
                        }
                    }
                });
                var calendar = new FullCalendar.Calendar(calendar, {
                    initialView: 'timeGridWeek',
                    events: dataMapping,
                    eventClick: function (info) {
                        if (info.event.extendedProps.status !== 'PENDING' && info.event.extendedProps.status !== 'DONE')
                            return;
                        if (info.event.extendedProps.status === 'PENDING') {
                            window.location.href = endPoint + "?id=" + info.event.extendedProps.id;
                            return;
                        }
                        bookingId = info.event.extendedProps.id;
                        var isHavingFeedback = info.event.extendedProps.feedback.id !== 0;
                        if (isHavingFeedback) {
                            window.location.href = endPoint + "?id=" + info.event.extendedProps.id;
                        } else {
                            $("#feedbackModel").modal('show');
                            $("#btn-save").prop('disabled', false);
                            $("#content").val('');
                            $("#content").prop('disabled', false);
                            for (let i = 1; i <= 5; i++) {
                                $('#star-' + i).removeClass("checked");
                            }
                        }
                    },
                    eventMouseEnter: function (info) {
                        if (info.event.extendedProps.status !== 'PENDING' && info.event.extendedProps.status !== 'DONE')
                            return;
                        info.el.className += ' activeEvent';
                    },
                    eventDidMount: function (info) {
                        // Determine color based on status
                        var statusColor;
                        switch (info.event.extendedProps.status) {
                            case 'EXAMINING':
                                statusColor = 'green';
                                break;
                            case 'PENDING':
                                statusColor = '#daf505';
                                break;
                            default:
                                statusColor = 'blue'; // Default color
                        }
                        console.log(statusColor);
                        info.el.style.backgroundColor = statusColor;
                        info.el.style.borderColor = statusColor;
                    }
                });
                calendar.render();
            };
            function checkstar(starValue) {
                    stars = starValue;
                    for (let i = 1; i <= 5; i++) {
                        if (i <= starValue) {
                            $('#star-' + i).addClass("checked");
                        } else {
                            $('#star-' + i).removeClass("checked");
                        }
                    }
                }
        </script>
        <!-- Include DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
    </body>
</html>

