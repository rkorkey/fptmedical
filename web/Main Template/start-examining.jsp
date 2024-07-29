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
            var medicines;
            var bookingMedicines;
            var table;
            var bookingMedicinesTable;
            var totalPrice = 0;
            var selectedMedicineId = new Set();
            var defaultPrice = 0;
            var bookingId = 0;
            window.onload = function () {
                table = $('#medicinesTables').DataTable();
                bookingMedicinesTable = $('#bookingMedicinesTable').DataTable();
                var jsonString = document.getElementById("medicines").value;
                medicines = JSON.parse(jsonString);
                bookingMedicines = JSON.parse(document.getElementById("bookingMedicines").value);
                defaultPrice = parseFloat(document.getElementById("defaultPrice").value);
                generateDatatables();
                bookingId = document.getElementById("bookingId").value;
                
            };

            function save(endPoint , doctorAppointmentEndpoint) {
                var updateNeededMedicine = medicines.filter(m => {
                    return selectedMedicineId.has(m.medicineId); 
                })
                $.ajax({
                    type: "POST",
                    url: endPoint,
                    data: {
                        bookingId: bookingId,
                        totalPrice: totalPrice,
                        bookingMedicines: JSON.stringify(bookingMedicines),
                        medicines: JSON.stringify(updateNeededMedicine)
                    },
                    success: function (response) {
                        var result = parseInt(response);
                        if (result !== 0) {
                            swal({
                                title: 'Success!',
                                text: 'Save successfully.',
                                icon: 'success',
                                confirmButtonText: 'Okay'
                            }).then((result) => {
                                window.location.href = doctorAppointmentEndpoint;
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

            function generateDatatables() {
                table.clear().draw();
                bookingMedicinesTable.clear().draw();
                for (var i = 0; i < medicines.length; i++) {
                    table.row.add([
                        medicines[i].medicineName, // ID
                        medicines[i].description, // Name
                        medicines[i].quantity,
                        medicines[i].price,
                        "<button class='btn btn-default' onclick='addMedicine(" + medicines[i].medicineId + ")'> Add </button>"
                    ]).draw();
                }
                totalPrice = defaultPrice;
                for (var i = 0; i < bookingMedicines.length; i++) {
                    bookingMedicinesTable.row.add([
                        bookingMedicines[i].medicineName, // ID
                        bookingMedicines[i].description, // Name
                        bookingMedicines[i].quantity,
                        bookingMedicines[i].price,
                        "<input class='form-control' type='text' value='"+ bookingMedicines[i].note  +"' onchange='updateNote(" + bookingMedicines[i].medicineId + " , this.value)' /> ",
                        "<button class='btn btn-default' onclick='deleteMedicine(" + bookingMedicines[i].medicineId + ")'> Delete </button>"
                    ]).draw();
                    totalPrice += bookingMedicines[i].price * bookingMedicines[i].quantity;
                }
                $("#totalPrice").html(totalPrice + "");
            }

            function updateNote(id, note) {
                var bookingMedicine = bookingMedicines.filter(m => {
                    return m.medicineId === id;
                })[0];
                bookingMedicine.note = note;
            }

            function deleteMedicine(medicineId) {
                var bookingMedicine = bookingMedicines.filter(m => {
                    return m.medicineId === medicineId;
                })[0];

                var medicine = medicines.filter(m => {
                    return m.medicineId === medicineId;
                })[0];
                bookingMedicines = bookingMedicines.filter(m => {
                    return m.medicineId !== medicineId;
                });
                //xoa medicine khoi bang ben phai? 
                //-----
                console.log(bookingMedicines);
                medicine.quantity += bookingMedicine.quantity;
                generateDatatables();
            }

            function addMedicine(medicineId) {
                var medicine = medicines.filter(m => {
                    return m.medicineId === medicineId;
                    // Get medicine by id 
                })[0];
                if(medicine.quantity < 1) {
                    swal({
                            title: 'Fail!',
                            text: 'The medicine is out of quantity.',
                            icon: 'error'
                        })
                    return;
                }
                selectedMedicineId.add(medicineId);
                medicine.quantity = medicine.quantity - 1;
                var bookingMedicine = bookingMedicines.filter(m => {
                    return m.medicineId === medicineId;
                })[0];
                if (typeof bookingMedicine === 'undefined') {
                    var newMedicine = {
                        ...medicine,
                        quantity: 1,
                        note: "",
                        bookingId : bookingId
                    }
                    bookingMedicines.push(newMedicine);
                } else {
                    bookingMedicine.quantity++;
                }
                generateDatatables();
            }
        </script>
        <style>
            .appointment{
                padding-bottom:  10px !important;
            }

            #totalPrice{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <input type="hidden" value='${requestScope.medicines}' id="medicines" />
        <input type="hidden" value='${requestScope.bookingMedicines}' id="bookingMedicines" />
        <input type="hidden" value="${requestScope.booking.id}" id="bookingId" />
        <input type="hidden" value="${requestScope.defaultPrice}" id="defaultPrice" />


        <%@include file="header.jsp" %>

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
        <section class="appointment single-page">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 col-12">
                        <div class="appointment-inner">
                            <form class="form">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label> Customer </label>
                                            <input  type="text"  disabled value="${requestScope.booking.customerName}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label> Start Time </label>
                                            <input  type="text"  disabled value="${requestScope.booking.startDate}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label> End Time </label>
                                            <input  type="text"  disabled value="${requestScope.booking.endDate}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label> Booked Time </label>
                                            <input  type="text"  disabled value="${requestScope.booking.createDate}">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Start Team -->
        <section id="team" class="team section single-page">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                    <h2>Medicines</h2>
                    <table id="medicinesTables">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <h2>Booking Medicines</h2>
                    <table id="bookingMedicinesTable">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Note</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                        <tr>
                            <td>Total Price  :</td>
                            <td colspan="4" id="totalPrice"> </td>
                            <td > <button class="btn btn-default" onclick="save('${pageContext.request.contextPath}/endExamining' , '${pageContext.request.contextPath}/doctorAppointment')"> Save </button> </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
        <!--/ End Team -->

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
        <!-- Sweet Alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
        <!-- Include DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
    </body>
</html>

