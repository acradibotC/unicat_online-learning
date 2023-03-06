<%@include file="template/headerAdmin.jsp" %>

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Course Manager</h2>
    <div class="col-lg-8" style="padding-bottom: 20px">
        <div class="courses_search_container">
            <form action="${path}/admin/manager" method="post" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
                <input type="search" name="txtNameSearch" value="${NameSearch}" class="courses_search_input" placeholder="Search Courses">
                <select name="txtOption" id="courses_search_select" class="courses_search_select courses_search_input">
                    <option value="0">All Categories</option>
                    <c:forEach items="${CategoryDAO.getAllCategory()}" var="x">
                        <c:if test="${CategoryID == x.getCategoryID()}">
                            <option value="${x.getCategoryID()}" selected="">${x.getName()}</option>
                        </c:if>
                        <c:if test="${CategoryID != x.getCategoryID()}">                      
                            <option value="${x.getCategoryID()}">${x.getName()}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <button action="submit" class="courses_search_button ml-auto">search now</button>
            </form>
        </div>
    </div>    
    <c:choose>
        <c:when test="${tutor != null}">
            <div class ="col-lg-3"style="float: right;">
                <a style="color: #fff; background-color: #14bdee; display: block; width: 200px; text-align: center; margin: 0 auto; margin-bottom: 10px; margin-top: 20px" href="${path}/admin/manager/add" >Add new Course</a>                                  
            </div>
        </c:when>
    </c:choose>
    <div class="table-responsive table--no-card m-b-40">
        <c:if test="${admin != null}">
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef">
                    <tr>
                        <th style="width: 70px">Course ID</th>
                        <th>Category ID</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Course Creator</th>
                        <th >Status</th>
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
                            <th>Status</th>
                        </tr>
                    </c:forEach>
            </table>
            </tbody>
        </c:if>
        <c:if test="${tutor != null}">
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef">
                    <tr>
                        <th style="width: 70px">Course ID</th>
                        <th>Category ID</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Course Creator</th>
                        <th >Delete</th>
                        <th >Update</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${CoursesDAO.getAllCourseByUserID(User.getUserID())}" var="x">
                        <tr>
                            <th>${x.getCourseID()}</th>
                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}" /></th>
                            <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                            <th> <a href="${path}/admin/manager/delete?CourseID=${x.getCourseID()}">Delete</th>  
                            <th> <a href="UpdateCourse.jsp?CourseID="> Update  </th> 
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </c:if>
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>