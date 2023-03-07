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
import java.io.IOException;

/**
 *
 * @author User
 */
@WebServlet("/admin/manager/update")
public class Update_Course extends HttpServlet{
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
        course.setCategoryID(Integer.parseInt(req.getParameter("txtCategoryID")));
        course.setName(req.getParameter("txtName"));
        course.setImage(req.getParameter("txtCourseImage"));
        course.setCourseInfo(req.getParameter("txtCourseInf"));
        course.setDescription(req.getParameter("txtCourseDescription"));
        CoursesDAO.updateCourse(course);
        //CoursesDAO.updateCourse(CategoryID, CourseName, CourseImage, UserID, CourseInfo, CourseDescription, PublishStatus, CourseID);
        resp.sendRedirect(req.getContextPath() + "/admin/manager");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int CourseID = Integer.parseInt(req.getParameter("CourseID"));
        com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(CourseID);
        req.setAttribute("course", course);
        req.getRequestDispatcher("/UpdateCourse.jsp").forward(req, resp);
    }
    
}
