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
                    <div style="padding: 20px;">
                        <div>
                            <h1>${course.getName()}</h1>
                        </div>
                        <div >
                            <h3>Lesson ${lesson.getLessonNum()}</h3>
                        </div>
                    </div>

                </div>
                <a href="${path}/tutor/manager/course?page=view&CourseID=${course.getCourseID()}">
                    <div  style="font-size:17px;background-color: #00b5e9;padding: 15px;width: 180px;color: black;border-radius: 15px;margin: 10px">
                        <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i> Cancel Update
                    </div>
                </a>
            </div>

            <div id="editEmployeeModal" style="font-size: 16px">
                <div class="modal-dialog">
                    <div class="modal-content">    
                        <form action="${path}/tutor/manager/course" method="post"> 

                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Lesson Number</label>                                     
                                    <textarea type="text" name="txtLessonNum" class="form-control" disabled="">${lesson.getLessonNum()}</textarea>
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
                                    <label>Lesson Description </label>
                                    <textarea type="text" name="txtDescription" class="form-control">${lesson.getDescription()} </textarea>                                   
                                </div>
                                <div class="form-group">
                                    <label>Lesson Video </label>
                                    <textarea type="text" name="txtVideo" class="form-control" > ${lesson.getVideo()}</textarea>                                  
                                </div>
                                <input type="hidden" name="Update" value="UpdateLesson"/>
                                <input type="hidden" name="LessonID" value="${lesson.getLessonID()}"/>
                                <div ><input style="background-color: #cd2737;border-radius: 15px;color: white;padding: 10px;font-size: 18px" type="submit" value="Update Lesson"/></div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>
