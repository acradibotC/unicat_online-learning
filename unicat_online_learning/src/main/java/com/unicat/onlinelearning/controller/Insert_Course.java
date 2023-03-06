/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author User
 */
@WebServlet("/admin/manager/add")
public class Insert_Course extends HttpServlet{
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int CategoryID  = Integer.parseInt(req.getParameter("categoryID"));
        String CourseName = req.getParameter("CourseName");
        String CourseImage = req.getParameter("CourseImage");
        String CourseInfo = req.getParameter("CourseInf");
        String CourseDescription = req.getParameter("CourseDescription");
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("tutor");
        int UserID = u.getUserID();
        int PublishStatus = 0;
        if (CourseName.length() == 0) {
            resp.getWriter().print("<h3> The course's name must not be empty!");
            req.getRequestDispatcher("InsertCourse.jsp").include(req, resp);
            return;
        }
        if (CourseImage.length() == 0) {
            resp.getWriter().print("<h3> The course's Image must not be empty!");
            req.getRequestDispatcher("InsertCourse.jsp").include(req, resp);
            return;
        }
        if (CourseInfo.length() == 0) {
            resp.getWriter().print("<h3> The courseInf must not be empty!");
            req.getRequestDispatcher("InsertCourse.jsp").include(req, resp);
            return;
        }
        if (CourseDescription.length() == 0) {
            resp.getWriter().print("<h3>The courseDescrition must not be empty!");
            req.getRequestDispatcher("InsertCourse.jsp").include(req, resp);
            return;
        }
        CoursesDAO.insertCourse(CategoryID, CourseName, CourseImage, UserID, CourseInfo, CourseDescription, PublishStatus);
        resp.sendRedirect(req.getContextPath() + "/admin/manager");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.getRequestDispatcher("/InsertCourse.jsp").forward(req, resp);
    }
    
    
}
