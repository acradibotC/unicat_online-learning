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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int courseId = Integer.parseInt(req.getParameter("courseId"));
        User user = (User) req.getSession().getAttribute("student");
        ArrayList<Lesson> Lessons = lessonDAO.getAllLessonByCourseID(courseId);
        CourseEnroll CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());

        req.getSession().setAttribute("courseId", courseId);
        int currentLessonNum = CourseEnroll.getLessonCurrent();
        Lesson currentLesson = lessonDAO.getLesson(currentLessonNum, courseId);
        int totalLesson = Lessons.size() - 1;
        
        req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(courseId).getName());
        req.setAttribute("list", Lessons);
        req.setAttribute("currentLesson", currentLesson);
        req.setAttribute("currentLessonNum", currentLessonNum);
        req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lessonNum = Integer.parseInt(req.getParameter("Id"));
        User user = (User) req.getSession().getAttribute("student");
        int courseId = (int) req.getSession().getAttribute("courseId");
        String toastMsg = "";
        if (req.getParameter("status").isEmpty()) {
            int done = CoursesDAO.doneCurrentLesson(user.getUserID(), courseId, lessonNum);
            toastMsg = "You have done lesson" + lessonNum;
        }

        ArrayList<Lesson> Lessons = lessonDAO.getAllLessonByCourseID(courseId);
        CourseEnroll CourseEnroll = CoursesDAO.GetCourseEnrolledByUserID(courseId, user.getUserID());

        req.getSession().setAttribute("courseId", courseId);
        int currentLessonNum = CourseEnroll.getLessonCurrent();
        Lesson currentLesson = lessonDAO.getLesson(currentLessonNum, courseId);
        int totalLesson = Lessons.size() - 1;

        req.setAttribute("courseName", CoursesDAO.getCourseByCourseID(courseId).getName());
        req.setAttribute("list", Lessons);
        req.setAttribute("currentLesson", currentLesson);
        req.setAttribute("currentLessonNum", currentLessonNum);
        req.setAttribute("toastMsg", toastMsg);
        req.getRequestDispatcher("lessondetail.jsp").forward(req, resp);

    }

   
}
