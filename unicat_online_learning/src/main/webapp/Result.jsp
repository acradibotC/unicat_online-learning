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
            <div class="col-md" >
                <div class="">
                    <div class="alert alert-dismissible alert-info">
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        <h3 class="alert-heading">Your quiz score</h3>
                        <p class="mb-lg-4">Your score ${score} out of ${100}</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%@include file="template/footer.jsp" %>