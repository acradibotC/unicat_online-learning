<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="template/header.jsp" %>
<!-- Blog-Single -->
<link rel="stylesheet" type="text/css" href="styles/blog_single.css">
<link rel="stylesheet" type="text/css" href="styles/blog_single_responsive.css">

<!-- Home -->

<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li><a href="${path}/blog">Blog</a></li>
                            <li>Blog Single</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

<!-- Blog -->

<div class="blog">
    <div class="container">
        <div class="row">

            <!-- Blog Content -->
            <div class="col-lg-8">
                <div class="blog_content">
                    <div class="blog_title">${Blog.getBlogTitler()}</div>
                    <div class="blog_meta">
                        <ul>
                            <li>Post on <a href="#">${Blog.getPostDate()}</a></li>
                            <li>By <a href="#">${UserDAO.getUserByUserID(Blog.getUserID()).getUserName()}</a></li>
                        </ul>
                    </div>
                    ${Blog.getBlogDescription()}
                </div>

                <!-- Comments -->
                <div class="comments_container">
                    <div class="comments_title"><span>${BlogFeedbackDAO.getAllBlogFeedbackByBlogID(BlogID).size() + BlogCommentDAO.getAllBlogCommentsByBlogID(BlogID).size()}</span> Comments</div>
                    <ul class="comments_list">
                        <c:forEach items="${BlogFeedbackDAO.getAllBlogFeedbackByBlogID(BlogID)}" var="x">
                            <li>       
                                <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                    <div class="comment_image"><div><img src="images/comment_1.jpg" alt=""></div></div>
                                    <div class="comment_content">
                                        <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                            <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</a></div>
                                            <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                            <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${x.getBlogFeedbackDate()}"/></div>
                                        </div>
                                        <div class="comment_text">
                                            <p>${x.getBlogFeedbackContent()}</p>
                                        </div>
                                        <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                            <div class="comment_extra comment_reply"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span>Reply</span></a></div>
                                        </div>
                                    </div>
                                </div>
                                <c:forEach items="${BlogCommentDAO.getAllBlogCommentsByBlogFeedbackID(x.getBlogFeedbackID())}" var="y">
                                    <ul>
                                        <li>
                                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                <div class="comment_image"><div><img src="images/comment_2.jpg" alt=""></div></div>
                                                <div class="comment_content">
                                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(y.getUserID()).getFullName()}</a></div>
                                                        <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${y.getBlogCommentDate()}"/></div>
                                                    </div>
                                                    <div class="comment_text">
                                                        <p>${y.getBlogCommentContent()}</p>
                                                    </div>
                                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_extra comment_reply"><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span>Reply</span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </c:forEach>
                            </li>
                        </c:forEach>                     
                    </ul>
                    <div class="add_comment_container">
                        <div class="add_comment_title">Write a comment</div>
                        <form action="${path}/blog_single/postcomments" class="comment_form" method="post">
                            <div>
                                <div class="form_title">Review*</div>
                                <textarea class="comment_input comment_textarea" required="required" name="txtReview"></textarea>
                            </div>
                           <input type="hidden" name="txtBlogID" value="${BlogID}"/>
                            <div>
                                <button type="submit" class="comment_button trans_200">submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Blog Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">

                    <!-- Categories -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Categories</div>
                        <div class="sidebar_categories">
                            <ul class="categories_list">
                                <li><a href="#" class="clearfix">Art & Design<span>(25)</span></a></li>
                                <li><a href="#" class="clearfix">Business<span>(10)</span></a></li>
                                <li><a href="#" class="clearfix">IT & Software<span>(22)</span></a></li>
                                <li><a href="#" class="clearfix">Languages<span>(12)</span></a></li>
                                <li><a href="#" class="clearfix">Programming<span>(18)</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Latest Blogs</div>
                        <div class="sidebar_latest">
                            <!-- Latest Blogs -->
                            <c:forEach items="${BlogDAO.getTopLastestBlog(5)}" var="x">
                                <div class="latest d-flex flex-row align-items-start justify-content-start">
                                    <div class="latest_image"><div><img src="${x.getBlogImage()}" alt=""></div></div>
                                    <div class="latest_content">
                                        <div class="latest_title"><a href="${path}/blog_single?BlogID=${x.getBlogID()}">${x.getBlogTitler()}</a></div>
                                        <div class="latest_date">${x.getPostDate()}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Latest News -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Latest Courses</div>
                        <div class="sidebar_latest">
                            <c:forEach items="${CoursesDAO.getFewLatestCourse(5)}" var="x">
                                <!-- Latest Course -->
                                <div class="latest d-flex flex-row align-items-start justify-content-start">
                                    <div class="latest_image"><div><img src="${x.getImage()}" alt=""></div></div>
                                    <div class="latest_content">
                                        <div class="latest_title"><a href="course.html">${x.getName()}</a></div>
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
    <div class="newsletter_background" style="background-image:url(images/newsletter_background.jpg)"></div>
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