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

    <c:if test="${tutor != null}">
        <div class ="col-lg-3"style="float: right;">
            <a style="color: #fff; background-color: #14bdee; display: block; width: 200px; text-align: center; margin: 0 auto; margin-bottom: 10px; margin-top: 20px" href="${path}/admin/manager/add" >Add new Course</a>                                  
        </div>
    </c:if>
    <div class="table-responsive table--no-card m-b-40">

        <!-- Role: Admin -->
        <c:if test="${admin != null}">
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef">
                    <tr>

                        <th>Category ID</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Course Creator</th>
                        <th>Status</th>
                        <th></th>

                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr >

                            <th style="color: black">${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th style="color: black">${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}" /></th>
                            <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${x.getPublishStatus() == 0}"><div style="color: red; text-align: center;">Pending</div></c:when>
                                    <c:when test="${x.getPublishStatus() == 1}"><div style="color: blue; text-align: center;">Published</div></c:when>
                                </c:choose>
                            </th>
                            <th>
                                <c:if test="${x.getPublishStatus() == 0}">
                                    <form action="${path}/admin/manager/course" method="post">
                                        <input type="hidden" name="txtCourseID" value="${x.getCourseID()}" />
                                        <button class="btn btn-primary" type="submit">Publish</button>
                                    </form>
                                </c:if>                               
                            </th>

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

        <!-- Role: Tutor -->
        <c:if test="${tutor != null}">
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef">
                    <tr>
                        <th style="width: 70px">Course ID</th>
                        <th>Category ID</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Course Creator</th>
                        <th>Status</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr>
                            <th>${x.getCourseID()}</th>
                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}"/></th>
                            <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                            <th>
                                <c:choose>
                                    <c:when test="${x.getPublishStatus() == 0}"><div style="color: red; text-align: center;">Pending</div></c:when>
                                    <c:when test="${x.getPublishStatus() == 1}"><div style="color: blue; text-align: center;">Published</div></c:when>
                                </c:choose>
                            </th>
                            <th>
                                <form action="${path}/admin/manager/course" method="post">
                                    <input type="hidden" name="txtStatus" value="3" />
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="width: 70px" type="submit">Delete</button>
                                </form>
                            </th>
                            <th>
                                <form action="${path}/admin/manager/update" method="post">
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="width: 70px" type="submit">Update</button>
                                </form>
                            </th>                           
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