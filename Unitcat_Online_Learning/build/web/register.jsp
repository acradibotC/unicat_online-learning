<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <c:set value="${pageContext.request.contextPath}" var="path"/>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>register</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="${path}/register/css/login.css">
    </head>
    <body>
        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 login-section-wrapper">
                        <a class="brand-wrapper" href="${path}/home">
                            <img src="${path}/register/images/logo.svg" alt="logo" class="logo">
                        </a>
                        <div class="login-wrapper my-auto">
                            <h1 class="login-title">Register</h1>
                            <span style="color:red;">${msgHave}</span>
                            <form action="${path}/user/register" method="post">
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <span style="color:red;">${msgName}</span>
                                    <input type="text" name="txtName" id="fullname" class="form-control" placeholder="Full name">
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <span style="color:red;">${msgUserName}</span>
                                    
                                    <input type="text" name="txtUserName" id="username" class="form-control" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <label for="username">Gmail</label>
                                    <span style="color:red;">${msgGmail}</span>

                                    <input type="text" name="txtGmail" id="gmail" class="form-control" placeholder="Gmail">
                                </div>   
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <span style="color:red;">${msgPhone}</span>
                                    
                                    <input type="text" name="txtPhone" id="username" class="form-control" placeholder="Phone Number">
                                </div>
                                <div class="form-group">
                                    <label for="dob">Date of birth</label>
                                    <span style="color:red;">${msgDob}</span>
                                    <input type="date" name="txtDob" id="username" class="form-control" >
                                </div>


                                <div class="form-group mb-4">
                                    <label for="password">Password</label>
                                    <span style="color:red;">${msgPass}</span>
                                    <input type="password" name="txtPassWord" id="password" class="form-control" placeholder="Passsword">
                                </div>
                                <div class="form-group mb-4">
                                    <label for="repassword">Re-Password</label>
                                    <span style="color:red;">${msgRePass}</span>
                                    <span style="color:red;">${msgRePassf}</span>
                                    <input type="password" name="txtRePass" id="password" class="form-control" placeholder="Repasssword">
                                </div>
                                <input name="login" id="login" class="btn btn-block login-btn" type="submit" value="sign up!" style = "background-color: #80ced6;">
                            </form>
                        </div>
                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block">
                        <img src="${path}/register/images/login.jpg" alt="login image" class="login-img">
                    </div>
                </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
