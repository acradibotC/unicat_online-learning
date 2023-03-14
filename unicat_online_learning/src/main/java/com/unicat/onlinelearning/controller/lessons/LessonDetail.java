/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.lessons;

import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.LessonDAO;
import com.unicat.onlinelearning.dto.Course;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Anhnt206
 */
@WebServlet("/LessonDetail")
public class LessonDetail extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static LessonDAO lessonDAO = new LessonDAO();
    public static SecureRandom rand = new SecureRandom();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int courseId = Integer.parseInt(req.getParameter("courseId"));
        User user = (User) req.getSession().getAttribute("student");
        if (req.getSession().getAttribute("admin") != null) {
            user = (User) req.getSession().getAttribute("admin");
        }
        ArrayList<Lesson> Lessons = lessonDAO.getAllLessonByCourseID(courseId);
        CourseEnroll CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());

        req.getSession().setAttribute("courseId", courseId);
        int currentLessonNum = CourseEnroll.getLessonCurrent();
        int nextLessonNum = currentLessonNum + 1;
        Lesson currentLesson = lessonDAO.getLesson(currentLessonNum, courseId);

        int status = Integer.parseInt(req.getParameter("status"));
        if (status >= 0 && (currentLessonNum > CourseEnroll.getLessonCurrent())) {
            CoursesDAO.doneCurrentLesson(user.getUserID(), courseId, currentLessonNum);
            currentLesson = lessonDAO.getLesson(nextLessonNum, courseId);
            CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());
        }

        req.setAttribute("rand", rand);
        req.setAttribute("User", user);
        req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(courseId).getName());
        req.setAttribute("list", Lessons);
        req.setAttribute("currentLesson", currentLesson);
        req.setAttribute("currentLessonNum", currentLessonNum);
        req.setAttribute("nextLessonNum", nextLessonNum);
        req.setAttribute("CourseEnroll", CourseEnroll);
        req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = (int) req.getSession().getAttribute("courseId");
        try {
            int lessonNum = Integer.parseInt(req.getParameter("Id"));
            User user = (User) req.getSession().getAttribute("student");
            if (req.getSession().getAttribute("admin") != null) {
                user = (User) req.getSession().getAttribute("admin");
            }
            

            ArrayList<Lesson> Lessons = lessonDAO.getAllLessonByCourseID(courseId);
            CourseEnroll CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());

            req.getSession().setAttribute("courseId", courseId);

            int currentLessonNum = lessonNum;
            int nextLessonNum = currentLessonNum + 1;

            Lesson currentLesson = lessonDAO.getLesson(lessonNum, courseId);
            if (lessonNum > Lessons.size()) {
                currentLesson = lessonDAO.getLesson(Lessons.size(), courseId);
                currentLessonNum = Lessons.size();
                nextLessonNum = currentLessonNum;
            }
            int status = Integer.parseInt(req.getParameter("status"));

            if (status >= 0 && (currentLessonNum > CourseEnroll.getLessonCurrent())) {
                CoursesDAO.doneCurrentLesson(user.getUserID(), courseId, currentLessonNum);
                currentLesson = lessonDAO.getLesson(nextLessonNum, courseId);
                CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());

            }

            req.setAttribute("rand", rand);
            req.setAttribute("User", user);
            req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(courseId).getName());
            req.setAttribute("list", Lessons);
            req.setAttribute("currentLesson", currentLesson);
            req.getSession().setAttribute("currentLessonNum", currentLessonNum);
            req.setAttribute("currentLessonNum", currentLessonNum);
            req.setAttribute("nextLessonNum", nextLessonNum);
            req.setAttribute("CourseEnroll", CourseEnroll);
            req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);
        } catch (ServletException | IOException | NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + courseId);
        }

    }

}
