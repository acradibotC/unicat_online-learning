/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.LessonDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/manager/lesson")
public class Lesson_Manager extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();
    public static LessonDAO LessonDAO = new LessonDAO();

//    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("tutor") != null || req.getSession().getAttribute("admin") != null) {
            req.setAttribute("CoursesDAO", CoursesDAO);
            req.setAttribute("CategoryDAO", CategoryDAO);
            req.setAttribute("UserRoleDAO", UserRoleDAO);
            req.setAttribute("UserDAO", UserDAO);
            req.setAttribute("LessonDAO", LessonDAO);

            req.getRequestDispatcher("/LessonManager.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = null;
        if (req.getSession().getAttribute("tutor") != null) {
            user = (User) req.getSession().getAttribute("tutor");
            int courseID = Integer.parseInt(req.getParameter("txtCourseID"));
            Lesson lesson = LessonDAO.getLastLessonNum(courseID);
            // Insert 
            if (req.getParameter("txtStatus").equalsIgnoreCase("1")) {
                LessonDAO.insertLesson(new Lesson(0, lesson.getLessonNum() + 1, courseID, req.getParameter("txtLessonName"), 
                        req.getParameter("txtLessonTitle"), req.getParameter("txtLessonDescription"), req.getParameter("txtLessonVideo")));
                
                resp.sendRedirect(req.getContextPath() + "/admin/manager/lesson");
            }

            // Update 
            if (req.getParameter("txtStatus").equalsIgnoreCase("2")) {
                com.unicat.onlinelearning.dto.Lesson lesson1 = LessonDAO.getLessonByLessonID(Integer.parseInt(req.getParameter("txtLessonID")));
                lesson.setLessonNum(Integer.parseInt(req.getParameter("txtLessonNum")));
                lesson.setCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
                lesson.setName(req.getParameter("txtName"));
                lesson.setTitle(req.getParameter("txtTitle"));
                lesson.setDescription(req.getParameter("txtDescription"));
                lesson.setVideo(req.getParameter("txtVideo"));
                LessonDAO.updateLesson(lesson);
                resp.sendRedirect(req.getContextPath() + "/admin/manager/lesson");
            }

            // Delete 
            if (req.getParameter("txtStatus").equalsIgnoreCase("3")) {
                LessonDAO.deleteLessonByLessonID(Integer.parseInt(req.getParameter("txtCourseID")));
                resp.sendRedirect(req.getContextPath() + "/admin/manager/lesson");
            }
        }
    }
}
