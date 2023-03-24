<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="template/header.jsp" %>
<!-- Course -->
<link rel="stylesheet" type="text/css" href="${path}/styles/course.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/course_responsive.css">
<link rel="stylesheet" type="text/css" href="${path}/styles/blog_single.css">
<!-- Home -->
<fmt:formatNumber var="AvgRateInteger" type="number" maxFractionDigits="0" value="${ReviewDAO.getAvgVoteCourseByCourseID(Course.getCourseID())}" />
<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li><a href="${path}/courses">Courses</a></li>
                            <li>Course Details</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

<!-- Course -->

<div class="course">
    <div class="container">
        <div class="row">

            <!-- Course -->
            <div class="col-lg-8">

                <div class="course_container">
                    <div class="course_title">${Course.getName()}</div>
                    <div class="course_info d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">

                        <!-- Course Info Item -->
                        <div class="course_info_item">
                            <div class="course_info_title">Teacher:</div>
                            <div class="course_info_text"><a href="#">${UserDAO.getUserByUserID(Course.getUserID()).getFullName()}</a></div>
                        </div>

                        <!-- Course Info Item -->
                        <div class="course_info_item">
                            <div class="course_info_title">Reviews:</div>
                            <div class="rating_r rating_r_${AvgRateInteger}"><i></i><i></i><i></i><i></i><i></i></div>
                        </div>

                        <!-- Course Info Item -->
                        <div class="course_info_item">
                            <div class="course_info_title">Categories:</div>
                            <div class="course_info_text"><a href="#">${CategoryDAO.getCategoryNameByCategoryID(Course.getCategoryID())}</a></div>
                        </div>

                    </div>

                    <!-- Course Image -->
                    <div class="course_image"><img src="${Course.getImage()}" alt=""></div>

                    <!-- Course Tabs -->
                    <div class="course_tabs_container">
                        <div class="tabs d-flex flex-row align-items-center justify-content-start">
                            <div class="tab active">reviews</div>
                        </div>
                        <div class="tab_panels">

                            <!-- Reviews -->
                            <div class="tab_panel tab_panel_3 active">
                                <div class="tab_panel_title">Course Review</div>

                                <!-- Rating -->
                                <div class="review_rating_container">
                                    <div class="review_rating">
                                        <div class="review_rating_num"><fmt:formatNumber type="number" maxFractionDigits="1" value="${ReviewDAO.getAvgVoteCourseByCourseID(Course.getCourseID())}" /></div>
                                        <div class="review_rating_stars">

                                            <div class="rating_r rating_r_${AvgRateInteger}"><i></i><i></i><i></i><i></i><i></i></div>
                                        </div>
                                        <div class="review_rating_text">(${ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())} Ratings)</div>
                                    </div>
                                    <div class="review_rating_bars">
                                        <ul>
                                            <c:if test="${ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID()) ne 0}">
                                                <li><span>5 Star</span><div class="review_rating_bar"><div style="width:${ReviewDAO.getTotalVoteCourseByCourseIDAndVote(Course.getCourseID(), 5) * 100 / ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}%;"></div></div></li>
                                                <li><span>4 Star</span><div class="review_rating_bar"><div style="width:${ReviewDAO.getTotalVoteCourseByCourseIDAndVote(Course.getCourseID(), 4) * 100 / ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}%;"></div></div></li>
                                                <li><span>3 Star</span><div class="review_rating_bar"><div style="width:${ReviewDAO.getTotalVoteCourseByCourseIDAndVote(Course.getCourseID(), 3) * 100 / ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}%;"></div></div></li>
                                                <li><span>2 Star</span><div class="review_rating_bar"><div style="width:${ReviewDAO.getTotalVoteCourseByCourseIDAndVote(Course.getCourseID(), 2) * 100 / ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}%;"></div></div></li>
                                                <li><span>1 Star</span><div class="review_rating_bar"><div style="width:${ReviewDAO.getTotalVoteCourseByCourseIDAndVote(Course.getCourseID(), 1) * 100 / ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}%;"></div></div></li>
                                                    </c:if>
                                                    <c:if test="${ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID()) eq 0}">
                                                <li><span>5 Star</span><div class="review_rating_bar"><div style="width:0%;"></div></div></li>
                                                <li><span>4 Star</span><div class="review_rating_bar"><div style="width:0%;"></div></div></li>
                                                <li><span>3 Star</span><div class="review_rating_bar"><div style="width:0%;"></div></div></li>
                                                <li><span>2 Star</span><div class="review_rating_bar"><div style="width:0%;"></div></div></li>
                                                <li><span>1 Star</span><div class="review_rating_bar"><div style="width:0%;"></div></div></li>
                                                    </c:if>
                                        </ul>
                                    </div>
                                </div>

                                <!-- Comments -->
                                <div class="comments_container">
                                    <ul class="comments_list">
                                        <c:forEach items="${ReviewFeedbackDAO.getAllReviewFeedbackByCourseID(Course.getCourseID())}" var="x">
                                            <li>
                                                <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                    <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(x.getReviewFeedbackID()).getUserID()).getImage()}" alt=""></div></div>
                                                    <div class="comment_content">
                                                        <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                            <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(x.getReviewFeedbackID()).getUserID()).getFullName()}</a></div>
                                                            <div class="comment_rating">
                                                                <fmt:parseNumber var = "parseNumVote" integerOnly="true" type="number" value="${ReviewDAO.getReviewByReviewFeedbackID(x.getReviewFeedbackID()).getVote()}" />
                                                                <c:if test="${parseNumVote ne 0}">
                                                                    <div class="rating_r rating_r_${parseNumVote}"><i></i><i></i><i></i><i></i><i></i></div>
                                                                        </c:if>
                                                            </div>
                                                            <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${x.getReviewFeedbackDate()}"/></div>
                                                        </div>
                                                        <div class="comment_text">
                                                            <p>${x.getReviewFeedbackContent()}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:forEach items="${ReviewCommentsDAO.getAllReviewCommentsByReviewFeedbackID(x.getReviewFeedbackID())}" var="y">
                                                    <ul>
                                                        <li>
                                                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(y.getReviewFeedbackID()).getUserID()).getImage()}" alt=""></div></div>
                                                                <div class="comment_content">
                                                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                                        <fmt:parseNumber var = "parseNumVoteFeedback" integerOnly="true" type="number" value="${ReviewDAO.getReviewByReviewCommentID(y.getReviewCommentID()).getVote()}" />
                                                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewCommentID(y.getReviewCommentID()).getUserID()).getFullName()}</a></div>
                                                                        <div class="comment_rating">
                                                                            <c:if test="${parseNumVoteFeedback ne 0}">
                                                                                <div class="rating_r rating_r_${parseNumVoteFeedback}"><i></i><i></i><i></i><i></i><i></i></div>
                                                                            </c:if>                                                                   
                                                                        </div>
                                                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${y.getReviewCommentDate()}"/></div>
                                                                    </div>
                                                                    <div class="comment_text">
                                                                        <p>${y.getReviewCommentContent()}</p>
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
                                        <c:if test="${txtStatus == 2}">
                                            <div class="add_comment_title">Update a comment</div>
                                        </c:if>
                                        <c:if test="${txtStatus != 2}">
                                            <div class="add_comment_title">Write a comment</div>
                                        </c:if>

                                        <!-- Role: Course Feedback (Info people need to reply or edit) -->
                                        <c:if test="${ReviewFeedback != null}">
                                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(ReviewFeedback.getReviewFeedbackID()).getUserID()).getImage()}" alt=""></div></div>
                                                <div class="comment_content">
                                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(ReviewFeedback.getReviewFeedbackID()).getUserID()).getFullName()}</a></div>
                                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ReviewFeedback.getReviewFeedbackDate()}"/></div>
                                                    </div>
                                                    <div class="comment_text">
                                                        <p>${ReviewFeedback.getReviewFeedbackContent()}</p>
                                                    </div>
                                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_extra comment_reply"><a href="${path}/course?CourseID=${Course.getCourseID()}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span style="color: red;">Cancel</span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <!-- Role: Course Comment (Info people need to reply or edit) -->
                                        <c:if test="${ReviewComment != null}">
                                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewCommentID(ReviewComment.getReviewCommentID()).getUserID()).getImage()}" alt=""></div></div>
                                                <div class="comment_content">
                                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewCommentID(ReviewComment.getReviewCommentID()).getUserID()).getFullName()}</a></div>                                                     
                                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${ReviewComment.getReviewCommentDate()}"/></div>
                                                    </div>
                                                    <div class="comment_text">
                                                        <p>${ReviewComment.getReviewCommentContent()}</p>
                                                    </div>
                                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                        <div class="comment_extra comment_reply"><a href="${path}/course?CourseID=${Course.getCourseID()}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span style="color: red;">Cancel</span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <!-- Form:s Insert Or Edit -->
                                        <!-- Status: Insert -->
                                        <c:if test="${txtStatus != 2}">
                                            <form action="${path}/course/review/comment" class="comment_form" method="post">
                                                <div>
                                                    <div class="form_title">Review*</div>
                                                    <c:if test="${ReviewFeedback != null}">
                                                        <textarea class="comment_input comment_textarea" required="required" name="txtReview">@${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(ReviewFeedback.getReviewFeedbackID()).getUserID()).getFullName()} </textarea>
                                                    </c:if>
                                                    <c:if test="${ReviewComment != null}">
                                                        <textarea class="comment_input comment_textarea" required="required" name="txtReview">@${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewCommentID(ReviewComment.getReviewCommentID()).getUserID()).getFullName()} </textarea>
                                                    </c:if>
                                                </div>
                                                <input type="hidden" name="txtStatus" value="1"/>
                                                <input type="hidden" name="txtVoteStatus" value="0"/>
                                                <input type="hidden" name="txtCourseID" value="${Course.getCourseID()}"/>
                                                <c:if test="${ReviewFeedback != null}">
                                                    <input type="hidden" name="txtReviewFeedbackID" value="${ReviewFeedback.getReviewFeedbackID()}"/>
                                                </c:if>
                                                <c:if test="${ReviewComment != null}">
                                                    <input type="hidden" name="txtReviewFeedbackID" value="${ReviewComment.getReviewFeedbackID()}"/>
                                                </c:if>
                                                <div>
                                                    <button type="submit" class="comment_button trans_200">submit</button>
                                                </div>
                                            </form>
                                        </c:if>
                                        <!-- End -->

                                        <!-- Status: Edit (Review Feedback)-->
                                        <c:if test="${txtStatus == 2 && ReviewFeedback != null}">
                                            <form action="${path}/course/review/feedback" class="comment_form" method="post">
                                                <div>
                                                    <div class="form_title">Update*</div>
                                                    <textarea class="comment_input comment_textarea" required="required" name="txtReview">${ReviewFeedback.getReviewFeedbackContent()}</textarea>
                                                </div>
                                                <input type="hidden" name="txtStatus" value="2"/>
                                                <input type="hidden" name="txtReviewFeedbackID" value="${ReviewFeedback.getReviewFeedbackID()}"/>
                                                <input type="hidden" name="txtCourseID" value="${Course.getCourseID()}"/>
                                                <div>
                                                    <button type="submit" class="comment_button trans_200">submit</button>
                                                </div>
                                            </form>
                                        </c:if>
                                        <!-- End -->

                                        <!-- Status: Edit (Review Comment)-->
                                        <c:if test="${txtStatus == 2 && ReviewComment != null}">
                                            <form action="${path}/course/review/comment" class="comment_form" method="post">
                                                <div>
                                                    <div class="form_title">Update*</div>
                                                    <textarea class="comment_input comment_textarea" required="required" name="txtReview">${ReviewComment.getReviewCommentContent()}</textarea>
                                                </div>
                                                <input type="hidden" name="txtStatus" value="2"/>
                                                <input type="hidden" name="txtReviewCommentID" value="${ReviewComment.getReviewCommentID()}"/>
                                                <input type="hidden" name="txtCourseID" value="${Course.getCourseID()}"/>
                                                <div>
                                                    <button type="submit" class="comment_button trans_200">submit</button>
                                                </div>
                                            </form>
                                        </c:if>
                                        <!-- End -->

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Course Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">

                    <!-- Feature -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Course Feature</div>
                        <div class="sidebar_feature">
                            <c:if test="${student ne null}">
                                <c:url value="/course" var="enroll">
                                    <c:param name="cid" value="${Course.getCourseID()}"/>
                                </c:url>

                                <c:if test="${ce eq null}">
                                    <form action="${enroll}" method="post">
                                        <button class="btn btn-primary btn-lg" type="submit">Enroll Now</button>
                                    </form>
                                </c:if>

                                <c:if test="${ce ne null}">
                                    <form action="LessonDetail" method="post">

                                        <button class="btn btn-primary btn-lg" type="submit" value="${Course.getCourseID()}" name="courseId">
                                            Go to Course
                                        </button> 
                                    </form>
                                </c:if>
                            </c:if>



                            <!-- Features -->
                            <div class="feature_list">

                                <!-- Feature -->
                                <div class="feature d-flex flex-row align-items-center justify-content-start">
                                    <div class="feature_title"><i class="fa fa-clock-o" aria-hidden="true"></i><span>Duration:</span></div>
                                    <div class="feature_text ml-auto">2 weeks</div>
                                </div>

                                <!-- Feature -->
                                <div class="feature d-flex flex-row align-items-center justify-content-start">
                                    <div class="feature_title"><i class="fa fa-file-text-o" aria-hidden="true"></i><span>Lectures:</span></div>
                                    <div class="feature_text ml-auto">10</div>
                                </div>

                                <!-- Feature -->
                                <div class="feature d-flex flex-row align-items-center justify-content-start">
                                    <div class="feature_title"><i class="fa fa-question-circle-o" aria-hidden="true"></i><span>Lectures:</span></div>
                                    <div class="feature_text ml-auto">6</div>
                                </div>

                                <!-- Feature -->
                                <div class="feature d-flex flex-row align-items-center justify-content-start">
                                    <div class="feature_title"><i class="fa fa-list-alt" aria-hidden="true"></i><span>Lectures:</span></div>
                                    <div class="feature_text ml-auto">Yes</div>
                                </div>

                                <!-- Feature -->
                                <div class="feature d-flex flex-row align-items-center justify-content-start">
                                    <div class="feature_title"><i class="fa fa-users" aria-hidden="true"></i><span>Lectures:</span></div>
                                    <div class="feature_text ml-auto">35</div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Feature -->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Teacher</div>
                        <div class="sidebar_teacher">
                            <div class="teacher_title_container d-flex flex-row align-items-center justify-content-start">
                                <div class="teacher_image"><img src="${UserDAO.getUserByUserID(Course.getUserID()).getImage()}" alt=""></div>
                                <div class="teacher_title">
                                    <div class="teacher_name"><a href="#">${UserDAO.getUserByUserID(Course.getUserID()).getFullName()}</a></div>
                                </div>
                            </div>
                            <div class="teacher_meta_container">
                                <!-- Teacher Rating -->
                                <div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
                                    <div class="teacher_meta_title">Average Rating:</div>
                                    <div class="teacher_meta_text ml-auto"><span><fmt:formatNumber type="number" maxFractionDigits="1" value="${ReviewDAO.getAvgVoteCourseByCourseID(Course.getCourseID())}" /></span><i class="fa fa-star" aria-hidden="true"></i></div>
                                </div>
                                <!-- Teacher Review -->
                                <div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
                                    <div class="teacher_meta_title">Review:</div>
                                    <div class="teacher_meta_text ml-auto"><span>${ReviewDAO.getTotalVoteCourseByCourseID(Course.getCourseID())}</span><i class="fa fa-comment" aria-hidden="true"></i></div>
                                </div>
                                <!-- Teacher Quizzes -->
                                <div class="teacher_meta d-flex flex-row align-items-center justify-content-start">
                                    <div class="teacher_meta_title">Quizzes:</div>
                                    <div class="teacher_meta_text ml-auto"><span>600</span><i class="fa fa-user" aria-hidden="true"></i></div>
                                </div>
                            </div>
                            <div class="teacher_info">
                                <p></p>
                            </div>
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