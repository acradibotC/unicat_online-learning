<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <c:set value="${pageContext.request.contextPath}" var="path"/>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" href="${path}/login/images/favicon-32x32.png"
              type="image/png">
        <title>Unicat - Learn Anything</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="${path}/login/css/login.css">


    </head>
    <body>
        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <div class="container">
                <div class="card login-card">
                    <div class="row no-gutters">
                        <div class="col-md-7">
                            <img src="${path}/login/images/login.jpg" alt="login" class="login-card-img">
                        </div>
                        <div  class="col-md-5">
                            <div style="margin-left: 10px; padding-top: 20px" class="card-body">
                                <a class="brand-wrapper" href="${path}/home">
                                    <img style="" src="${path}/login/images/unic.jpg" alt="logo" class="">
                                </a>
                                <p class="login-card-description">Sign into your account</p>
                                <form action="${path}/user/login" method="post">
                                    <div class="form-group">
                                        <label for="username" class="sr-only">Username</label>
                                        <input type="text" name="txtUserName" id="email" class="form-control" placeholder="username">
                                        <span style="color:red;">${msgUserName}</span>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="password" class="sr-only">Password</label>
                                        <input type="password" name="txtPassWord" id="password" class="form-control" placeholder="***********">
                                        <span style="color:red;">${msgPass}</span>
                                    </div>                       
                                    <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Login!">
                                </form>
                                <span style="color:red;">${message}</span>
                                <!-- The "Login with Google" button -->
                                <div>
                                    <i class="fab fa-google-plus-circle"></i>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&&redirect_uri=http://localhost:6789/Unitcat_Online_Learning/LoginWithGoogle&response_type=code
                                   &client_id=266996363922-ffeafjv3j62257j0fc0mh5ntm8knmcrq.apps.googleusercontent.com" class="btn btn-danger">
                                     Login with Google
                                </a>
                                </div>
                                <p class="login-card-footer-text">Don't have an account? <a href="${path}/user/register" class="text-reset">Register here</a></p>
                                <nav class="login-card-footer-nav">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>


    </body>
</html>

