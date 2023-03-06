package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.ReviewCommentsDAO;
import com.unicat.onlinelearning.dao.ReviewDAO;
import com.unicat.onlinelearning.dao.ReviewFeedbackDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course")
public class Course extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static ReviewFeedbackDAO ReviewFeedbackDAO = new ReviewFeedbackDAO();
    public static ReviewDAO ReviewDAO = new ReviewDAO();
    public static ReviewCommentsDAO ReviewCommentsDAO = new ReviewCommentsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 3);
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("ReviewFeedbackDAO", ReviewFeedbackDAO);
        req.setAttribute("ReviewCommentsDAO", ReviewCommentsDAO);
        req.setAttribute("ReviewDAO", ReviewDAO);
        int CourseID;
        try {
            CourseID = Integer.parseInt(req.getParameter("CourseID"));
            if (CourseID < 1) {
                throw new Exception();
            }
            if (CourseID > CoursesDAO.getAllCourse().size()) {
                CourseID = CoursesDAO.getAllCourse().size();
            }
        } catch (Exception e) {
            CourseID = 1;
        }
        com.unicat.onlinelearning.dto.Course Course = CoursesDAO.getCourseByCourseID(CourseID);
        req.setAttribute("Course", Course);
        CourseEnroll ce = null;
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            CoursesDAO cd = new CoursesDAO();
            ce = cd.GetCourseEnrolledByUserID(CourseID, u.getUserID());
            req.setAttribute("ce", ce);
            req.setAttribute("User", u);
        }
        req.getRequestDispatcher("/course.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int CourseID = Integer.parseInt(req.getParameter("cid"));
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            CoursesDAO cd = new CoursesDAO();
            cd.EnrollCoure(u.getUserID(), CourseID);
            resp.sendRedirect(req.getContextPath() + "/course?CourseID="+CourseID);
        }
    }

}
