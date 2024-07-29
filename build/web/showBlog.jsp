<%-- 
    Document   : showBlog
    Created on : Feb 28, 2024, 9:15:40 AM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Phòng Khám - Blog</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Main Template/css/responsive.css">
<style>
 body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

/* Thiết lập Header */
header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

/* Thiết lập Container */
.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 0 20px;
}

/* Thiết lập Blog Post */
.blog-post {
    margin-bottom: 40px;
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 5px;
}

.blog-post img {
    max-width: 100%;
    height: auto;
}

.blog-post h1 {
    margin-top: 10px;
    color: #333;
}

.blog-post p {
    margin-top: 5px;
    color: #555;
}

.blog-post .author {
    color: #888;
    font-size: 14px;
}

/* Thiết lập Button */
.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 10px 0;
    border: none;
    background-color: #4CAF50;
    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
}

.btn:hover {
    background-color: #45a049;
}

/* Thiết lập Footer */
footer {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
    position: absolute;
    bottom: 0;
    width: 100%;
}
</style>
</head>
<body>
    <%@include file="Main Template/header.jsp" %>
    <header>
        <h1>Phòng Khám - Blog</h1>
    </header>
    <div class="container">
        <a href="BlogServlet" class="btn btn-warning btn-lg text-white" title="Update this Blog">Create New Blog</a>
        <c:forEach items="${blog}" var="b">
            <tr>
                <td>
                    <div class="blog-post">
            <h1>${b.title}</h1>
                </td>
                <td>
                    Author: ${b.author}
                </td>
                <td>
                    Date: ${b.date}
                </td>
                <td>
                    <p>${b.content}</p>
                </td>
                <td>
                  <div class="d-flex flex-column gap-3">
                    <a href="update-blog?id=${b.id}" class="btn btn-warning btn-lg text-white" title="Update this Blog" action="update" >Update</a>
                     <a href="#" onclick= "showMess('${b.id}')"  class="btn btn-danger btn-lg" title="Delete this Blog" action="delete">Delete</a>
                 </div>
          </td>
            </tr>
            
            
           
        </div>   
                                            </c:forEach>
        
                <a href="HomeServlet" class="btn btn-warning btn-lg text-white" title="Back To Home Page">Home</a>
    </div>
</body>
<script>
            function showMess(id) {
                var op = confirm('Are you sure to delete this Blog id = ' + id);
                if (op === true) {
                    window.location.href = 'delete-blog?id='+id;
                }
            }
        </script>
</html>


