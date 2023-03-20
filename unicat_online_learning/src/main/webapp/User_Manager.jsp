<%@include file="template/headerAdmin.jsp" %>            
<link rel="stylesheet" type="text/css" href="${path}/styles/pagination.css">

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >User Manager</h2>
    <!-- Search -->
    <div class="col-lg-8" style="padding-bottom: 20px">
        <div class="courses_search_container">
            <form action="${path}/admin/manager/user/search" method="post" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
                <input type="search" name="txtNameSearch" value="${NameSearch}" class="courses_search_input" placeholder="Search">
                <button action="submit" class="courses_search_button ml-auto">search</button>
            </form>
        </div>
    </div>
    <!-- End Search-->

    <div class="table-responsive table--no-card m-b-40">

        <table class="table table-bordered table-striped table-earning">
            <thead style="background-color: #0092ef">

                <tr>               
                    <th>Full Name</th>                
                    <th>Email</th>
                    <th>Phone</th>
                    <th>DOB</th>
                    <th>Role</th>                                                   
                    <th>Profile</th>
                    <th>Ban</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="x">
                    <tr>
                        <th>${x.getFullName()}</th>
                        <th>${x.getEmail()}</th>
                        <th>${x.getPhone()}</th>
                        <th>${x.getDob()}</th>
                        <th>${UserRoleDAO.getRoleNameByRoleID(x.getRoleID())}</th>

                        <th style="text-align: center">
                            <a  href="${path}/admin/manager/user?ViewUserID=${x.getUserID()}">View Profile
                        </th> 

                <form action="${path}/admin/manager/user" method="post">
                    <c:if test="${x.getStatus() eq 1}">
                        <input type="hidden" name="txtStatus" value="Ban"/>     
                        <input type="hidden" name="txtUserID" value="${x.getUserID()}"/>
                        <th style="text-align: center"><button class="btn btn-primary" type="submit">Ban User</button></th>
                        </c:if>
                        <c:if test="${x.getStatus() eq 0}">
                        <input type="hidden" name="txtStatus" value="UnBan"/>     
                        <input type="hidden" name="txtUserID" value="${x.getUserID()}"/>
                        <th style="text-align: center"><button class="btn btn-warning" type="submit">Un Ban User</button></th>
                        </c:if> 
                </form>

                </tr>
            </c:forEach> 
            </tbody>
        </table>

        <!-- Pagination -->
        <c:if test="${allUser.size() > 6}">
            <div class="paginationBlog">
                <c:if test="${page == 1}">
                    <li class="page-itemBlog previous-page BlogDisable"><a class="page-linkBlog" href="">Prev</a></li>
                    </c:if>
                    <c:if test="${page != 1}">
                    <li class="page-itemBlog previous-page"><a class="page-linkBlog" href="${path}/admin/manager/user/paging?page=${page-1}&Name=${NameSearch}">Prev</a></li>
                    </c:if>

                <c:forEach begin="${1}" end="${number}" var="i">    
                    <c:choose>
                        <c:when test="${page == i}">
                            <input type="hidden" name="page" value="${i}" />
                            <li class="page-itemBlog current-page BlogActive"><a class="page-linkBlog" href="${path}/admin/manager/user/paging?page=${i}&Name=${NameSearch}">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                            <input type="hidden" name="page" value="${i}" />
                            <li class="page-itemBlog current-page"><a class="page-linkBlog" href="${path}/admin/manager/user/paging?page=${i}&Name=${NameSearch}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                <c:if test="${page == number}">
                    <li class="page-itemBlog next-page BlogDisable"><a class="page-linkBlog" href="">Next</a></li>
                    </c:if>    
                    <c:if test="${page != number}">
                    <li class="page-itemBlog next-page"><a class="page-linkBlog" href="${path}/admin/manager/user/paging?page=${page+1}&Name=${NameSearch}">Next</a></li>
                    </c:if>    
            </div>
        </c:if>
        <c:if test="${allUser.size() == 0}">
            <div class="paginationBlog">No Items Found!</div>
        </c:if>
        <!-- End Pagination -->

    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>  