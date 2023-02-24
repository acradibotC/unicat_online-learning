package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course")
public class Course extends HttpServlet{

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserDAO UserDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 3);
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserDAO", UserDAO);
        int CourseID;
        try {
            CourseID = Integer.parseInt(req.getParameter("CourseID"));
            if (CourseID < 1) 
                throw new Exception();
            if (CourseID > CoursesDAO.getAllCourse().size())
                CourseID = CoursesDAO.getAllCourse().size();
        } catch (Exception e) {
            CourseID = 1;
        }
        com.unicat.onlinelearning.dto.Course Course = CoursesDAO.getCourseByCourseID(CourseID);
        req.setAttribute("Course", Course);
        
        
        req.getRequestDispatcher("/course.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
}
