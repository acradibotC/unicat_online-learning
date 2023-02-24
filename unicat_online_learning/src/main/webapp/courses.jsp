<%@include file="template/header.jsp" %>
<!-- Courses -->
<link rel="stylesheet" type="text/css" href="${path}/styles/courses.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/courses_responsive.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<!-- Home -->
<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li>Courses</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

<!-- Courses -->

<div class="courses">
    <div class="container">
        <div class="row">

            <!-- Courses Main Content -->
            <div class="col-lg-8">
                <div class="courses_search_container">
                    <form action="${path}/courses/search" method="post" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
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

                <div class="courses_container">
                    <c:if test="${list != null}">
                        <div class="row courses_row">

                            <c:forEach items="${list}" var="x">
                                <!-- Course --> 
                                <div class="col-lg-6 course_col">
                                    <div class="course">
                                        <div class="course_image"><img src="${x.getImage()}" alt=""></div>
                                        <div class="course_body">
                                            <h3 class="course_title"><a href="${path}/course?CourseID=${x.getCourseID()}">${x.getName()}</a></h3>
                                            <div class="course_teacher">${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</div>
                                            <div class="course_text">
                                                <c:if test="${x.getCourseInfo().length() != 0}">
                                                    <p>${BlogDAO.getShortString(x.getCourseInfo(), 10)}...</p>
                                                </c:if>                       
                                            </div>
                                        </div>
                                        <div class="course_footer">
                                            <div class="course_footer_content d-flex flex-row align-items-center justify-content-start">
                                                <div class="course_info">
                                                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                    <span>20 Student</span>
                                                </div>
                                                <div class="course_info">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>5 Ratings</span>
                                                </div>
                                                <div class="course_price ml-auto">Free</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:if test="${AllCourse.size() > 4}">
                            <div class="paginationBlog">
                                <c:if test="${page == 1}">
                                    <li class="page-itemBlog previous-page BlogDisable"><a class="page-linkBlog" href="">Prev</a></li>
                                    </c:if>
                                    <c:if test="${page != 1}">
                                    <li class="page-itemBlog previous-page"><a class="page-linkBlog" href="${path}/courses/paging?page=${page-1}&CategoryID=${CategoryID}&Name=${NameSearch}">Prev</a></li>
                                    </c:if>

                                <c:forEach begin="${1}" end="${number}" var="i">    
                                    <c:choose>
                                        <c:when test="${page == i}">
                                            <input type="hidden" name="page" value="${i}" />
                                            <li class="page-itemBlog current-page BlogActive"><a class="page-linkBlog" href="${path}/courses/paging?page=${i}&CategoryID=${CategoryID}&Name=${NameSearch}">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <input type="hidden" name="page" value="${i}" />
                                            <li class="page-itemBlog current-page"><a class="page-linkBlog" href="${path}/courses/paging?page=${i}&CategoryID=${CategoryID}&Name=${NameSearch}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                <c:if test="${page == number}">
                                    <li class="page-itemBlog next-page BlogDisable"><a class="page-linkBlog" href="">Next</a></li>
                                    </c:if>    
                                    <c:if test="${page != number}">
                                    <li class="page-itemBlog next-page"><a class="page-linkBlog" href="${path}/courses/paging?page=${page+1}&CategoryID=${CategoryID}&Name=${NameSearch}">Next</a></li>
                                    </c:if>    
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${list == null}">
                        <div class="courses_container">No Items Found!</div>
                    </c:if>
                </div>
            </div>

            <!-- Courses Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">

                    <!-- Categories -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Categories</div>
                        <div class="sidebar_categories">
                            <ul>
                                <c:forEach items="${CategoryDAO.getAllCategory()}" var="x">
                                    <li><a href="${path}/courses?CategoryID=${x.getCategoryID()}">${x.getName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- Latest Course -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Latest Courses</div>
                        <div class="sidebar_latest">
                            <c:forEach items="${CoursesDAO.getFewLatestCourse(5)}" var="x">
                                <!-- Latest Course -->
                                <div class="latest d-flex flex-row align-items-start justify-content-start">
                                    <div class="latest_image"><div><img src="${x.getImage()}" alt=""></div></div>
                                    <div class="latest_content">
                                        <div class="latest_title"><a href="${path}/course?CourseID=${x.getCourseID()}">${x.getName()}</a></div>
                                        <div class="latest_price">Free</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Newsletter -->

<div class="newsletter">
    <div class="newsletter_background parallax-window" data-parallax="scroll" data-image-src="${path}/images/newsletter.jpg" data-speed="0.8"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="newsletter_container d-flex flex-lg-row flex-column align-items-center justify-content-start">

                    <!-- Newsletter Content -->
                    <div class="newsletter_content text-lg-left text-center">
                        <div class="newsletter_title">sign up for news and offers</div>
                        <div class="newsletter_subtitle">Subcribe to lastest smartphones news & great deals we offer</div>
                    </div>

                    <!-- Newsletter Form -->
                    <div class="newsletter_form_container ml-lg-auto">
                        <form action="#" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                            <input type="email" class="newsletter_input" placeholder="Your Email" required="required">
                            <button type="submit" class="newsletter_button">subscribe</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="template/footer.jsp" %>
