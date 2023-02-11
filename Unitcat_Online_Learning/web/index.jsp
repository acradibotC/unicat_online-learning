<%-- 
    Document   : index
    Created on : Feb 2, 2023, 10:19:14 PM
    Author     : tuanm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
    String id = request.getAttribute("id").toString();
    String name = request.getAttribute("name").toString();
    String email = request.getAttribute("email").toString();
    out.print("Id: " + id);
    out.print("<br/>Name: " + name);
    out.print("<br/>Email: " + email);
        %>
    </body>
</html>
