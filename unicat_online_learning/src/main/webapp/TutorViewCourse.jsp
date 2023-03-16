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
        <title>View Course</title>
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
                            <h3>${c.getName()}</h3>
                        </div>

                    </div>
                </div>
                <div >
                    <a href="${path}/tutor/manager/course?page=CoursePublished">
                        <div  style="font-size:17px;background-color: #00b5e9;padding: 15px;width: 210px;color: black;border-radius: 15px;margin: 10px">
                            <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i>   Published Courses
                        </div>
                    </a> 
                    <a href="${path}/tutor/manager/request?view=RequestPublish">
                        <div  style="font-size:17px;background-color: #00b5e9;padding: 15px;width: 210px;color: black;border-radius: 15px;margin: 10px">
                            <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i> All Request
                        </div>
                    </a> 
                    <c:if test="${c.getRequest() eq 'None'}">

                        <div style="color: red;font-size: 20px; margin-top: 15px">This Course is Published . If you want to Update please sent request to ADMIN</div>
                        <form action="${path}/tutor/manager/course" method="post">
                            <input type="hidden" name="Request" value="RequestUnPublish" />
                            <input type="hidden" name="txtCourseID" value="${c.getCourseID()}"/>
                            <input name="NowPage" value="View" type="hidden"/>
                            <button style="background-color: #cd2737;border-radius: 10px;margin: 8px;padding: 10px 16px;color: white" type="submit">Request Un-Publish</button>
                        </form>

                    </c:if>
                    <c:if test="${c.getRequest() eq 'Updating'}">
                        <div style="color: red;font-size: 20px; margin-top: 15px">This Course is not Published . If you want to Publish please sent request to ADMIN</div>
                        <form action="${path}/tutor/manager/course" method="post">
                            <input type="hidden" name="Request" value="RequestPublish" />
                            <input type="hidden" name="txtCourseID" value="${c.getCourseID()}"/>
                            <input name="NowPage" value="View" type="hidden"/>
                            <button style="background-color: #cd2737;border-radius: 10px;margin: 8px;padding: 10px 16px;color: white" type="submit">Request Publish</button>
                        </form>
                    </c:if>
                    <c:if test="${c.getRequest() eq 'RequestPublish'}">
                        <div style="color: red;font-size: 20px; margin-top: 15px">This Course has requested to ADMIN to Publish</div>
                        <form action="${path}/admin/manager/course" method="post">
                            <input name="txtStatusPublish" value="CancelPublish" type="hidden"/>
                            <input name="Role" value="Tutor" type="hidden"/>
                            <input name="NowPage" value="View" type="hidden"/>
                            <input type="hidden" name="txtCourseID" value="${c.getCourseID()}" />
                            <button style="margin: 8px;padding: 10px 16px" class="btn btn-danger" type="submit">Cancel Request</button>
                        </form>
                    </c:if>
                    <c:if test="${c.getRequest() eq 'RequestUnPublish'}">
                        <div style="color: red;font-size: 20px; margin-top: 15px">This Course has requested to ADMIN to Un-Publish</div>
                        <form action="${path}/admin/manager/course" method="post">
                            <input name="txtStatusPublish" value="CancelUnPublish" type="hidden"/>
                            <input name="Role" value="Tutor" type="hidden"/>
                            <input name="NowPage" value="View" type="hidden"/>
                            <input type="hidden" name="txtCourseID" value="${c.getCourseID()}" />
                            <button style="margin: 8px;padding: 10px 16px" class="btn btn-danger" type="submit">Cancel Request</button>
                        </form>
                    </c:if>
                </div>


            </div>
        </div>

        <div id="editEmployeeModal">

            <div class="modal-dialog">
                <div class="modal-header" style="background-color:#435d7d;color: white;padding: 20px ">						
                    <h4 class="modal-title">Course Information</h4>                               
                </div>
                <div class="modal-content">    

                    <div class="modal-body">
                        <div class="form-group">
                            <c:if test="${c.getRequest() eq 'Updating'}">
                                <a href="${path}/tutor/manager/course?page=UpdateCourse&CourseID=${c.getCourseID()}">
                                    <div  style="font-size:17px;background-color: #cd2737;padding: 15px;width: 280px;color: white;border-radius: 15px;margin-bottom: 20px">
                                        Update Course Information<i style="font-size: 20px;margin-left: 10px" class="fa fa-arrow-circle-right"></i>
                                    </div>
                                </a>
                            </c:if>

                            <div class="form-group">
                                <label>Category</label>
                                <select name="txtCategoryID" class="form-select" aria-label="Default select example" disabled="">
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
                                <input  type="text" class="form-control" value="${c.getName()}" disabled="">
                            </div>
                            <div class="form-group">
                                <label>Course Image</label>
                                <textarea  class="form-control" disabled="">${c.getImage()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Course Info </label>
                                <textarea  class="form-control" disabled="">${c.getCourseInfo()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Course Description </label>
                                <textarea class="form-control" disabled="">${c.getDescription()}</textarea>
                            </div>


                        </div>
                    </div>                       

                </div>
                <div class="modal-header" style="background-color:#435d7d;color: white;padding: 20px ">						
                    <h4 class="modal-title">Course Lesson</h4>   

                </div>
                <c:forEach items="${listlesson}" var="x">

                    <div class="form-group">

                        <div class="modal-content">  
                            <div style="display: flex">
                                <h4 style="margin: 20px;background-color: #435d7d;color: white;padding: 10px;border-radius: 5px;width: 400px">Lesson ${x.getLessonNum()}</h4>
                                <c:if test="${c.getRequest() eq 'Updating'}">
                                    <a href="${path}/tutor/manager/course?page=UpdateCourse&CourseID=${c.getCourseID()}&Lesson=${x.getLessonNum()}">
                                        <div  style="font-size:17px;background-color: #cd2737;padding: 10px;width: 200px;color: white;border-radius: 15px;margin: 20px;text-align: center">
                                            Update Lesson ${x.getLessonNum()}<i style="font-size: 20px;margin-left: 10px" class="fa fa-arrow-circle-right"></i>
                                        </div>
                                    </a>
                                </c:if>

                            </div>

                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Lesson Name</label>
                                    <input  type="text" class="form-control" value="${x.getName()}" disabled="">
                                </div>
                                <div class="form-group">
                                    <label>Lesson Title</label>
                                    <textarea  class="form-control" disabled="">${x.getTitle()}</textarea>
                                </div>

                                <div class="form-group">
                                    <label>Lesson Description </label>
                                    <textarea class="form-control" disabled="">${x.getDescription()}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Lesson Description </label>
                                    <textarea class="form-control" disabled="">${x.getDescription()}</textarea>
                                </div>
                                <div class="embed-responsive embed-responsive-16by9">
                                    ${x.getVideo()}
                                </div>

                            </div>
                        </div>                       

                    </div>
                </c:forEach>
            </div>


            <script src="${path}/js/manager.js" type="text/javascript"></script>
    </body>
</html>
