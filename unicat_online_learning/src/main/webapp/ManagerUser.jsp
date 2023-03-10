<%@include file="template/headerAdmin.jsp" %>            

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >User Manager</h2>
    <div class="table-responsive table--no-card m-b-40">

        <table class="table table-borderless table-striped table-earning">
            <thead style="background-color: #0092ef">
            <input type="search" name="txtNameSearch" value="${NameSearch}" class="courses_search_input" placeholder="Search">
            <button action="submit" class="courses_search_button ml-auto">search</button>
            <tr>
                <th style="width: 70px">User ID</th>
                <th>Full Name</th>
                <th>Username</th>
                <th>Gmail</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Role</th>                                                   
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${UserDAO.getAllUser()}" var="x">
                    <tr>
                        <th>${x.getUserID()}</th>
                        <th>${x.getFullName()}</th>
                        <th>${x.getUserName()}</th>
                        <th>${x.getEmail()}</th>
                        <th>${x.getPhone()}</th>
                        <th>${x.getDob()}</th>
                        <th>${UserRoleDAO.getRoleNameByRoleID(x.getRoleID())}</th>
                        <th><a href="UserDetails.jsp">View Profile</th> 
                        <th><a href="${path}/delete?uid=${x.getUserID()}">Ban</a></th>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
    </div>
</div>
            
<%@include file="template/footerAdmin.jsp" %>  