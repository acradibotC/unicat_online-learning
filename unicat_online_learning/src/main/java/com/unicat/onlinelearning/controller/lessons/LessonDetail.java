/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.lessons;

import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.LessonDAO;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Anhnt206
 */
@WebServlet("/LessonDetail")
public class LessonDetail extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static LessonDAO lessondao = new LessonDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int courseId = Integer.parseInt(req.getParameter("courseId"));
        ArrayList<Lesson> Lessons = lessondao.getAllLessonByCourseID(courseId);
        req.getSession().setAttribute("courseId", courseId);
        int lessonNum = 1;
        Lesson curLesson = lessondao.getLesson(lessonNum, courseId);
        int totalLesson = Lessons.size() - 1;
        String video = Lessons.get(lessonNum - 1).getVideo();
        req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(courseId).getName());
        req.setAttribute("list", Lessons);
        req.setAttribute("curLesson", curLesson);
        req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int CourseID = (int) req.getSession().getAttribute("courseId");
        CourseEnroll ce = null;
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            CoursesDAO cd = new CoursesDAO();
            ce = cd.GetCourseEnrolledByUserID(CourseID, u.getUserID());

        }
        //Check xem user đã enroll khóa chưa
        if (ce == null) {
            resp.sendRedirect(req.getContextPath() + "/course?CourseID="+CourseID);
        } else {
            int lessonNum = Integer.parseInt(req.getParameter("Id"));
            
            ArrayList<Lesson> Lessons = lessondao.getAllLessonByCourseID(CourseID);
            int totalLesson = Lessons.size() - 1;

            Lesson curLesson = lessondao.getLesson(lessonNum, CourseID);

            req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(CourseID).getName());

            req.setAttribute("list", Lessons);
            req.setAttribute("curLesson", curLesson);
            req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);
        }
    }

}
