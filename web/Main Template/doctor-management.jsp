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

        <!-- Include DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.min.css">
        <!-- SweetAlert2 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

        <link rel="stylesheet" href="#" id="colors">
        <script>
            window.onload = function () {
                var table = $('#myTable').DataTable();
                var jsonString = document.getElementById("doctors").value;
                var doctors = JSON.parse(jsonString);

                for (var i = 0; i < doctors.length; i++) {
                    table.row.add([
                        doctors[i].doctorName,
                        doctors[i].major,
                        doctors[i].address, // Name
                        "<img class='image' src='" + doctors[i].avatar + "' />",
                        doctors[i].phone,
                        doctors[i].email
                    ]).draw();
                }
            };
        </script>
        <style>
            .image{
                object-fit: fill;
                width: 90px;
                height: 90px;
            }



            #myTable{
                width: 80vw;
            }

            .button {
                display: inline-block;
                padding: 10px 20px; /* Adjust padding as needed */
                background-color: #4CAF50; /* Set background color */
                color: white !important; /* Set text color */
                text-align: center;
                text-decoration: none;
                border: none;
                border-radius: 4px; /* Optional: Add rounded corners */
                cursor: pointer;
                font-size: 16px; /* Adjust font size as needed */
            }

            /* Hover effect */
            .button:hover {
                opacity: 0.8;
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
                            <h2>Doctor Management</h2>
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}/HomeServlet">Home</a></li>
                                <li><i class="icofont-simple-right"></i></li>
                                <li class="active">Doctor Management</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Team -->
        <section id="team" class="team section single-page">
            <input type="hidden" value='${requestScope.doctors}' id="doctors"/>
            <table id="myTable">
                <thead>
                    <tr>
                        <th>Doctor</th>
                        <th>Major</th>
                        <th>Address</th>
                        <th>Avatar</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
                <tr style="text-align: center;">
                    <td colspan="6" class="btn btn-default" data-toggle="modal" data-target="#addDoctorModal">Add Doctor</td>
                </tr>
            </table>
        </section>
        <!--/ End Team -->
        <!-- Modal -->
        <div class="modal fade" id="addDoctorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Doctor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addDoctorForm">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone:</label>
                                <input type="text" class="form-control" id="phone">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password">
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" class="form-control" id="address">
                            </div>
                            <div class="form-group">
                                <label for="avatar">Avatar URL:</label>
                                <input type="text" class="form-control" id="avatar">
                            </div>
                            <div class="form-group">
                                <select class="form-control" id="major" name="majorId">
                                    <option value="">Department</option>
                                    <c:forEach items="${requestScope.majors}" var="major">
                                        <option value="${major.id}" ${requestScope.majorId == major.id ? 'selected="selected"' : ''} > ${major.nameMajor} </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
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
            <input type="hidden" id="endPoint" value="${pageContext.request.contextPath}/createDoctor" />
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
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/Main Template/js/main.js"></script>
        <!-- Sweet Alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Include DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
        <script>
                                               document.getElementById('addDoctorForm').addEventListener('submit', function (event) {
                                                   event.preventDefault(); // Prevent default form submission
                                                   
                                                   var endPoint = document.getElementById("endPoint").value;
                                                   // Get values from the form
                                                   var name = document.getElementById('name').value;
                                                   var phone = document.getElementById('phone').value;
                                                   var email = document.getElementById('email').value;
                                                   var password = document.getElementById('password').value;
                                                   var address = document.getElementById('address').value;
                                                   var avatar = document.getElementById('avatar').value;
                                                   var majorId = document.getElementById('major').value;

                                                   // Create a data object with the properties
                                                   var doctorData = {
                                                       name: name,
                                                       phone: phone,
                                                       email: email,
                                                       password: password,
                                                       address: address,
                                                       avatar: avatar,
                                                       majorId: majorId
                                                   };

                                                   // Here, you would typically send this data to your server using AJAX or fetch
                                                   // For the sake of simplicity, let's just log the data for now
                                                   console.log("New Doctor Data:", doctorData);

                                                   $.ajax({
                                                       type: "POST",
                                                       url: endPoint,
                                                       data: doctorData,
                                                       success: function (response) {
                                                           var result = parseInt(response);
                                                           if (result !== 0) {
                                                               swal({
                                                                   title: 'Success!',
                                                                   text: 'Save successfully.',
                                                                   icon: 'success',
                                                                   confirmButtonText: 'Okay'
                                                               }).then((result) => {
                                                                   // Close the modal
                                                                   $('#addDoctorModal').modal('hide');
                                                                    
                                                                   // Reset form fields
                                                                   document.getElementById('addDoctorForm').reset();
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

                                               });
        </script>
    </body>
</html>

