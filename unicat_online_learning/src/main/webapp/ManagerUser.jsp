
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
        <link href="${path}/styles/theme.css" rel="stylesheet" media="all">
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
                                                    <li class="active has-sub1">
                                                        <a class="js-arrow" href="AdminManager.jsp">Course Manager</a>                           
                                                    </li>
                                                    <li>
                                                        <a href="ContactManager">Contact Manager</a>
                                                    </li>
                                                    <li>
                                                        <a href="${path}/admin/manager/user">User Manager</a>
                                                    </li>                                                             

                                                </ul>
                                            </nav>
                                        </div>
                                    </aside>
                                </div>
                                <div class="col-lg-12"style="float: left;padding-top: 30px">
                                    <h2 class="title-1 m-b-25" >User Manager</h2>
                                    <div class="table-responsive table--no-card m-b-40">

                                        <table class="table table-borderless table-striped table-earning">
                                            <thead style="background-color: #0092ef">
                                                 <input type="search" name="txtNameSearch" value="${NameSearch}" class="courses_search_input" placeholder="Search">
                                                  <button action="submit" class="courses_search_button ml-auto">search</button>
                                                <tr>
                                                    <th style="width: 70px">User ID</th>
                                                    <th>Full Name</th>
                                                    <th>Username</th>
                                                    <th>Gmail</th>
                                                    <th>Phone</th>
                                                    <th>DOB</th>
                                                    <th>Role</th>                                                   
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${UserDAO.getAllUser()}" var="x">
                                                    <tr>
                                                        <th>${x.getUserID()}</th>
                                                        <th>${x.getFullName()}</th>
                                                        <th>${x.getUserName()}</th>
                                                        <th>${x.getEmail()}</th>
                                                        <th>${x.getPhone()}</th>
                                                        <th>${x.getDob()}</th>
                                                        <th>${UserRoleDAO.getRoleNameByRoleID(x.getRoleID())}</th>
                                                        <th><a href="UserDetails.jsp">View Profile</th> 
                                                        <th><a href="delete?uid=${x.getUserID()}">Ban</a></th>
                                                    </tr>
                                                </c:forEach> 
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


        <!-- Jquery JS-->
        <script src="${path}/js/manager.js" type="text/javascript"></script>
        <script src="${path}/vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="${path}/vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="${path}/vendor/bootstrap-4.1/bootstrap.min.js"></script>

        <!-- Vendor JS-->
        <script src="${path}/vendor/slick/slick.min.js"></script>
        <script src="${path}/vendor/wow/wow.min.js"></script>
        <script src="${path}/vendor/animsition/animsition.min.js"></script>
        <script src="${path}/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="${path}/vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="${path}/vendor/counter-up/jquery.counterup.min.js"></script>
        <script src="${path}/vendor/circle-progress/circle-progress.min.js"></script>
        <script src="${path}/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="${path}/vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="${path}/vendor/select2/select2.min.js"></script>

        <!-- Main JS-->
        <script src="${path}/js/main.js"></script>
    </body>
</html>


