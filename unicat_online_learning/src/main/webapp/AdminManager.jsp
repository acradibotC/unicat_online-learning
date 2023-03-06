<%@include file="template/headerAdmin.jsp" %>

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Course Manager</h2>
    <c:choose>
        <c:when test="${tutor != null}">
            <div class ="col-lg-3"style="float: right;">
                <a style="color: #fff; background-color: #14bdee; display: block; width: 200px; text-align: center; margin: 0 auto; margin-bottom: 10px; margin-top: 20px" href="${path}/admin/manager/add" >Add new Course</a>                                  
            </div>
        </c:when>
    </c:choose>
    <div class="table-responsive table--no-card m-b-40">

        <table class="table table-borderless table-striped table-earning">
            <thead style="background-color: #0092ef">
                <tr>
                    <th style="width: 70px">Course ID</th>
                    <th>Category ID</th>
                    <th>Course Name</th>
                    <th>Course Image</th>
                    <th>Course Creator</th>
                    <th>
            <c:choose>
                <c:when test="${admin != null}">
                    <th style="width: 70px">Status</th>
                </c:when>
                <c:when test="${tutor != null}">
                    <th style="width: 70px">Delete</th>
                    <th style="width: 70px">Update</th>
                </c:when>
            </c:choose>
            </th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${CoursesDAO.getAllCourse()}" var="x">
                <tr>
                    <th>${x.getCourseID()}</th>
                    <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                    <th>${x.getName()}</th>
                    <th><img class="image" src="${x.getImage()}" /></th>
                    <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                    <th>    
                <c:choose>
                    <c:when test="${admin != null}">
                        <th>Status</th>
                    </c:when>
                    <c:when test="${tutor != null}">
                        <th> <a href="DeleteCourse?CourseID=${x.getCourseID()}">Delete</th>  
                        <th> <a href="UpdateCourse.jsp?CourseID="> Update  </th> 
                    </c:when>
                </c:choose>
                </th>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>