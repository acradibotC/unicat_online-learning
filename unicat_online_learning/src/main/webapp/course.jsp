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
                            <div class="tab active">description</div>
                            <div class="tab">curriculum</div>
                            <div class="tab">reviews</div>
                        </div>
                        <div class="tab_panels">

                            <!-- Description -->
                            <div class="tab_panel active">
                                <div class="tab_panel_title">Introduction</div>
                                <div class="tab_panel_content">
                                    <div class="tab_panel_text">
                                        <p>${Course.getCourseInfo()}</p>
                                    </div>
                                    <div class="tab_panel_section">
                                        <div class="tab_panel_subtitle"></div>
                                        <ul class="tab_panel_bullets">

                                        </ul>
                                    </div>
                                    <div class="tab_panel_section">

                                    </div>
                                    <div class="tab_panel_faq">
                                        <div class="tab_panel_title">FAQ</div>

                                        <!-- Accordions -->
                                        <div class="accordions">

                                            <div class="elements_accordions">

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>What are some of the challenges of online learning?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lack of structure: Online courses may not have set class times or regular face-to-face interactions with instructors, which can make it challenging for some students to stay motivated and on track.</p>
                                                        <p>Technical difficulties: Online learning requires a reliable internet connection and access to a computer or device, which can be a barrier for some students, particularly those in low-income areas or with limited access to technology.</p>
                                                        <p>Limited social interaction: Online courses can be isolating, with little opportunity for students to interact with peers or instructors in person.</p>
                                                        <p>Time management: Online courses require students to manage their time effectively, which can be challenging for those with busy schedules or competing priorities.</p>
                                                        <p>Self-motivation</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>What are the benefits of using online learning websites?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Flexibility: Online learning allows students to learn at their own pace and on their own schedule. This can be particularly beneficial for working professionals, parents, or students with other commitments.</p>
                                                        <p>Convenience: Online learning eliminates the need to commute to a physical classroom, saving time and money on transportation.</p>
                                                        <p>Access to a wider range of courses: Online learning allows students to take courses from institutions around the world, expanding their opportunities for learning and professional development.</p>
                                                        <p>Cost savings: Online courses are often less expensive than traditional classroom courses, and students can save money on textbooks and other course.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>How do online learning websites differ from traditional learning?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Mode of instruction: Traditional classroom learning typically involves face-to-face instruction, while online learning is typically delivered through a virtual classroom or online platform.</p>
                                                        <p>Flexibility: Online learning offers more flexibility in terms of when and where students can access course materials and participate in class.</p>
                                                        <p>Interactivity: Traditional classroom learning typically involves more interactive experiences, such as discussions and group work, while online learning may rely more heavily on independent learning and self-study.</p>
                                                        <p>Pace of learning: Online learning allows students to learn at their own pace, while traditional classroom learning often follows a set schedule.</p>
                                                        <p>Classroom culture: Traditional classroom learning fosters a sense of classroom community and culture, while online learning can be more individualistic and isolated.</p>
                                                        <p>Accessibility: Online learning offers greater accessibility to individuals who may not be able to attend traditional classroom courses, such as those with disabilities or those living in remote areas.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>Can I get a certificate or degree from an online learning website?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>No, this online learning website doesn't support any certificate or degree.</p>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Curriculum -->
                            <div class="tab_panel tab_panel_2">
                                <div class="tab_panel_content">
                                    <div class="tab_panel_title">${Course.getName()}</div>
                                    <div class="tab_panel_content">
                                        <div class="tab_panel_text">                   
                                        </div>

                                        <!-- Dropdowns -->
                                        <ul class="dropdowns">
                                            <c:forEach items="${LessonDAO.getAllLessonByCourseID(Course.getCourseID())}" var="x">
                                                <li>
                                                    <div class="dropdown_item">
                                                        <div class="dropdown_item_title"><span>Lecture ${x.getLessonNum()}:</span> ${x.getName()}</div>
                                                        <div class="dropdown_item_text">
