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
                <th>Gmaill</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Role</th>                                                   
                <th>Profile</th>
                <th>Ban</th>

            </tr>
            </thead>
            <tbody>
                <c:forEach items="${UserDAO.getAllUserExceptAdmin()}" var="x">
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
    </div>
</div>

<%@include file="template/footerAdmin.jsp" %>  