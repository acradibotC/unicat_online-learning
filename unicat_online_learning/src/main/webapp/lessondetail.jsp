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
    <!-- Your content goes here -->
    <div class="row">
        <!-- Your content goes here -->
        <div class="col-md-9">
            <h1>${courseName}</h1>
            <div class="embed-responsive embed-responsive-16by9">
                ${currentLesson.getVideo()}
            </div>
        </div>
        <div class="col-md-3">
            <h1>Lessons</h1>
            <ul class="navbar-nav me-auto">
                <li class="nav-item dropdown">
                    <div>
                        <c:forEach items="${list}" var="o">
                            <!--<a class="dropdown-item" href="LessonDetail?Id=${o.getLessonNum()}">${o.getLessonNum()}. ${o.getName()}</a>-->
                            <div class="list-group">
                                <a  class="list-group-item list-group-item-action ${o.getLessonNum() <= currentLessonNum ? "": ""}" href="LessonDetail?Id=${o.getLessonNum()}">${o.getLessonNum()}. ${o.getName()}</a>
                            </div>
                        </c:forEach>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="container">
        <div class="row-">
            <h2>${currentLesson.getTitle()}</h2>
            <br>
            <div class="col-md-8">
                <h4>${currentLesson.getDescription()}
                </h4>
            </div>
            <div class="col-md-4">
                <div >
                    <a id="invokesToastMessage"  class="btn btn-success" href="LessonDetail?Id=${currentLessonNum + 1}&?status=done">Done</a>
                </div>
            </div>

        </div>
    </div>


</div>
<%@include file="template/footer.jsp" %>
