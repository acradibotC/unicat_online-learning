package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tutor/manager/course/add")
public class Course_Manager_Insert_Transaction extends HttpServlet {

    public static CategoryDAO CategoryDAO = new CategoryDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CoursesDAO cd=new CoursesDAO();
        User user=(User)req.getSession().getAttribute("tutor");
        com.unicat.onlinelearning.dto.Course c = new com.unicat.onlinelearning.dto.Course();
        int CategoryID = Integer.parseInt(req.getParameter("txtCategoryID"));
        c.setCategoryID(CategoryID);
        c.setUserID(user.getUserID());
        c.setName(req.getParameter("txtCourseName"));
        c.setImage(req.getParameter("txtCourseImage"));
        c.setCourseInfo(req.getParameter("txtCourseInf"));
        c.setDescription(req.getParameter("txtCourseDescription"));
        c.setPublishStatus(0);
        c.setRequest("Updating");
        cd.AddnewCourse(c);
        com.unicat.onlinelearning.dto.Course course = cd.getLastCourseCreatedByUserID(user.getUserID());
        resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + course.getCourseID());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("p", "AddCourse");
        req.getRequestDispatcher("/course_manager_insert_transaction.jsp").forward(req, resp);
    }

}
