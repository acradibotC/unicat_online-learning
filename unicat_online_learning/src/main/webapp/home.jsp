<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="template/header.jsp" %>

<!-- Home -->
<div class="home">
    <div class="home_slider_container">

        <!-- Home Slider -->
        <div class="owl-carousel owl-theme home_slider">

            <!-- Home Slider Item -->
            <div class="owl-item">
                <div class="home_slider_background" style="background-image:url(${path}/images/home_slider_1.jpg)"></div>
                <div class="home_slider_content">
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <div class="home_slider_title">The Premium System Education</div>
                                <div class="home_slider_subtitle">Future Of Education Technology</div>
                                <div class="home_slider_form_container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Home Slider Item -->
            <div class="owl-item">
                <div class="home_slider_background" style="background-image:url(${path}/images/home-slider-2.jpg)"></div>
                <div class="home_slider_content">
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <!--                                <div class="home_slider_title">The Premium System Education</div>
                                                                <div class="home_slider_subtitle">Future Of Education Technology</div>-->
                                <div class="home_slider_form_container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Home Slider Item -->
            <div class="owl-item">
                <div class="home_slider_background" style="background-image:url(${path}/images/home_slider_1.jpg)"></div>
                <div class="home_slider_content">
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <div class="home_slider_title">The Premium System Education</div>
                                <div class="home_slider_subtitle">Future Of Education Technology</div>
                                <div class="home_slider_form_container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Home Slider Nav -->

    <div class="home_slider_nav home_slider_prev"><i class="fa fa-angle-left" aria-hidden="true"></i></div>
    <div class="home_slider_nav home_slider_next"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
</div>

<<!-- Popular Courses -->
<div class="courses">
    <div class="section_background parallax-window" data-parallax="scroll" data-image-src="${path}images/courses_background.jpg" data-speed="0.8"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Popular Online Courses</h2>
                    <div class="section_subtitle"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel gravida arcu. Vestibulum feugiat, sapien ultrices fermentum congue, quam velit venenatis sem</p></div>
                </div>
            </div>
        </div>
        <div class="row courses_row">

            <!-- Course -->
            <c:forEach items="${CoursesDAO.getTop3PopularCourse()}" var="x">
                <fmt:formatNumber var="AvgRateInteger" type="number" maxFractionDigits="2" value="${ReviewDAO.getAvgVoteCourseByCourseID(x.getCourseID())}" />
                <div class="col-lg-4 course_col">
                    <div class="course">
                        <div class="course_image"><img src="${x.getImage()}" alt=""></div>
                        <div class="course_body">
                            <h3 class="course_title"><a href="${path}/course?CourseID=${x.getCourseID()}">${x.getName()}</a></h3>
                            <div class="course_teacher">${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</div>
                            <c:if test="${x.getCourseInfo().length() != 0}">
                                <div class="course_text">
                                    <p>${BlogDAO.getShortString(x.getCourseInfo(), 10)}...</p>
                                </div>
                            </c:if>

                        </div>
                        <div class="course_footer">
                            <div class="course_footer_content d-flex flex-row align-items-center justify-content-start">
                                <div class="course_info">
                                    <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                    <span>${ReviewDAO.getTotalVoteCourseByCourseID(x.getCourseID())} Students</span>
                                </div>
                                <div class="course_info">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <span>${AvgRateInteger} Ratings</span>
                                </div>
                                <div class="course_price ml-auto">Free</div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="row">
            <div class="col">
                <div class="courses_button trans_200"><a href="${path}/courses">view all courses</a></div>
            </div>
        </div>
    </div>
</div>

<!-- Team -->

<div class="team">
    <div class="team_background parallax-window" data-parallax="scroll" data-image-src="images/team_background.jpg" data-speed="0.8"></div>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Founders And Co-Founders</h2>
                    <div class="section_subtitle"><p>Introducing the talented team behind Unicat, the online learning website that is changing the game when it comes to education. Led by a group of experienced entrepreneurs and educators, this dynamic team is committed to making knowledge accessible to all through innovative technology and engaging course content.</p></div>
                </div>
            </div>
        </div>
        <div class="row team_row">

            <c:forEach items="${UserDAO.getAllAdminUser()}" var="x">
                <!-- Team Item -->
                <div class="col-lg-3 col-md team_col">
                    <div class="team_item">
                        <div class="team_image"><img src="${x.getImage()}" alt=""></div>
                        <div class="team_body">
                            <div class="team_title"><a href="#">${x.getFullName()}</a></div>
                            <div class="team_subtitle">Designer & Website</div>
                            <div class="social_list">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</div>

<!-- Latest News -->

<div class="news">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="section_title_container text-center">
                    <h2 class="section_title">Latest News</h2>
                    <div class="section_subtitle"></div>
                </div>
            </div>
        </div>
        <div class="row news_row">
            <div class="col-lg-7 news_col">

                <!-- News Post Large -->
                <div class="news_post_large_container">
                    <div class="news_post_large">
                        <div class="news_post_image"><img src="${LatestBlog.getBlogImage()}" alt=""></div>
                        <div class="news_post_large_title"><a href="${path}/blog/single?BlogID=${LatestBlog.getBlogID()}">${LatestBlog.getBlogTitler()}</a></div>
                        <div class="news_post_meta">
                            <ul>
                                <li><a href="">${UserDAO.getUserByUserID(LatestBlog.getUserID()).getUserName()}</a></li>
                                <li><a href="">${LatestBlog.getPostDate()}</a></li>
                            </ul>
                        </div>
                        <div class="news_post_text">
                            <p>${BlogDAO.getShortString(LatestBlog.getBlogDescription(), 15)}...</p>
                        </div>
                        <div class="news_post_link"><a href="${path}/blog/single?BlogID=${LatestBlog.getBlogID()}">read more</a></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-5 news_col">
                <div class="news_posts_small">
                    <!-- News Posts Small -->
                    <c:forEach items="${BlogDAO.getTop5LatestBlogExceptLatestBlog()}" var="x">                       
                        <div class="news_post_small">
                            <div class="news_post_small_title"><a href="${path}/blog/single?BlogID=${x.getBlogID()}">${x.getBlogTitler()}</a></div>
                            <div class="news_post_meta">
                                <ul>
                                    <li><a href="">${UserDAO.getUserByUserID(x.getUserID()).getUserName()}</a></li>
                                    <li><a href="">${x.getPostDate()}</a></li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
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
                        <div class="newsletter_subtitle">Subcribe to lastest lessons news & great deals we offer</div>
                    </div>

                    <!-- Newsletter Form -->
                    <c:if test="${User eq null}">
                        <div class="newsletter_form_container ml-lg-auto">
                            <form action="${path}/user/login" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                                <button type="submit" class="newsletter_button">subscribe</button>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${User ne null}">
                        <div class="newsletter_form_container ml-lg-auto">
                            <form action="${path}/courses" id="newsletter_form" class="newsletter_form d-flex flex-row align-items-center justify-content-center">
                                <button type="submit" class="newsletter_button">subscribe</button>
                            </form>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="template/footer.jsp" %>
