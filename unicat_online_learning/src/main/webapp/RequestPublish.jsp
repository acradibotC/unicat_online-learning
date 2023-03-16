<%@include file="template/headerAdmin.jsp" %>
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Request Publish</h2>
    <div class="col-lg-8" style="padding-bottom: 20px">
        <c:if test="${admin ne null}">
            <a style="padding: 20px;border-radius: 15px;background-color:
               <c:if test="${p eq 'RequestPublish'}">
                   #14bdee;color: black
               </c:if>
               <c:if test="${p ne 'RequestPublish' and listpublish.size() ne 0}">
                   #cd2737;color: white
               </c:if>
               "  
               href="${path}/admin/manager/request?view=RequestPublish">
                <div style="" >
                    Request Publish <c:if test="${listpublish.size() ne 0}">(${listpublish.size()})</c:if>
                    </div>
                </a>

                <a style="padding: 20px;border-radius: 15px;background-color:
                <c:if test="${p eq 'RequestUnPublish'}">
                    #14bdee;color: black
                </c:if>
                <c:if test="${p ne 'RequestUnPublish' and listunpublish.size() ne 0}">
                    #cd2737;color: white
                </c:if>
                " 
                href="${path}/admin/manager/request?view=RequestUnPublish">
                <div style="">
                    Request Un-Publish <c:if test="${listunpublish.size() ne 0}">(${listunpublish.size()})</c:if>
                    </div>
                </a>
        </c:if>
        <c:if test="${tutor ne null}">
            <a style="padding: 20px;border-radius: 15px;background-color:
               <c:if test="${p eq 'RequestPublish'}">
                   #14bdee;color: black
               </c:if>
               <c:if test="${p ne 'RequestPublish' and listpublish.size() ne 0}">
                   #cd2737;color: white
               </c:if>
               "  
               href="${path}/tutor/manager/request?view=RequestPublish">
                <div style="" >
                    Request Publish <c:if test="${listpublish.size() ne 0}">(${listpublish.size()})</c:if>
                    </div>
                </a>

                <a style="padding: 20px;border-radius: 15px;background-color:
                <c:if test="${p eq 'RequestUnPublish'}">
                    #14bdee;color: black
                </c:if>
                <c:if test="${p ne 'RequestUnPublish' and listunpublish.size() ne 0}">
                    #cd2737;color: white
                </c:if>
                " 
                href="${path}/tutor/manager/request?view=RequestUnPublish">
                <div style="">
                    Request Un-Publish <c:if test="${listunpublish.size() ne 0}">(${listunpublish.size()})</c:if>
                    </div>
                </a>
        </c:if>
    </div> 
</div>    


<div class="table-responsive table--no-card m-b-40">

    <!-- Role: Admin -->
    <c:if test="${admin != null}">
        <table class="table table-striped table-earning table-bordered">
            <thead style="background-color: #0092ef">
                <tr>

                    <th>Category</th>
                    <th>Course Name</th>
                    <th>Course Image</th>
                    <th>Course Creator</th>
                    <th>Action</th>
                    <th>Reference</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listpublish}" var="x">
                    <tr>

                        <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                        <th>${x.getName()}</th>
                        <th><img class="image" src="${x.getImage()}" /></th>
                        <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                        <th>
                            <c:if test="${x.getPublishStatus() == 0}">
                                <form action="${path}/admin/manager/course" method="post">
                                    <input name="txtStatusPublish" value="Publish" type="hidden"/>
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}" />
                                    <button class="btn btn-primary" type="submit">Publish</button>
                                </form>
                            </c:if>         
                            <c:if test="${x.getPublishStatus() == 1}">
                                <form action="${path}/admin/manager/course" method="post">
                                    <input name="txtStatusPublish" value="UnPublish" type="hidden"/>
                                    <input type="hidden" name="txtCourseID" value="${x.getCourseID()}" />
                                    <button class="btn btn-danger" type="submit">Un-publish</button>
                                </form>
                            </c:if>
                            <form action="${path}/admin/manager/course" method="post">
                                <input name="txtStatusPublish" value="CancelPublish" type="hidden"/>
                                <input name="Role" value="Admin" type="hidden"/>
                                <input type="hidden" name="txtCourseID" value="${x.getCourseID()}" />
                                <button style="margin: 10px;padding: 7px 14px" class="btn btn-danger" type="submit">Cancel</button>
                            </form>
                        </th>
                        <th><a class="btn btn-info" href="${path}/course?CourseID=${x.getCourseID()}">
                                Go to Course</a> </th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </c:if>
    <c:if test="${tutor != null}">
        <table class="table table-striped table-earning table-bordered">
            <thead style="background-color: #0092ef">
                <tr>

                    <th>Category</th>
                    <th>Course Name</th>
                    <th>Course Image</th>
                    <th>Course Creator</th>
                    <th>Action</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listpublish}" var="x">
                    <tr>

                        <th>${CategoryDAO.getCategoryNameByCategoryID(x.getCategoryID())}</th>
                        <th>${x.getName()}</th>
                        <th><img class="image" src="${x.getImage()}" /></th>
                        <th>${UserDAO.getUserByUserID(x.getUserID()).getFullName()}</th>
                        <th>

                            <form action="${path}/admin/manager/course" method="post">
                                <input name="txtStatusPublish" value="CancelPublish" type="hidden"/>
                                <input name="Role" value="Tutor" type="hidden"/>
                                <input type="hidden" name="txtCourseID" value="${x.getCourseID()}" />
                                <button style="margin: 10px;padding: 7px 14px" class="btn btn-danger" type="submit">Cancel Request</button>
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
