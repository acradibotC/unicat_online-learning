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
        <title>Update Lesson</title>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3>Update a Lesson</h3>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">    
                        <form action="${path}/admin/manager/lesson" method="post"> 
                            <div class="modal-header">						
                                <h4 class="modal-title">Update Lesson</h4>                             
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Lesson ID</label>
                                    <input value="${lesson.getLessonID()}" name="txtLessonID" type="text" class="form-control" disabled=""/>
                                </div>
                                <div class="form-group">
                                    <label>Lesson Number</label>                                     
                                    <textarea type="text" name="txtLessonNum" class="form-control" >${lesson.getLessonNum()}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Course ID</label>                                     
                                    <textarea type="text" name="txtCourseID" class="form-control" >${lesson.getCourseID()}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Lesson Name </label>                                     
                                    <textarea type="text" name="txtName" class="form-control" >${lesson.getName()}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Lesson Title </label>
                                    <textarea type="text" name="txtTitle" class="form-control">${lesson.getTitle()} </textarea>                                
                                </div>
                                <div class="form-group">
                                    <label>lesson Description </label>
                                    <textarea type="text" name="txtDescription" class="form-control">${lesson.getDescription()} </textarea>                                   
                                </div>
                                <div class="form-group">
                                    <label>Lesson Video </label>
                                    <textarea type="text" name="txtVideo" class="form-control"> ${lesson.getVideo()}</textarea>                                  
                                </div>
                                <input type="hidden" name="txtStatus" value="2"/>
                                <input value="${lesson.getLessonID()}" name="txtLessonID" type="text" class="form-control" hidden=""/>
                                <p><input type="submit" value="UpdateLesson"/>
                                <div><button onclick='window.location.href = "http://localhost:6789/Unicat_online_learning/admin/manager/lesson"'>Cancel</button></div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>
