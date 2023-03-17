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
                                        <div class="tab_panel_subtitle">What is the target audience?</div>
                                        <div class="tab_panel_text">
                                            <p>${Course.getDescription()}</p>
                                        </div>
                                    </div>
                                    <div class="tab_panel_faq">
                                        <div class="tab_panel_title">FAQ</div>

                                        <!-- Accordions -->
                                        <div class="accordions">

                                            <div class="elements_accordions">

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>Can I just enroll in a single course?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lorem ipsun gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center active"><div>I'm not interested in the entire Specialization?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lorem ipsun gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>What is the refund policy?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lorem ipsun gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>What background knowledge is necessary?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lorem ipsun gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a.</p>
                                                    </div>
                                                </div>

                                                <div class="accordion_container">
                                                    <div class="accordion d-flex flex-row align-items-center"><div>Do i need to take the courses in a specific order?</div></div>
                                                    <div class="accordion_panel">
                                                        <p>Lorem ipsun gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a.</p>
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
                                    <div class="tab_panel_title">Software Training</div>
                                    <div class="tab_panel_content">
                                        <div class="tab_panel_text">
                                            <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio.</p>
                                        </div>

                                        <!-- Dropdowns -->
                                        <ul class="dropdowns">
                                            <li class="has_children">
                                                <div class="dropdown_item">
                                                    <div class="dropdown_item_title"><span>Lecture 1:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                    <div class="dropdown_item_text">
                                                        <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                    </div>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <div class="dropdown_item">
                                                            <div class="dropdown_item_title"><span>Lecture 1.1:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                            <div class="dropdown_item_text">
                                                                <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="dropdown_item">
                                                            <div class="dropdown_item_title"><span>Lecture 1.2:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                            <div class="dropdown_item_text">
                                                                <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="has_children">
                                                <div class="dropdown_item">
                                                    <div class="dropdown_item_title"><span>Lecture 2:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                    <div class="dropdown_item_text">
                                                        <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                    </div>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <div class="dropdown_item">
                                                            <div class="dropdown_item_title"><span>Lecture 2.1:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                            <div class="dropdown_item_text">
                                                                <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="dropdown_item">
                                                            <div class="dropdown_item_title"><span>Lecture 2.2:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                            <div class="dropdown_item_text">
                                                                <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <div class="dropdown_item">
                                                    <div class="dropdown_item_title"><span>Lecture 3:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                    <div class="dropdown_item_text">
                                                        <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown_item">
                                                    <div class="dropdown_item_title"><span>Lecture 4:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                    <div class="dropdown_item_text">
                                                        <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown_item">
                                                    <div class="dropdown_item_title"><span>Lecture 5:</span> Lorem Ipsn gravida nibh vel velit auctor aliquet.</div>
                                                    <div class="dropdown_item_text">
                                                        <p>Lorem Ipsn gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auci elit consequat ipsutis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus.</p>
                                                    </div>
                                                </div>
                                            </li>
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
                                                                <div class="rating_r rating_r_${parseNumVote}"><i></i><i></i><i></i><i></i><i></i></div>
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
                                                                        <div class="comment_rating"><div class="rating_r rating_r_${parseNumVoteComment}"><i></i><i></i><i></i><i></i><i></i></div></div>
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