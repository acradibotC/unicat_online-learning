<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="template/header.jsp" %>



<div style="margin-top: 10%"> </div>
<div class="breadcrumbs_container">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="breadcrumbs">
                    <ul style="display: flex;font-size: 20px; padding: 10px;gap: 10px">
                        <li><a style="text-decoration: underline" href="home">Home</a> </li>
                        |
                        <li style="text-decoration: underline">User Profile</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>			

<div class="container" style="padding-top: 30px">
    <div class="main-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="${User.getImage()}" alt="user-image" class="rounded-circle p-1 bg-primary" width="110">
                            <div class="mt-3">
                                <h4>${User.getFullName()}</h4>
                                <h6>${User.getDob()}</h6>
                                <h5>${User.getEmail()}</h5>
                            </div>
                        </div>
                        <hr class="my-4">
                        <div style="color: black; font-size: 20px"> My Course</div>
                        <c:forEach items = "${listcourseenroll}" var = "lc">
                            <hr class="my-4">
                            <form action="LessonDetail" method="POST">
                                <div style="color: black">
                                    <li><b>Course Name</b> : ${lc.getCourseName()} </li>
<!--                                    <li><b>Lesson Current</b> : ${lc.getLessonCurrent()}</li>-->
                                    <li><b>Enroll Date</b> : ${lc.getEnrollDate()}</li>
                                    <li><b>Progress</b>: ${Math.round(lc.getLessonCurrent()/LessonDAO.getNumberOfLessonsOfCourse(lc.getCourseID())*100)}%</li>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" 
                                             aria-valuenow="${lc.getLessonCurrent()}" aria-valuemin="0" aria-valuemax="10" 
                                             style="width: ${lc.getLessonCurrent()/LessonDAO.getNumberOfLessonsOfCourse(lc.getCourseID())*100}%;
                                             color: red;"></div>
                                    </div>
                                    <div>
                                        </br>
                                        <input value="${rand.nextInt(10000)}" name="status" hidden></>
                                        <button class="btn btn-primary btn-info" type="submit" value="${lc.getCourseID()}" name="courseId">
                                            Go to Course
                                        </button> 
                                    </div>

                                </div>
                            </form>

                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card">

                    <div class="card-body">

                        <form action="userprofile" method="post">
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                    <span style="color:red;"></span>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="txtFullName" class="form-control" placeholder="${User.getFullName()}">
                                </div>

                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Date of birth</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="date" name="txtDob" class="form-control" value="${User.getDob()}">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Mobile Phone</h6>
                                    <span style="color:red;"></span>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="txtPhone" class="form-control" placeholder="${User.getPhone()}">
                                </div>

                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Address</h6>
                                    <span style="color:red;"></span>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="text" name="txtAddress" class="form-control" placeholder="${User.getAddress()}">
                                </div>

                            </div>    
                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">New password</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" name="txtPass" class="form-control" placeholder="*****">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Retype password</h6>
                                    <span style="color:red;">${notice}</span>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="password" name="txtRepass" class="form-control" placeholder="*****">
                                </div>

                            </div>
                            <div style="color: red;margin-left: 5%;margin-bottom: 4%">${msgNotMatch}</div>
                            <c:remove var="msgNotMatch" scope="session" />
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <div class="col-sm-9 text-secondary">
                                    <input type="submit" class="btn btn-primary px-4" value="Save">
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <style type="text/css">
        body{
            background: #f7f7ff;
            margin-top:20px;
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid transparent;
            border-radius: .25rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
        }
        .me-2 {
            margin-right: .5rem!important;
        }
    </style>
</div>

<%@include file="template/footer.jsp" %>