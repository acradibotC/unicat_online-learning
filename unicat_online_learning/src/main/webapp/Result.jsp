<%-- 
    Document   : quiz
    Created on : Mar 11, 2023, 9:39:03 AM
    Author     : Anhnt206
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>



<div class="card text-white mb-3 bg-dark " style="margin-top: 120px">
    <div class="container pt-3  ">

        <c:if test="${score > 50}">
            <div class="row" >
                <div class="col-md">
                    <div class="alert alert-dismissible alert-info pt-md-5" style="height: 400px">
                        <h2 style="text-align: center" class="alert-heading">Congratulation!</h2>
                        <h3 style="text-align: center" class="alert-heading pt-md-3">Keep working hard for new lessons <i class="bi bi-emoji-wink-fill"></i></h3>
                        <h2 style="text-align: center" class="alert-heading pt-md-5">Your quiz score: ${score}</h2>
                        <p style="text-align: center; font-size: large" class="mb-lg-4">Your score ${score} out of ${100}</p>
                    </div>
                </div>
            </div>

            <div class="row justify-content-lg-between">
                <div class="col-md-2">
                    <a class="btn btn-group-lg btn-warning" href="LessonDetail?Id=${currentLessonNum}&status=${-1}">Back to Lesson</a>
                </div>
                <div class="col-md-2">
                    <a class="btn btn-group-lg btn-success" href="LessonDetail?Id=${currentLessonNum+1}&status=${random.nextInt(10000)}">Go to next Lesson</a>
                </div>
            </div>
        </c:if>

        <c:if test="${score < 50}">
            <div class="row" >
                <div class="col-md">
                    <div class="alert alert-dismissible alert-danger pt-md-5" style="height: 400px">
                        <h2 style="text-align: center" class="alert-heading">Try your best </h2>
                        <h3 style="text-align: center" class="alert-heading pt-md-3">Go back to review and try again <i class="bi bi-fire"></i></h3>
                        <h2 style="text-align: center" class="alert-heading pt-md-5">Your quiz score: ${score}</h2>
                        <p style="text-align: center; font-size: large" class="mb-lg-4">Your score ${score} out of ${100}</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-lg-center">
                <div class="col-md-2">
                    <a class="btn btn-group-lg btn-warning" href="LessonDetail?Id=${currentLessonNum}&status=${-1}">Back to Lesson</a>
                </div>
            </div>
        </c:if>




    </div>
    <%@include file="template/footer.jsp" %>