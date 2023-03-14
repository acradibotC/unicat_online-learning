<%@include file="template/headerAdmin.jsp" %>            

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >User Manager</h2>
    <div class="table-responsive table--no-card m-b-40">

        <table class="table table-borderless table-striped table-earning">
            <thead style="background-color: #0092ef">
            <input type="search" name="txtNameSearch" value="${NameSearch}" class="courses_search_input" placeholder="Search">
            <button action="submit" class="courses_search_button ml-auto">search</button>
            <tr>               
                <th>Full Name</th>                
                <th>Gmail</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Role</th>                                                   
                <th>Profile</th>
                <th>Ban</th>

            </tr>
            </thead>
            <tbody>
                <c:forEach items="${UserDAO.getAllUser()}" var="x">
                    <tr>

                            
                        <th>${x.getFullName()}</th>
                        
                        <th>${x.getEmail()}</th>
                        <th>${x.getPhone()}</th>
                        <th>${x.getDob()}</th>
                        <th>${UserRoleDAO.getRoleNameByRoleID(x.getRoleID())}</th>


                        <th><a href="${path}/admin/manager/user?ViewUserID=${x.getUserID()}">View Profile</th> 
                            <c:if test="${x.getStatus() eq 1}">
                            <th><a href="${path}/delete?uid=${x.getUserID()}">Ban User</a></th>
                            </c:if>
                            <c:if test="${x.getStatus() eq 0}">
                            <th><a href="${path}/delete?uid=${x.getUserID()}">Un Ban User</a></th>
                            </c:if>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>  