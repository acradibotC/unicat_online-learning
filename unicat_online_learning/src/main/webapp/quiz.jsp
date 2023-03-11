<%-- 
    Document   : quiz
    Created on : Mar 11, 2023, 9:39:03 AM
    Author     : Anhnt206
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>



<div class="card text-white mb-3 bg-light" style="margin-top: 120px">
    <div class="container">
        <div class="row ">
            <div class="col-md-8" >
                <h1 class="card-header text-dark">Welcome to the Quiz!</h1>
                <div class="card-body">
                    <form action="QuizResult" method="post" class="text-dark">
                        <c:forEach var="question" items="${questions}">
                            <p style="color: black">${question.getContent()}</p>
                            <c:forEach var="option" items="${answerDAO.getAllAnswerByQuestionId(question.getQuestionID())}" varStatus="status">
                                <input type="radio" name="q${questionIndex}" id="q${questionIndex}_${status.index}" value="${option.getAnswerID()}" required>
                                <label for="q${questionIndex}_${status.index}">${option.getAnswer()}</label><br>
                            </c:forEach>
                            <hr>
                            <c:set var="questionIndex" value="${questionIndex + 1}" />
                        </c:forEach>
                        <input class="btn btn-group-sm btn-success" type="submit" value="Submit Answers">
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="template/footer.jsp" %>