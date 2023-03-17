<%@include file="template/headerAdmin.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Course Manager</h2>
    <div class="col-lg-8" style="padding-bottom: 20px">
        <!-- Search -->
        <div class="courses_search_container">
            <form action="${path}/admin/manager/course/search" method="post" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
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
        <!-- End Search-->

    </div>    

    
    <div class="table-responsive table--no-card m-b-40">

        <!-- Role: Admin -->
        <c:if test="${admin != null}">
            <table class="table table-striped table-earning table-bordered">
                <thead style="background-color: #0092ef">
                    <tr>
                        <th style="width: 70px">Course ID</th>
                        <th>Category ID</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Course Creator</th>
                        <th>Reference</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr>
                            <th>${x.getCourseID()}</th>
                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}" /></th>
                            <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                            <th><a class="btn btn-info" href="${path}/course?CourseID=${x.getCourseID()}">
                                    Go to Course</a> </th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Pagination -->
            <c:if test="${allCourse.size() > 6}">
                <div class="paginationBlog">
                    <c:if test="${page == 1}">
                        <li class="page-itemBlog previous-page BlogDisable"><a class="page-linkBlog" href="">Prev</a></li>
                        </c:if>
                        <c:if test="${page != 1}">
                        <li class="page-itemBlog previous-page"><a class="page-linkBlog" href="${path}/admin/manager/course/paging?page=${page-1}&CategoryID=${CategoryID}&Name=${NameSearch}">Prev</a></li>
                        </c:if>

                    <c:forEach begin="${1}" end="${number}" var="i">    
                        <c:choose>
                            <c:when test="${page == i}">
                                <input type="hidden" name="page" value="${i}" />
                                <li class="page-itemBlog current-page BlogActive"><a class="page-linkBlog" href="${path}/admin/manager/course/paging?page=${i}&CategoryID=${CategoryID}&Name=${NameSearch}">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                <input type="hidden" name="page" value="${i}" />
                                <li class="page-itemBlog current-page"><a class="page-linkBlog" href="${path}/admin/manager/course/paging?page=${i}&CategoryID=${CategoryID}&Name=${NameSearch}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                    <c:if test="${page == number}">
                        <li class="page-itemBlog next-page BlogDisable"><a class="page-linkBlog" href="">Next</a></li>
                        </c:if>    
                        <c:if test="${page != number}">
                        <li class="page-itemBlog next-page"><a class="page-linkBlog" href="${path}/admin/manager/course/paging?page=${page+1}&CategoryID=${CategoryID}&Name=${NameSearch}">Next</a></li>
                        </c:if>    
                </div>
            </c:if>
            <c:if test="${allCourse.size() == 0}">
                <div class="paginationBlog">No Items Found!</div>
            </c:if>
            <!-- End Pagination -->
        </c:if>


    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>