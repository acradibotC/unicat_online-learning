<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set value="${pageContext.request.contextPath}" var="path"/>
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
                <div  style="font-size:17px;background-color: #cd2737;width: 220px;padding: 15px;border-radius: 15px;margin: 10px">
                    <a style="color: white;display: block" href="${path}/tutor/manager/course?page=view&CourseID=${course.getCourseID()}">
                        <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i> Cancel Add Course
                    </a>
                </div>
            </div>
        </div>
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">    
                    <form action="${path}/tutor/manager/course/add" method="post"> 
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Course</h4>                               
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <div>
                                    <label>Category</label>
                                    <select name="txtCategoryID" class="form-select" aria-label="Default select example">
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
                                    <input name="txtCourseName" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Course Image</label>
                                    <textarea name="txtCourseImage" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Course Info </label>
                                    <textarea name="txtCourseInf" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Course Description </label>
                                    <textarea name="txtCourseDescription" class="form-control" required></textarea>
                                </div>
                                <input name="Add" value="Course" type="hidden"/>
                                <div >
                                    <input style="background-color: #cd2737;border-radius: 15px;color: white;padding: 10px;font-size: 18px" 
                                           type="submit" value="Add Course"/>
                                </div>
                            </div>
                        </div>                       
                    </form>                 
                </div>

            </div>
        </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>