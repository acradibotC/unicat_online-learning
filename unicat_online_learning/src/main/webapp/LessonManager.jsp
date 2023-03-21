
<%@include file="template/headerAdmin.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">
<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Lesson Manager</h2>
    <div class="col-lg-8" style="padding-bottom: 20px">
        <div class="courses_search_container">
            <form action="#" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
                <input type="search" class="courses_search_input" placeholder="Search Courses" required="required">
                <button action="submit" class="courses_search_button ml-auto">search now</button>
            </form>
        </div>
    </div>
    
    <div class="table-responsive table--no-card m-b-40">

        <table class="table table-borderless table-striped table-earning">
            <thead style="background-color: #0092ef">
                <tr>
                    <th style="width: 70px">Lesson ID</th>
                    <th>Lesson Number</th>
                    <th>Course Name</th>
                    <th>Name</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${LessonDAO.getAllLesson()}" var="x">
                    <tr>
                        <th>${x.getLessonID()}</th>
                        <th>${x.getLessonNum()}</th>
                        <th>${CoursesDAO.getCourseNameByCourseID(x.getCourseID())}</th>
                        <th>${x.getName()}</th>
                        <th>
                            <form action="${path}/admin/manager/lesson/add" method="get">
                                <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                <button class="btn btn-secondary btn-sm" style="width: 70px" type="submit">Add</button>
                            </form>
                        </th>    
                        <th>
                            <form action="${path}/admin/manager/lesson" method="post">
                                <input type="hidden" name="txtStatus" value="3" />
                                <input type="hidden" name="txtLessonID" value="${x.getLessonID()}"/>
                                <button class="btn btn-secondary btn-sm" style="width: 70px" type="submit">Delete</button>
                            </form>
                        </th>
                        <th>
                            <form action="${path}/admin/manager/lesson/update" method="post">
                                <input type="hidden" name="txtLessonID" value="${x.getLessonID()}"/>
                                <button class="btn btn-secondary btn-sm" style="width: 70px" type="submit">Update</button>
                            </form>
                        </th>              
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@include file="template/footerAdmin.jsp" %>