<%-- 
    Document   : Details
    Created on : Feb 24, 2023, 3:54:05 PM
    Author     : Duc Anh
--%>
<%@include file="template/header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<!-- About -->
<link rel="stylesheet" type="text/css" href="${path}/styles/about.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/about_responsive.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Home -->
<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li>About</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

    <body>
        <h1>Hoang Duc Anh!</h1>
    </body>
</html>

<%@include file="template/footer.jsp" %>
