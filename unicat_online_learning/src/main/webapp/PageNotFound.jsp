<%-- 
    Document   : PageNotFound
    Created on : Feb 10, 2023, 5:14:24 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set value="${pageContext.request.contextPath}" var="path"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Page Not Found</h1>
        <li ><a href="${path}/home">Home</a></li>
    </body>
</html>
