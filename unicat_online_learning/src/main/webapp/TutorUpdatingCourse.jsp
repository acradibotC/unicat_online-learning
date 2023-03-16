<%@include file="template/headerAdmin.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Course Published</h2>
    <div class="col-lg-8" style="padding-bottom: 15px">
    </div>    
    <div style="color: red;margin-left: 5%;margin-bottom: 4%">${Notify}</div>
    <c:remove var="Notify" scope="session" />
    <div class="table-responsive table--no-card m-b-40">
        <!-- Role: Tutor -->
        <c:if test="${tutor != null}">
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef">
                    <tr>

                        <th>Category</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Status</th>
                        <th>Request</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr>

                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}"/></th>

                            <th>Published</th>
                            <th>
                                <form action="${path}/tutor/manager/course" method="post">
                                    <input type="hidden" name="Request" value="RequestPublish" />
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="background-color: #cd2737;border-radius: 10px;margin: 5px;padding: 10px" type="submit">Request Publish</button>
                                </form>
                            </th>
                            <th>
                                <a style="background-color:  #14bdee;border-radius: 10px;margin: 5px;padding:10px 25px;color: black" 
                                   href="${path}/tutor/manager/course?page=view&CourseID=${x.getCourseID()}">
                                    View
                                </a>

                            </th>                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>
