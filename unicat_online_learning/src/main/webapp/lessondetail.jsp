<%@include file="template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="styles/contact.css">
<link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">


<!-- Home -->
<div class="home">
    <div class="breadcrumbs_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs">
                        <ul>
                            <li><a href="${path}/home">Home</a></li>
                            <li>LessonDetail</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</div>

${toastMsg}

<!-- Video -->


<div class="container">
    <div class="row row-deck" style="display: flex">
        <!-- Your content goes here -->
        <!-- Your content goes here -->
        <div class="col-md-9">
            <h1>${courseName}</h1>
            <div class="embed-responsive embed-responsive-16by9">
                ${currentLesson.getVideo()}
            </div>
        </div>

        <div class="col-md-3">
            <h1>Lessons</h1>
            <div class="gallery_item" style="max-height: 500px; overflow-y:auto;-webkit-overflow-scrolling: touch;">
                <c:forEach items="${list}" var="o">
                    <!--<a class="dropdown-item" href="LessonDetail?Id=${o.getLessonNum()}">${o.getLessonNum()}. ${o.getName()}</a>-->
                    <div class="list-group">
                        <a  class="list-group-item list-group-item-action border-white
                            ${o.getLessonNum() > CourseEnroll.getLessonCurrent() ? "btn disabled":""}
                            ${o.getLessonNum() == currentLessonNum ? "active":""}"
                            href="LessonDetail?Id=${o.getLessonNum()}&status=${-1}">
                            <c:if test="${o.getLessonNum() > CourseEnroll.getLessonCurrent()}">
                                <i class="bi bi-lock-fill" style="color: #efc760"></i>
                            </c:if>
                            <c:if test="${o.getLessonNum() < CourseEnroll.getLessonCurrent()}">
                                <i class="bi bi-check-circle-fill" style="color: #6aa84f"></i>
                            </c:if>
                            ${o.getLessonNum()}. ${o.getName()}
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <h2>${currentLesson.getTitle()}</h2>
        <br>
        <div class="col-md-8">
            <h4>${currentLesson.getDescription()}
            </h4>
        </div>
        <div class="col-md-4">
            <div>
                <a id="invokesToastMessage"  class="btn btn-success" href="LessonDetail?Id=${nextLessonNum}&status=${rand.nextInt(10000)}">Done</a>
            </div>
        </div>

    </div>
</div>

</div>
<%@include file="template/footer.jsp" %>
