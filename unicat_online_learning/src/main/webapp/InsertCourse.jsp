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
        <link href="${path}/styles/manager.css" rel="stylesheet" type="text/css"/>
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
                            <h3>Add new Course</h3>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">    
                        <form action="add" method="POST"> 
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Course</h4>                               
                            </div>
                            <div class="modal-body">
                                <div class="form-group">

                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="categoryID" class="form-select" aria-label="Default select example">
                                            <c:forEach items="${CategoryDAO.getAllCategory()}" var="x">
                                                <c:if test="${CategoryID == x.getCategoryID()}">
                                                    <option value="${x.getCategoryID()}" selected="">${x.getName()}</option>
                                                </c:if>
                                                <c:if test="${CategoryID != x.getCategoryID()}">                      
                                                    <option value="${x.getCategoryID()}">${x.getName()}</option>
                                                </c:if>
                                            </c:forEach>

                                        </select>                                   
                                    </div>
                                    <div class="form-group">
                                        <label>Course Name</label>
                                        <input name="CourseName" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Course Image</label>
                                        <textarea name="CourseImage" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Course Info </label>
                                        <textarea name="CourseInf" class="form-control" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Course Description </label>
                                        <textarea name="CourseDescription" class="form-control" required></textarea>
                                    </div>

                                    <p> <input type="submit" value="InsertCourse"/>
                                </div>
                        </form>
                        <button onclick='window.location.href = "http://localhost:6789/Unicat_online_learning/admin/manager"'>Cancel</button>
                    </div>
                </div>

            </div>


            <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>