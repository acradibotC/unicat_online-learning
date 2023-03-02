<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="template/header.jsp" %>
<!-- Blog-Single -->
<link rel="stylesheet" type="text/css" href="${path}/styles/blog_single.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/blog_single_responsive.css">

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


<div class="blog">
    <div class="container">
        <div class="row">

            <!-- Blog Content -->
            <div class="col-lg-8">
                <div class="blog_content">
                    <div class="blog_title">${BlogDAO.getBlogFromBlogID(BlogID).getBlogTitler()}</div>
                    <div class="blog_meta">
                        <ul>
                            <li>Post on <a href="#">${BlogDAO.getBlogFromBlogID(BlogID).getPostDate()}</a></li>
                            <li>By <a href="#">${UserDAO.getUserByUserID(BlogDAO.getBlogFromBlogID(BlogID).getUserID()).getUserName()}</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Comments -->
                <div class="comments_container">
                    <div class="comments_title"><span></span> Comments</div>
                    <ul class="comments_list">
                        <li>     
                            <c:choose>
                                <c:when test="${BlogFeedback != null}">
                                    <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                        <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(BlogFeedback.getUserID()).getImage()}" alt=""></div></div>
                                        <div class="comment_content">
                                            <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(BlogFeedback.getUserID()).getFullName()}</a></div>
                                                <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                                <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${BlogFeedback.getBlogFeedbackDate()}"/></div>
                                            </div>
                                            <div class="comment_text">
                                                <p>${BlogFeedback.getBlogFeedbackContent()}</p>
                                            </div>
                                            <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                <div class="comment_extra comment_reply"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${BlogCommentDAO.getAllBlogCommentsByBlogFeedbackID(BlogFeedback.getBlogFeedbackID())}" var="y">
                                        <ul>
                                            <li>
                                                <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                    <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(y.getUserID()).getImage()}" alt=""></div></div>
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
                                                            <div class="comment_extra comment_reply"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:when>

                                <c:when test="${BlogComment != null}">
                                    <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                        <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(BlogFeedbackDAO.getBlogFeedbackByBlogFeedbackID(BlogComment.getBlogFeedbackID()).getUserID()).getImage()}" alt=""></div></div>
                                        <div class="comment_content">
                                            <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(BlogFeedbackDAO.getBlogFeedbackByBlogFeedbackID(BlogComment.getBlogFeedbackID()).getUserID()).getFullName()}</a></div>
                                                <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                                <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${BlogFeedbackDAO.getBlogFeedbackByBlogFeedbackID(BlogComment.getBlogFeedbackID()).getBlogFeedbackDate()}"/></div>
                                            </div>
                                            <div class="comment_text">
                                                <p>${BlogFeedbackDAO.getBlogFeedbackByBlogFeedbackID(BlogComment.getBlogFeedbackID()).getBlogFeedbackContent()}</p>
                                            </div>
                                            <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                <div class="comment_extra comment_reply"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${BlogCommentDAO.getAllBlogCommentsByBlogFeedbackID(BlogComment.getBlogFeedbackID())}" var="y">
                                        <ul>
                                            <li>
                                                <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                    <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(y.getUserID()).getImage()}" alt=""></div></div>
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
                                                            <div class="comment_extra comment_reply"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </li>                   
                    </ul>
                    <div class="add_comment_container">
                        <c:if test="${txtStatus != 2}">
                            <div class="add_comment_title">Write a comment</div>
                        </c:if>
                        <c:if test="${txtStatus == 2}">
                            <div class="add_comment_title">Update a comment</div>
                        </c:if>

                        <!-- Role: Blog Feedback (Info people need to reply or edit) -->
                        <c:if test="${BlogFeedback != null}">
                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(BlogFeedback.getUserID()).getImage()}" alt=""></div></div>
                                <div class="comment_content">
                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(BlogFeedback.getUserID()).getFullName()}</a></div>
                                        <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${BlogFeedback.getBlogFeedbackDate()}"/></div>
                                    </div>
                                    <div class="comment_text">
                                        <p>${BlogFeedback.getBlogFeedbackContent()}</p>
                                    </div>
                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                        <div class="comment_extra comment_reply"><a href="${path}/blog/single?BlogID=${BlogID}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span style="color: red;">Cancel</span></a></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>        

                        <!-- Role: Blog Comment (Info people need to reply or edit)-->
                        <c:if test="${BlogComment != null}">
                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(BlogComment.getUserID()).getImage()}" alt=""></div></div>
                                <div class="comment_content">
                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(BlogComment.getUserID()).getFullName()}</a></div>
                                        <div class="comment_rating"><div class="rating_r rating_r_4"><i></i><i></i><i></i><i></i><i></i></div></div>
                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${BlogComment.getBlogCommentDate()}"/></div>
                                    </div>
                                    <div class="comment_text">
                                        <p>${BlogComment.getBlogCommentContent()}</p>
                                    </div>
                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                        <div class="comment_extra comment_reply"><a href="${path}/blog/single?BlogID=${BlogID}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span style="color: red;">Cancel</span></a></div>
                                    </div>
                                </div>
                            </div>
                        </c:if>   

                        <!-- Status: Update Blog Comment -->
                        <c:if test="${txtStatus == 2 && BlogComment != null}">
                            <form action="${path}/blog/comment" class="comment_form" method="post">
                                <div>
                                    <div class="form_title">Update*</div>
                                    <textarea name="txtBlogCommentContent" class="comment_input comment_textarea" required="required">${BlogComment.getBlogCommentContent()} </textarea>
                                </div>                         
                                <input type="hidden" name="txtStatus" value="2">
                                <input type="hidden" name="txtBlogID" value="${BlogID}"/>
                                <input type="hidden" name="txtBlogFeedbackID" value="${BlogComment.getBlogFeedbackID()}"/>
                                <input type="hidden" name="txtBlogCommentID" value="${BlogComment.getBlogCommentID()}">
                                <div>
                                    <button type="submit" class="comment_button trans_200">Update</button>
                                </div>
                            </form>
                        </c:if>

                        <!-- Status: Update Blog Feedback -->
                        <c:if test="${txtStatus == 2 && BlogFeedback != null}">
                            <form action="${path}/blog/feedback" class="comment_form" method="post">
                                <div>
                                    <div class="form_title">Update*</div>
                                    <textarea name="txtBlogCommentContent" class="comment_input comment_textarea" required="required">${BlogFeedback.getBlogFeedbackContent()} </textarea>
                                </div>
                                <input type="hidden" name="txtStatus" value="2">
                                <input type="hidden" name="txtBlogID" value="${BlogID}"/>
                                <input type="hidden" name="txtBlogFeedbackID" value="${BlogFeedback.getBlogFeedbackID()}"/>
                                <div>
                                    <button type="submit" class="comment_button trans_200">Update</button>
                                </div>
                            </form>
                        </c:if>

                        <!-- Status: Reply (For Comment or Feedback) -->
                        <c:if test="${txtStatus != 2}">
                            <form action="${path}/blog/comment" class="comment_form" method="post">
                                <div>
                                    <div class="form_title">Reply*</div>
                                    <c:if test="${BlogComment != null}">
                                        <textarea name="txtBlogCommentContent" class="comment_input comment_textarea" required="required">@${UserDAO.getUserByUserID(BlogComment.getUserID()).getFullName()} </textarea>
                                    </c:if>
                                    <c:if test="${BlogFeedback != null}"> 
                                        <textarea name="txtBlogCommentContent" class="comment_input comment_textarea" required="required">@${UserDAO.getUserByUserID(BlogFeedback.getUserID()).getFullName()} </textarea>
                                    </c:if>
                                </div>
                                <input type="hidden" name="txtBlogID" value="${BlogID}"/>
                                <input type="hidden" name="txtStatus" value="${txtStatus}"/>
                                <c:if test="${BlogComment != null}">
                                    <input type="hidden" name="txtBlogFeedbackID" value="${BlogComment.getBlogFeedbackID()}"/>
                                </c:if>
                                <c:if test="${BlogFeedback != null}">
                                    <input type="hidden" name="txtBlogFeedbackID" value="${BlogFeedback.getBlogFeedbackID()}"/>
                                </c:if>
                                <div>
                                    <button type="submit" class="comment_button trans_200">submit</button>
                                </div>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Blog Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">

                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Latest Blogs</div>
                        <div class="sidebar_latest">
                            <!-- Latest Blogs -->
                            <c:forEach items="${BlogDAO.getTopLastestBlog(5)}" var="x">
                                <div class="latest d-flex flex-row align-items-start justify-content-start">
                                    <div class="latest_image"><div><img src="${x.getBlogImage()}" alt=""></div></div>
                                    <div class="latest_content">
                                        <div class="latest_title"><a href="${path}/blog/single?BlogID=${x.getBlogID()}">${x.getBlogTitler()}</a></div>
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
                            <c:forEach items="${CourseDAO.getFewLatestCourse(5)}" var="x">
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
    <div class="newsletter_background" style="background-image:url(${path}/images/newsletter_background.jpg)"></div>
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