<!--                                                            <p>${x.getTitle()}</p>-->
                                                        </div>
                                                    </div>                                     
                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Reviews -->
                            <div class="tab_panel tab_panel_3">
                                <div class="tab_panel_title">Course Review</div>

                                <c:if test="${CourseEnrollDAO.getCourseEnrollByUserIDAndCourseID(User.getUserID(), Course.getCourseID()).getCourseStatus() eq 1}">
                                    <div>
                                        <a href="${path}/course/rating?CourseID=${Course.getCourseID()}">
                                            <button class="btn btn-primary" style="color: white; align-content: center; border-radius: 5px; ">Give a Rating</button>
                                        </a>
                                    </div>
                                    <div style="margin-top: 10px;">
                                        <c:if test="${ReviewDAO.checkUserVote(User.getUserID(), Course.getCourseID()).getVote() ne 0}">
                                            You have voted <fmt:formatNumber type="number" maxFractionDigits="0" value="${ReviewDAO.checkUserVote(User.getUserID(), Course.getCourseID()).getVote()}" /> star
                                        </c:if>
                                    </div>
                                </c:if>
                                <!-- Rating -->
                                <div class="review_rating_container">
                                    <div class="review_rating">
                                        <div class="review_rating_num"><fmt:formatNumber type="number" maxFractionDigits="1" value="${ReviewDAO.getAvgVoteCourseByCourseID(Course.getCourseID())}" /></div>
                                        <div class="review_rating_stars">

                                            <div class="rating_r rating_r_${AvgRateInteger}"><i></i><i></i><i></i><i></i><i></i></div>
                                        </div>
                                        <div class="review_rating_text">(${ReviewDAO.getTotalVoteCourseByCourseIDAndNotEqualToNumber(Course.getCourseID(), 0)} Ratings)</div>
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
                                                        <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                            <!-- Role: Student, Tutor, Admin (Can reply)-->
                                                            <c:if test="${student != null || tutor != null || admin != null}">
                                                                <div class="comment_extra comment_reply">
                                                                    <form action="${path}/course/review/transaction" method="post">
                                                                        <input name="txtStatus" value="1" hidden=""/>
                                                                        <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                        <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                        <button style="border-radius: 15px; width: 60px; height: 25px; border: 1px solid white; background-color: white;">
                                                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                                            <span>Reply</span>
                                                                        </button>
                                                                    </form>
                                                                </div>  
                                                            </c:if>

                                                            <!-- Role: Tutor, Admin (Can delete, update all Feedback)-->
                                                            <c:if test="${tutor != null || admin != null}">
                                                                <div class="comment_extra comment_reply" style="margin-left: 70%;">
                                                                    <form action="${path}/course/review/transaction" method="post">
                                                                        <input name="txtStatus" value="2" hidden=""/>
                                                                        <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                        <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                        <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>
                                                                <div class="comment_extra comment_reply" style="margin-left: 10px;">
                                                                    <form action="${path}/course/review/feedback" method="post">
                                                                        <input name="txtStatus" value="3" hidden=""/>
                                                                        <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                        <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                        <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>       
                                                            </c:if>

                                                            <!-- Role: Student can Delete Update their Feedback -->
                                                            <c:if test="${student.getUserID() == ReviewDAO.getReviewByReviewFeedbackID(x.getReviewFeedbackID()).getUserID()}">
                                                                <div class="comment_extra comment_reply" style="margin-left: 70%;">
                                                                    <form action="${path}/course/review/transaction" method="post">
                                                                        <input name="txtStatus" value="2" hidden=""/>
                                                                        <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                        <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                        <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                                        </button>
                                                                    </form>
                                                                </div>
                                                                <div class="comment_extra comment_reply" style="margin-left: 10px;">
                                                                    <form action="${path}/course/review/feedback" method="post">
                                                                        <input name="txtStatus" value="3" hidden=""/>
                                                                        <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                        <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                        <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                                        </button>
                                                                    </form>
                                                                </div> 
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:forEach items="${ReviewCommentsDAO.getAllReviewCommentsByReviewFeedbackID(x.getReviewFeedbackID())}" var="y">
                                                    <ul>
                                                        <li>
                                                            <div class="comment_item d-flex flex-row align-items-start jutify-content-start">
                                                                <div class="comment_image"><div><img src="${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewFeedbackID(y.getReviewFeedbackID()).getUserID()).getImage()}" alt=""></div></div>
                                                                <div class="comment_content">
                                                                    <fmt:parseNumber var = "parseNumVoteComment" integerOnly="true" type="number" value="${ReviewDAO.getReviewByReviewCommentID(y.getReviewCommentID()).getVote()}" />
                                                                    <div class="comment_title_container d-flex flex-row align-items-center justify-content-start">
                                                                        <div class="comment_author"><a href="#">${UserDAO.getUserByUserID(ReviewDAO.getReviewByReviewCommentID(y.getReviewCommentID()).getUserID()).getFullName()}</a></div>
                                                                        <div class="comment_rating">
                                                                            <c:if test="${parseNumVoteComment ne 0}">
                                                                                <div class="rating_r rating_r_${parseNumVoteComment}"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                    </c:if>
                                                                        </div>
                                                                        <div class="comment_time ml-auto"><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${y.getReviewCommentDate()}"/></div>
                                                                    </div>
                                                                    <div class="comment_text">
                                                                        <p>${y.getReviewCommentContent()}</p>
                                                                    </div>
                                                                    <div class="comment_extras d-flex flex-row align-items-center justify-content-start">
                                                                        <!-- Role: Student, Tutor, Admin (Can reply)-->
                                                                        <c:if test="${student != null || tutor != null || admin != null}">
                                                                            <div class="comment_extra comment_reply">
                                                                                <form action="${path}/course/review/transaction" method="post">
                                                                                    <input name="txtStatus" value="1" hidden=""/>
                                                                                    <input name="txtReviewCommentID" value="${y.getReviewCommentID()}" hidden=""/>
                                                                                    <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                                    <button style="border-radius: 15px; width: 60px; height: 25px; border: 1px solid white; background-color: white;">
                                                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                                                        <span>Reply</span>
                                                                                    </button>
                                                                                </form>
                                                                            </div>  
                                                                        </c:if>

                                                                        <!-- Role: Tutor, Admin (Can delete, update all comment)-->
                                                                        <!-- Edit -->
                                                                        <c:if test="${tutor != null || admin != null}">
                                                                            <div class="comment_extra comment_reply" style="margin-left: 70%;">
                                                                                <form action="${path}/course/review/transaction" method="post">
                                                                                    <input name="txtStatus" value="2" hidden=""/>
                                                                                    <input name="txtReviewCommentID" value="${y.getReviewCommentID()}" hidden=""/>
                                                                                    <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                                    <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                            <!-- Delete -->
                                                                            <div class="comment_extra comment_reply" style="margin-left: 10px;">
                                                                                <form action="${path}/course/review/comment" method="post">
                                                                                    <input name="txtStatus" value="3" hidden=""/>
                                                                                    <input name="txtReviewCommentID" value="${y.getReviewCommentID()}" hidden=""/>
                                                                                    <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                                    <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>       
                                                                        </c:if>

                                                                        <!-- Role: Student (can Delete Update their comment) -->
                                                                        <c:if test="${student.getUserID() == ReviewDAO.getReviewByReviewFeedbackID(x.getReviewFeedbackID()).getUserID()}">
                                                                            <!-- Edit -->
                                                                            <div class="comment_extra comment_reply" style="margin-left: 70%;">
                                                                                <form action="${path}/course/review/transaction" method="post">
                                                                                    <input name="txtStatus" value="2" hidden=""/>
                                                                                    <input name="txtReviewFeedbackID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                                    <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                                    <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div>

                                                                            <!-- Delete -->
                                                                            <div class="comment_extra comment_reply" style="margin-left: 10px;">
                                                                                <form action="${path}/course/review/comment" method="post">
                                                                                    <input name="txtStatus" value="3" hidden=""/>
                                                                                    <input name="txtReviewCommentID" value="${x.getReviewFeedbackID()}" hidden=""/>
                                                                                    <input name="txtCourseID" value="${Course.getCourseID()}" hidden=""/>
                                                                                    <button style="width: 15px; height: 25px; border: 1px solid white; background-color: white;">
                                                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                                                    </button>
                                                                                </form>
                                                                            </div> 
                                                                        </c:if>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                    <c:choose>
                                        <c:when test="${student != null || tutor != null || admin != null}">
                                            <div class="add_comment_container">
                                                <div class="add_comment_title">Write a comment</div>
                                                <form action="${path}/course/review/feedback" class="comment_form" method="post">
                                                    <div>
                                                        <div class="form_title">Review*</div>
                                                        <textarea class="comment_input comment_textarea" required="required" name="txtReview"></textarea>
                                                    </div>
                                                    <input type="hidden" name="txtStatus" value="1"/>
                                                    <input type="hidden" name="txtVoteStatus" value="0"/>
                                                    <input type="hidden" name="txtCourseID" value="${Course.getCourseID()}"/>
                                                    <div>
                                                        <button type="submit" class="comment_button trans_200">submit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="add_comment_container">
                                                <div class="add_comment_title">Add a review</div>
                                                <div class="add_comment_text">You must be <a href="${path}/user/login">logged</a> in to post a comment.</div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Course Sidebar -->
            <div class="col-lg-4">
                <div class="sidebar">

                    <!--------- Feature --------------------------------------------------------------------------------------->
                    <div class="sidebar_section">
                        <div class="sidebar_section_title">Course Feature</div>
                        <div class="sidebar_feature">
                            <!--Check course publish-->
                            <c:if test="${student ne null}">
                                <c:if test="${Course.getPublishStatus() eq 1}">
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
                                            <input value="${6789}" name="status" hidden></input>
                                            <button class="btn btn-primary btn-lg" type="submit" value="${Course.getCourseID()}" name="courseId">
                                                Go to Course
                                            </button> 

                                        </form>
                                    </c:if>
                                </c:if>
                                <c:if test="${Course.getPublishStatus() eq 0}"><h2 style="color: red">Updating</h2></c:if>

                            </c:if>
                            <c:if test="${admin ne null}">
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
                                        <input value="${6789}" name="status" hidden></input>
                                        <button class="btn btn-primary btn-lg" type="submit" value="${Course.getCourseID()}" name="courseId">
                                            Go to Course
                                        </button> 

                                    </form>
                                </c:if>
                            </c:if>
                            <c:if test="${admin eq null and student eq null and tutor eq null}">
                                <div  style="font-size:17px;background-color: #14bdee;width: 150px;padding: 15px;border-radius: 15px;margin: 10px">
                                    <a style="color: white" href="${path}/user/login">
                                         Sign In to Enroll
                                    </a>
                                </div>
                            </c:if>


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

                            <c:forEach items="${CoursesDAO.getFewLatestCourseWithStatus(5, 1)}" var="x">
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