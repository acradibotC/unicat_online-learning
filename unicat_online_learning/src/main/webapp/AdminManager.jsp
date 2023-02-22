
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>      
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="styles/bootstrap4/bootstrap.min.css" rel="stylesheet" media="all">   
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/Admin.css">
        <link rel="stylesheet" type="text/css" href="styles/mamager.css">
        <link rel="stylesheet" type="text/css" href="styles/courses.css">
        <link rel="stylesheet" type="text/css" href="${path}/styles/courses_responsive.css">
        <link href="styles/theme.css" rel="stylesheet" media="all">
    </head>

    <body class="animsition">
        <div><%@include file="template/header.jsp" %></div>
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
                                                        <c:when test="${admin != null}">
                                                            <li class="active has-sub1">
                                                                <a class="js-arrow" href="AdminManager.jsp">Course Manager</a>                           
                                                            </li>
                                                            <li>
                                                                <a href="Dashboard.jsp">Dashboard</a>
                                                            </li>
                                                            <li>
                                                                <a href="UserManager.jsp">User Manager</a>
                                                            </li>                                                             
                                                            <li>
                                                                <a href="BlogMangager.jsp">Blog Manager</a>
                                                            </li>  
                                                        </c:when>
                                                        <c:when test="${tutor != null}">
                                                            <li class="active has-sub1">
                                                                <a class="js-arrow" href="AdminManager.jsp">Course Manager</a>                           
                                                            </li>
                                                        </c:when>
                                                    </c:choose>

                                                </ul>
                                            </nav>
                                        </div>
                                    </aside>
                                </div>
                                <div class="col-lg-12"style="float: left;padding-top: 30px">
                                    <h2 class="title-1 m-b-25" >Course Manager</h2>

                                    <div class="courses_search_container">
                                        <form action="#" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
                                            <input type="search" class="courses_search_input" placeholder="Search Courses" required="required">
                                            <select id="courses_search_select" class="courses_search_select courses_search_input">
                                                <option>All Categories</option>
                                                <option>Category</option>
                                                <option>Category</option>
                                                <option>Category</option>
                                            </select>
                                            <button action="submit" class="courses_search_button ml-auto">search now</button>
                                        </form>
                                    </div>
                                    <div class="table-responsive table--no-card m-b-40">
                                        <c:choose>
                                            <c:when test="${tutor != null}">
                                                <div class ="col-lg-3"style="float: right;">
                                                    <a style="color: #fff; background-color: #14bdee; display: block; width: 200px; text-align: center; margin: 0 auto; margin-bottom: 10px; margin-top: 20px" href="InsertCourse.jsp" >Add new Course</a>                                  
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <table class="table table-borderless table-striped table-earning">
                                            <thead style="background-color: #0092ef">
                                                <tr>
                                                    <th style="width: 70px">Course ID</th>
                                                    <th>Category ID</th>
                                                    <th>Course Name</th>
                                                    <th>Course Image</th>
                                                    <th>Course Creator</th>
                                                    <th>Course Inf</th>
                                                    <th>Course Description</th>
                                                        <c:choose>
                                                            <c:when test="${admin != null}">
                                                            <th style="width: 70px">Status</th>
                                                            </c:when>
                                                            <c:when test="${tutor != null}">
                                                            <th style="width: 70px">Delete</th>
                                                            <th style="width: 70px">Update</th>
                                                            <th style="width: 70px"> Edit Lesson</th>
                                                            </c:when>
                                                        </c:choose>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <th>1</th>
                                                    <th>1</th>
                                                    <th>Java</th>
                                                    <th><img class="image" src=""</img></th>
                                                    <th>Anh Bom</th>
                                                    <th>basic Java</th>
                                                    <th>How about to learn java</th>
                                                        <c:choose>
                                                            <c:when test="${admin != null}">
                                                            <th>Status</th>
                                                            </c:when>
                                                            <c:when test="${tutor != null}">
                                                            <th> <a href="DeleteCourse?CourseID=">Delete</th>  
                                                            <th> <a href="UpdateCourse.jsp?CourseID="> Update  </th> 
                                                            <th> <a href="LessonManager.jsp?CourseID="> Edit Lesson </th> 
                                                            </c:when>
                                                        </c:choose>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT-->
                <!-- END PAGE CONTAINER-->
            </div>

        </div>

       

        <!-- Main JS-->
        <script src="js/main.js"></script>

    </body>
</html>

