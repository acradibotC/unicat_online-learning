<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <c:set value="${pageContext.request.contextPath}" var="path"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="${path}/login/images/favicon-32x32.png"
              type="image/png">
        <title>Unicat - Learn Anything</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Unicat project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${path}/styles/bootstrap4/bootstrap.min.css">
        <link href="${path}/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="${path}/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/responsive.css">
        <link href="${path}/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link href="${path}/plugins/video-js/video-js.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="super_container">

            <!-- Header -->

            <header class="header">

                <!-- Top Bar -->
                <div class="top_bar">
                    <div class="top_bar_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
                                        <ul class="top_bar_contact_list">
                                            <li><div class="question">Have any questions?</div></li>
                                            <li>
                                                <i class="fa fa-phone" aria-hidden="true"></i>
                                                <div>0988-123-8888</div>
                                            </li>
                                            <li>
                                                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                                <div>info.unicatlearning@gmail.com</div>
                                            </li>
                                        </ul>
                                        <div class="top_bar_login ml-auto">
                                            <c:choose>
                                                <c:when test="${student != null}">
                                                    <div style="display: flex; gap: 10px">
                                                        <div class="login_button">
                                                            <a href="${path}/userprofile?p=profile">${User.getFullName()}</a>
                                                        </div>
                                                        <div class="login_button"><a href="${path}/user/login">Log Out</a></div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${admin != null}">
                                                    <div style="display: flex; gap: 10px;  " >
                                                        <div class="login_button" style="border-radius: 5px">
                                                            <a href="">Admin Manager</a>
                                                        </div>
                                                        <div class="login_button" style="border-radius: 5px"><a href="${path}/user/login">Log Out</a></div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="login_button"><a href="${path}/user/login">Register or Login</a></div>    
                                                </c:otherwise>

                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>				
                </div>

                <!-- Header Content -->
                <div class="header_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                                    <div class="logo_container">
                                        <a href="${path}/home">
                                            <img style="height: 80px" src="${path}/login/images/unic.jpg" alt="logo" class="">
                                        </a>
                                    </div>
                                    <nav class="main_nav_contaner ml-auto">
                                        <ul class="main_nav">
                                            <c:choose>
                                                <c:when test="${StatusHome == 1}">
                                                    <li class="active"><a href="${path}/home">Home</a></li>
                                                    <li><a href="${path}/about">About</a></li>
                                                    <li><a href="${path}/courses">Courses</a></li>
                                                    <li><a href="${path}/blog">Blog</a></li>
                                                    <li><a href="${path}/contact">Contact</a></li>
                                                    </c:when>
                                                    <c:when test="${StatusHome == 2}">
                                                    <li><a href="${path}/home">Home</a></li>
                                                    <li class="active"><a href="${path}/about">About</a></li>
                                                    <li><a href="${path}/courses">Courses</a></li>
                                                    <li><a href="${path}/blog">Blog</a></li>
                                                    <li><a href="${path}/contact">Contact</a></li>
                                                    </c:when>
                                                    <c:when test="${StatusHome == 3}">
                                                    <li><a href="${path}/home">Home</a></li>
                                                    <li><a href="${path}/about">About</a></li>
                                                    <li class="active"><a href="${path}/courses">Courses</a></li>
                                                    <li><a href="${path}/blog">Blog</a></li>
                                                    <li><a href="${path}/contact">Contact</a></li>
                                                    </c:when>
                                                    <c:when  test="${StatusHome == 4}">
                                                    <li><a href="${path}/home">Home</a></li>
                                                    <li><a href="${path}/about">About</a></li>
                                                    <li><a href="${path}/courses">Courses</a></li>
                                                    <li class="active"><a href="${path}/blog">Blog</a></li>
                                                    <li><a href="${path}/contact">Contact</a></li>
                                                    </c:when>
                                                    <c:when  test="${StatusHome == 5}">
                                                    <li><a href="${path}/home">Home</a></li>
                                                    <li><a href="${path}/about">About</a></li>
                                                    <li><a href="${path}/courses">Courses</a></li>
                                                    <li><a href="${path}/blog">Blog</a></li>
                                                    <li class="active"><a href="${path}/contact">Contact</a></li>
                                                    </c:when>
                                                </c:choose>
                                        </ul>
                                        <div class="search_button"><i class="fa fa-search" aria-hidden="true"></i></div>

                                        <!-- Hamburger -->

                                        <div class="shopping_cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div>
                                        <div class="hamburger menu_mm">
                                            <i class="fa fa-bars menu_mm" aria-hidden="true"></i>
                                        </div>
                                    </nav>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Header Search Panel -->
                <div class="header_search_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="header_search_content d-flex flex-row align-items-center justify-content-end">
                                    <form action="#" class="header_search_form">
                                        <input type="search" class="search_input" placeholder="Search" required="required">
                                        <button class="header_search_button d-flex flex-column align-items-center justify-content-center">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>			
                </div>			
            </header>

            <!-- Menu -->

            <div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
                <div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
                <div class="search">
                    <form action="#" class="header_search_form menu_mm">
                        <input type="search" class="search_input menu_mm" placeholder="Search" required="required">
                        <button class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
                            <i class="fa fa-search menu_mm" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
                <nav class="menu_nav">
                    <ul class="menu_mm">
                        <li class="menu_mm"><a href="${path}/home">Home</a></li>
                        <li class="menu_mm"><a href="${path}/about">About</a></li>
                        <li class="menu_mm"><a href="${path}/courses">Courses</a></li>
                        <li class="menu_mm"><a href="${path}/blog">Blog</a></li>
                        <li class="menu_mm"><a href="#">Page</a></li>
                        <li class="menu_mm"><a href="${path}/contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
