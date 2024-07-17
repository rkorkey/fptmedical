<%-- 
    Document   : header
    Created on : Mar 13, 2024, 10:49:46 AM
    Author     : My Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Enums.UserRoleEnum"%>
<%@page import="entity.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            /*CSS bieu tuong nguoi dung*/
            #user-icon:hover i {
                transform: scale(1.2); /* T?ng kích th??c c?a bi?u t??ng khi di chu?t qua */
                cursor: pointer !important;
            }

            #user-options a:hover {
                background-color: #1A76D1; /* ??i màu n?n khi di chu?t qua */
                color: #000; /* ??i màu ch? khi di chu?t qua */
            }

            .btn:hover {
                cursor: pointer !important;
            }

            .notification-badge {
                position: relative;
                display: inline-block;
            }

            .badge {
                position: absolute;
                top: -8px;
                right: -8px;
                background-color: red;
                color: white;
                border-radius: 50%;
                padding: 4px 6px;
                font-size: 12px;
            }
            .notification-item {
                display: flex;
                align-items: center;
                flex-direction: column;
                min-height: 60px;
                border-bottom: 1px solid black;
            }

            .notification-item:hover{
                opacity: 0.7;
                cursor: pointer;
            }

            .notification-content {
                flex-grow: 1;
                padding: 0 10px;
            }

            .notification-message {
                margin: 0;
                font-size: 14px;
                color: #666;
                display: inline-block;
            }

            .notification-badge:hover{
                opacity: 0.7;
                cursor: pointer;
            }

            .notification-badge{

            }
            
            #dropdown-majors{
                animation-name: dropDown;
                animation-delay: 1s;
            }
            
            @keyframes dropDown{
                from{
                    height : 0px;
                }to{
                    heiht : 100%;
                }
            }

            .notification-list{
                display: none;
                height: 200px;
                overflow: auto;
                position: absolute;
                z-index: 2;
                border-radius: 3px;
                border : 1px solid #ccc;
                animation-name: fadeIn;
                animation-duration: 1s;
                background: white;
            }

            @keyframes fadeIn{
                from{
                    opacity : 0;
                }to{
                    opacity : 1;
                }
            }
            .bi{
                display: inline-block;
                font-size: 25px;
                color : red;
            }

            .create-date{
                clear: both;
                display: block;
                font-size: 15px;
            }

            /* For WebKit browsers (Chrome, Safari) */
            ::-webkit-scrollbar {
                width: 12px;
            }

            ::-webkit-scrollbar-thumb {
                background-color: #888;
                border-radius: 6px;
            }

            ::-webkit-scrollbar-thumb:hover {
                background-color: #555;
            }

            /* For Firefox */
            ::-moz-scrollbar {
                width: 12px;
            }

            ::-moz-scrollbar-thumb {
                background-color: #888;
                border-radius: 6px;
            }

            ::-moz-scrollbar-thumb:hover {
                background-color: #555;
            }

            /* For Internet Explorer */
            /* Note: This is not widely supported and may not work in all versions */
            ::-ms-scrollbar {
                width: 12px;
            }

            ::-ms-scrollbar-thumb {
                background-color: #888;
                border-radius: 6px;
            }

            ::-ms-scrollbar-thumb:hover {
                background-color: #555;
            }

        </style>
    </head>
    <body>
        <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" />
        <input type="hidden" id="bookingEndpoint" value="${pageContext.request.contextPath}/appointment" />
        <input type="hidden" id="getStartEndTimeEndpoint" value="${pageContext.request.contextPath}/GetStartEndTimeController"/>
        <input type="hidden" id="getNotificationsEndpoint" value="${pageContext.request.contextPath}/GetNotificationController"/>
        <input type="hidden" id="updateNotificationsEndpoint" value="${pageContext.request.contextPath}/UpdateNotificationController"/>
        <input type="hidden" id="getMajors" value="${pageContext.request.contextPath}/GetMajorController"/>
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
        <!-- Header Area -->
        <header class="header" >
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-5 col-12">

                        </div>
                        <div class="col-lg-6 col-md-7 col-12">
                            <c:if test="${not empty sessionScope.user}" >
                                <div class="notification-badge">
                                    <i class="fa fa-bell" style="font-size:24px;color: blue;"></i>
                                    <span class="badge" id="badge"></span>
                                </div>
                                <div class="notification-list" id="notification-list"></div>
                                <!-- Top Contact -->
                                <ul class="top-contact">
                                    <li><i class="fa fa-user"></i>Welcome : ${sessionScope.user.email}</li>
                                </ul>
                            </c:if>

                            <!-- End Top Contact -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <!-- Middle Header -->
            <div class="middle-header">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-12">
                            <!-- Start Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/HomeServlet"><img src="${pageContext.request.contextPath}/Main Template/img/logo.png" alt="#"></a>
                            </div>
                            <!-- End Logo -->
                        </div>
                        <div class="col-lg-9 col-md-9 col-12">
                            <div class="widget-main">
                                <!-- Single Widget -->
                                <div class="single-widget">
                                    <i class="icofont-clock-time"></i>
                                    <p>Opening Time</p>
                                    <h4>Mon-Sat: <span id="startDate"></span> - <span id="endDate"></span> </h4>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget -->
                                <div class="single-widget">
                                    <c:if test="${empty sessionScope.user or sessionScope.user.role eq 'Customer'}">
                                        <a href="${pageContext.request.contextPath}/appointment" class="btn" style="color: white;">Book Appointment</a>
                                    </c:if>
                                </div>
                                <!--/ End Single Widget -->
                                <!-- Single Widget: Thêm bi?u t??ng ng??i dùng -->
                                <!-- Single Widget: Thêm bi?u t??ng ng??i dùng -->
                                <div class="single-widget">
                                    <a id="user-icon">
                                        <i class="icofont-user-alt-7"></i>
                                    </a>
                                    <!-- Hi?n th? ch? Profile và Login -->
                                    <span id="user-options" style="display: none; position: absolute; background-color: #fff; border: 1px solid #ccc; padding: 5px; z-index: 999;">
                                        <a href="${pageContext.request.contextPath}/Main Template/profile.jsp" style="display: block;
                                           text-decoration: none; color: #333; font-weight: bold">Profile</a>                                          
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="${pageContext.request.contextPath}/Main Template/login.jsp" style="display: block; text-decoration: none;
                                               color: #333; font-weight: bold">Login</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <a href="${pageContext.request.contextPath}/LogOutServlet" style="display: block; text-decoration: none;
                                               color: #333; font-weight: bold">Logout</a>
                                        </c:if>
                                    </span>
                                </div>
                                <!--/ End Single Widget -->

                                <!--/ End Single Widget -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End Middle Header -->
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-7 col-md-9 col-12">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user and sessionScope.user.role eq 'Admin'}">
                                        <!-- Main Menu -->
                                        <div class="main-menu">
                                            <nav class="navigation">
                                                <ul class="nav menu">
                                                    <li><a href="${pageContext.request.contextPath}/createDoctor">Doctor Management </a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath}/showBlog">Blogs </a>
                                                    <li><a href="${pageContext.request.contextPath}/viewAppointment">Appointment </a></li>
                                                    <li><a href="${pageContext.request.contextPath}/viewDoctorSchedule">Doctor Schedule </a></li>
                                                    <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard </a></li>
                                                    <li><a href="${pageContext.request.contextPath}/viewFeedback"> Feedback </a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <!--/ End Main Menu -->
                                    </c:when>
                                    <c:when test="${not empty sessionScope.user and sessionScope.user.role eq 'Professor'}">
                                        <!-- Main Menu -->
                                        <div class="main-menu">
                                            <nav class="navigation">
                                                <ul class="nav menu">
                                                    <li><a href="${pageContext.request.contextPath}/timeTableRegistration">Time table </a>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath}/doctorAppointment">Appointment </a></li>
                                                    <li><a href="${pageContext.request.contextPath}/blogList">Blogs</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <!--/ End Main Menu -->
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Main Menu -->
                                        <div class="main-menu">
                                            <nav class="navigation">
                                                <ul class="nav menu">
                                                    <li id="doctorNav">
                                                        <a href="${pageContext.request.contextPath}/doctors">Doctors <i class="icofont-rounded-down"></i></a>
                                                        <ul class="dropdown" id="dropdown-majors">
                                                        </ul>
                                                    </li>
                                                    </li>
                                                    <li><a href="#">Appointment <i class="icofont-rounded-down"></i></a>
                                                        <ul class="dropdown">
                                                            <li><a href="${pageContext.request.contextPath}/appointment">Booking Appointment</a></li>
                                                            <li><a href="${pageContext.request.contextPath}/myAppointment">My Appointment</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/blogList">Blogs</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <!--/ End Main Menu -->
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            document.getElementById("user-icon").addEventListener("click", function () {
                var userOptions = document.getElementById("user-options");
                if (userOptions.style.display === "none") {
                    userOptions.style.display = "inline-block";
                } else {
                    userOptions.style.display = "none";
                }
            });

            var endPoint = document.getElementById("getStartEndTimeEndpoint").value;
            var notificationEndpoint = document.getElementById("getNotificationsEndpoint").value;
            var majorsEndpoint = document.getElementById("getMajors").value;
            var bookingEndpoint = document.getElementById("bookingEndpoint").value;
            $.ajax({
                type: "GET",
                url: endPoint,
                success: function (response) {
                    const startDate = response.split("&")[0];
                    const endDate = response.split("&")[1];
                    $("#startDate").append(startDate + "");
                    $("#endDate").append(endDate + "");
                }
            });
            
            $("#doctorNav").on("hover" , function() {
                $("#dropdown-majors").toggle();
            })
            
            $.ajax({
               type : "GET",
               url: majorsEndpoint,
               success: function (response){
                   var majors = JSON.parse(response);
                   majors.forEach(major => {
                       var majorItemLink = '<li><a href="'+  bookingEndpoint + "?majorId=" + major.id  +'">'+ major.nameMajor +' </a></li>';
                       $("#dropdown-majors").append(majorItemLink);
                   })
               }
            });

            $.ajax({
                type: "GET",
                url: notificationEndpoint,
                success: function (response) {
                    if(response.length === 0 ) return;
                    var notifications = JSON.parse(response);
                    var notReadedNoti = notifications.filter(noti => {
                        return !noti.isReaded;
                    })
                    if (notReadedNoti.length > 0)
                        $("#badge").append(notReadedNoti.length + "");
                    
                    for (let i = 0; i < notifications.length; i++) {
                        const notificationItemHTML = `
                                                    <div class="notification-item" onclick="readNotification(` + notifications[i].id + ",'" + notifications[i].link + `')">
                                                      <div class="notification-content">` +
                                (!notifications[i].isReaded ? '<span class="bi bi-dot"></span>' : '')
                                + `<p class="notification-message">` + notifications[i].content + `</p>
                                                      </div>` + '<span class="create-date">   ' + notifications[i].createdAt + '</span>' +
                                `</div>`;
                        $("#notification-list").append(notificationItemHTML);
                    }
                }
            });
            $(".notification-badge").on("click", function () {
                $("#notification-list").toggle();
            });

            function readNotification(id, link) {
                var contextPath = document.getElementById("contextPath").value;
                var endPoint = document.getElementById("updateNotificationsEndpoint").value;
                $.ajax({
                    type: "GET",
                    url: endPoint,
                    data: {
                        id: id
                    },
                    success: function (response) {
                        window.location.href = contextPath + link;
                    }
                });
            }
        </script>
        <!-- End Header Area -->
    </body>
</html>
