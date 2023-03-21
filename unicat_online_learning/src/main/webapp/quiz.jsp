<%-- 
    Document   : quiz
    Created on : Mar 11, 2023, 9:39:03 AM
    Author     : Anhnt206
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>



<div class="card text-white mb-3 bg-light pt-3" style="margin-top: 120px">
    <div class="container pt-3">
        <div class="row ">
            <div class="col-md" >
                <c:if test="${questions.size() < 1}">
                    <div class="alert alert-dismissible alert-warning" style="height: 400px">
                        <h2 class="alert-heading pt-5" style="text-align: center;">Does not have challenge for this Lesson!</h2>
                        <p class="mb-4 pt-3" style="text-align: center; font-size: large">You can pass the lesson without passing the challenge.</p>
                    </div>

                    <div class="row justify-content-lg-between pt-3">
                        <div class="col-md-2">
                            <a class="btn btn-group-lg btn-warning" href="LessonDetail?Id=${currentLessonNum}&status=${-1}">Back to Lesson</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-group-lg btn-success" href="LessonDetail?Id=${currentLessonNum+1}&status=${rand.nextInt(10000)}">Go to next Lesson</a>
                        </div>
                    </c:if>

                    <c:if test="${questions.size() >= 1}">
                        <h1 class="card-header text-dark">Welcome to the Quiz!</h1>
                        <form action="QuizResult" method="post" class="text-dark">
                            <c:forEach var="question" items="${questions}">
                                <h4 class="card-header bg-light " style="color: black">${question.getQuestionNum()}. ${question.getContent()}</h4>
                                <div class="card-body"> 
                                    
                                    <div class="gallery_item">
                                        <c:forEach var="option" items="${answerDAO.getAllAnswerByQuestionId(question.getQuestionID())}" varStatus="status">
                                            <div class="list-group-item list-group-item-action">
                                                <input  
                                                    type="radio" name="q${questionIndex}" id="q${questionIndex}_${status.index}" value="${option.getAnswerID()}" required>
                                                <label  class="text-dark" for="q${questionIndex}_${status.index}">${option.getAnswer()}</label><br>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    
                                </div>
                                <hr>
                                <c:set var="questionIndex" value="${questionIndex + 1}" />
                            </c:forEach>
                            <input class="btn btn-group-lg btn-info" type="submit" value="Submit Answers">
                        </form>
                    </c:if>
                </div>


            </div>
        </div>
    </div>

</div>
<%@include file="template/footer.jsp" %>