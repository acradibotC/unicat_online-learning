
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
                            <h3>Update Course Information</h3>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>

                </div>
                <div  style="font-size:17px;background-color: #cd2737;width: 220px;padding: 15px;border-radius: 15px;margin: 10px">
                    <a style="color: white" href="${path}/tutor/manager/course?page=view&CourseID=${course.getCourseID()}">
                        <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i> Cancel Update
                    </a>
                </div>
            </div>

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">    
                        <form action="${path}/tutor/manager/course" method="post"> 

                            <div class="modal-body" style="font-size: 16px">

                                <div class="form-group">

                                    <div>
                                        <label>Category</label>

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
                                <input type="hidden" name="Update" value="UpdateCourseInfor"/>
                                <input type="hidden" name="CourseID" value="${course.getCourseID()}"/>
                                <div >
                                    <input style="background-color: #cd2737;border-radius: 15px;color: white;padding: 10px;font-size: 18px" 
                                           type="submit" value="Update Course"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>
