<%@include file="template/headerAdmin.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Update Course</h2>
    <div class="col-lg-8" style="padding-bottom: 15px">
    </div>    

    <div class="table-responsive table--no-card m-b-40">
        <!-- Role: Tutor -->

        <c:if test="${tutor != null}">
            <h4 style="margin: 10px;padding: 10px;background-color: background;border-radius: 10px">Updating Course</h4>
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef;text-align: center">
                    <tr>

                        <th>Category</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Status</th>
                        <th>Request</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${list}" var="x">
                        <tr>

                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}"/></th>

                            <th>Un-Published</th>
                            <th>
                                <form action="${path}/tutor/manager/course" method="post">
                                    <input type="hidden" name="Request" value="RequestPublish" />
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="background-color: #cd2737;border-radius: 10px;margin: 5px;padding: 10px" type="submit">Request Publish</button>
                                </form>
                            </th>
                            <th>
                                <a style="background-color:  #ffeb3b;border-radius: 10px;margin: 5px;padding:10px 25px;color: black" 
                                   href="${path}/tutor/manager/course?page=view&CourseID=${x.getCourseID()}">
                                    Update
                                </a>

                            </th>                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h4 style="margin: 10px;padding: 10px;background-color: background;border-radius: 10px">New Created Course</h4>
            <table class="table table-borderless table-striped table-earning">
                <thead style="background-color: #0092ef;text-align: center">
                    <tr>

                        <th>Category</th>
                        <th>Course Name</th>
                        <th>Course Image</th>
                        <th>Status</th>
                        <th>Request</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${listcnew}" var="x">
                        <tr>

                            <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                            <th>${x.getName()}</th>
                            <th><img class="image" src="${x.getImage()}"/></th>

                            <th>Un-Published</th>
                            <th>
                                <form action="${path}/tutor/manager/course" method="post">
                                    <input type="hidden" name="Request" value="RequestPublish" />
                                    <input type="hidden" name="NowPage" value="UpdatePage" />
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="background-color: #cd2737;border-radius: 10px;margin: 5px;padding: 10px" type="submit">Request Publish</button>
                                </form>

                            </th>
                            <th>
                                <a style="background-color:  #ffeb3b;border-radius: 10px;margin: 5px;padding:10px 25px;color: black" 
                                   href="${path}/tutor/manager/course?page=view&CourseID=${x.getCourseID()}">
                                    Update
                                </a>
                                <form action="${path}/tutor/manager/course" method="post">
                                    <input type="hidden" name="Request" value="Delete" />
                                    <input type="hidden" name="NowPage" value="UpdatePage" />
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}"/>
                                    <button class="btn btn-secondary btn-sm" style="background-color: #cd2737;border-radius: 10px;margin: 5px;padding: 10px" type="submit">Delete</button>
                                </form>
                            </th>                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>
