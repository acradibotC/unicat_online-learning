<%-- 
    Document   : UpdateCourse
    Created on : Mar 6, 2023, 11:05:10 PM
    Author     : User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styles/manager.css" rel="stylesheet" type="text/css"/>
        <title>Update Course</title>
    </head>
    <body>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3>Update a Course</h3>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">    
                        <form action="update" method="POST"> 
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Course</h4>                             
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Course ID</label>
                                    <input value="${course.getCourseID()}" name="txtCourseID" type="text" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Category ID </label>
                                    <input type="text" name="txtCategoryID" value="${course.getCategoryID()}" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Course Name </label>                                     
                                    <textarea type="text" name="txtName" class="form-control" >${course.getName()}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Course Image </label>
                                    <textarea type="text" name="txtCourseImage" class="form-control">${course.getImage()} </textarea>                                
                                </div>
                                <div class="form-group">
                                    <label>Course Info </label>
                                    <textarea type="text" name="txtCourseInf" class="form-control"> ${course.getCourseInfo()}</textarea>                                  
                                </div>
                                <div class="form-group">
                                    <label>Course Description </label>
                                    <textarea type="text" name="txtCourseDescription" class="form-control">${course.getDescription()} </textarea>                                   
                                </div>

                                <p> <input type="submit" value="UpdateCourse"/>
                            </div>
                        </form>
                        <button onclick='window.location.href = "http://localhost:6789/Unicat_online_learning/admin/manager"'>Cancel</button>
                    </div>
                </div>

            </div>


            <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
