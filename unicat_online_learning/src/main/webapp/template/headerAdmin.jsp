<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>      
        <meta charset="UTF-8">
        <c:set value="${pageContext.request.contextPath}" var="path"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${path}/styles/bootstrap4/bootstrap.min.css" rel="stylesheet" media="all">   
        <link href="${path}/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="${path}/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/Admin.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/mamager.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/courses.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/courses_responsive.css">
        <link href="${path}/styles/theme.css" rel="stylesheet" media="all">
    </head>
    <style>
        .image{
            width: 120px;


        }
        thead tr th,
        tbody tr th:nth-child(1),
        tbody tr th:nth-child(2),
        tbody tr th:nth-child(3),
        tbody tr th:nth-child(4),
        tbody tr th:nth-child(5),
        tbody tr th:nth-child(8),
        tbody tr th:nth-child(9){
            text-align: center;
        }
    </style>
    <body class="animsition">
        <div><%@include file="header.jsp" %></div>
        <div class="page-wrapper">            
            <div class="page-container">
                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div style="float: left;padding-top: 30px">
                                    <aside class="menu-sidebar1">
                                        <div class="menu-sidebar1__content js-scrollbar">
                                            <nav class="navbar-sidebar1">
                                                <ul class="list-unstyled navbar__list1">
                                                    <c:choose>
                                                        <c:when test="${tutor != null}">
                                                            <li class="active has-sub1">
                                                                <a class="js-arrow" href="${path}/admin/manager">Course Manager</a>                           
                                                            </li>
                                                            <li>
                                                                <a href="LessonManager.jsp">Lesson Manager</a>
                                                            </li>
                                                        </c:when>
                                                        <c:when test="${admin != null}">
                                                            <li class="active has-sub1">
                                                                <a class="js-arrow" href="${path}/admin/manager">Course Manager</a>                           
                                                            </li>
                                                            <li>
                                                                <a href="${path}/admin/manager/user">User Manager</a>
                                                            </li>   
                                                        </c:when>
                                                    </c:choose>

                                                </ul>
                                            </nav>
                                        </div>
                                    </aside>
                                </div>