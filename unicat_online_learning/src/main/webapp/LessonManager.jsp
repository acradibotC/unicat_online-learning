
<%@include file="template/headerAdmin.jsp" %>

<div class="col-lg-12"style="float: left;padding-top: 30px">
    <h2 class="title-1 m-b-25" >Lesson Manager</h2>

    <div class="courses_search_container">
        <form action="#" id="courses_search_form" class="courses_search_form d-flex flex-row align-items-center justify-content-start">
            <input type="search" class="courses_search_input" placeholder="Search Courses" required="required">
            <select id="courses_search_select" class="courses_search_select courses_search_input">
                <option>All Categories</option>
                <option>Category</option>
                <option>Category</option>
                <option>Category</option>
            </select>
            <button action="submit" class="courses_search_button ml-auto">search now</button>
        </form>
    </div>
    <div class="table-responsive table--no-card m-b-40">
        <div class ="col-lg-3"style="float: right;">
            <a style="color: #fff; background-color: #14bdee; display: block; width: 200px; text-align: center; margin: 0 auto; margin-bottom: 10px; margin-top: 20px" href="InsertLesson.jsp" >Add new Lesson</a>                                  
        </div>
        <table class="table table-borderless table-striped table-earning">
            <thead style="background-color: #0092ef">
                <tr>
                    <th style="width: 70px">Lesson ID</th>
                    <th>Course ID</th>
                    <th>Name</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Video</th>
                    <th style="width: 70px">Delete</th>
                    <th style="width: 70px">Update</th>
                    <th style="width: 70px">View Lesson</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th>1</th>
                    <th>1</th>
                    <th>Anh Bom</th>
                    <th>basic Java</th>
                    <th>How about to learn java</th>
                    <th><img class="image" src=""</img></th>
                    <th> <a href="DeleteCourse?CourseID=">Delete</th>  
                    <th> <a href="UpdateCourse.jsp?CourseID="> Update  </th> 
                    <th> <a href="">View</th> 
                </tr>
            </tbody>
        </table>
    </div>
</div>
<%@include file="template/footerAdmin.jsp" %>

