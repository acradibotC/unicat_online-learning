
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set value="${pageContext.request.contextPath}" var="path"/>
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
                        <form action="${path}/admin/manager/course" method="post"> 
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Course</h4>                             
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Course ID</label>
                                    <input value="${course.getCourseID()}" name="txtCourseID" type="text" class="form-control" disabled=""/>
                                </div>
                                <div class="form-group">
                                    <label>Category ID </label>
                                    <div>
                                        <select name="txtCategoryID">
                                            <c:forEach items="${CategoryDAO.getAllCategory()}" var="x">
                                                <c:if test="${course.getCategoryID() == x.getCategoryID()}">
                                                    <option value="${x.getCategoryID()}" selected="">${x.getName()}</option>
                                                </c:if>
                                                <c:if test="${course.getCategoryID() != x.getCategoryID()}">                      
                                                    <option value="${x.getCategoryID()}">${x.getName()}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
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
                                <input type="hidden" name="txtStatus" value="2"/>
                                <input value="${course.getCourseID()}" name="txtCourseID" type="text" class="form-control" hidden=""/>
                                <p><input type="submit" value="UpdateCourse"/>
                                <div><button onclick='window.location.href = "http://localhost:6789/Unicat_online_learning/admin/manager/course"'>Cancel</button></div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>
