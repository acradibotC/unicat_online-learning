
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
                                                    <li class="active has-sub1">
                                                        <a class="js-arrow" href="AdminManager.jsp">Course Manager</a>                           
                                                    </li>
                                                    <li>
                                                        <a href="ContactManager">Contact Manager</a>
                                                    </li>
                                                    <li>
                                                        <a href="UserManager.jsp">User Manager</a>
                                                    </li>      
                                                    <li>
                                                        <a href="UserDetails.jsp">User Details</a>
                                                    </li> 

                                                </ul>
                                            </nav>
                                        </div>
                                    </aside>
                                </div>
                                <div class="col-lg-12"style="float: left;padding-top: 30px">
                                    <h2 class="title-1 m-b-25" >Course Manager</h2>
                                    <div class="table-responsive table--no-card m-b-40">
                                        
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
                                                    <th style="width: 70px">Status</th>

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
                                                    <th> <a href="DeleteCourse?CourseID="></th>  

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

        <!-- Jquery JS-->
        <script src="js/manager.js" type="text/javascript"></script>
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="vendor/slick/slick.min.js">
        </script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/animsition/animsition.min.js"></script>
        <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="vendor/circle-progress/circle-progress.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="vendor/select2/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="js/main.js"></script>
        
    </body>
</html>

