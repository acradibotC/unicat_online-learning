/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import static com.unicat.onlinelearning.controller.course.Course_Manager.CoursesDAO;
import static com.unicat.onlinelearning.controller.user.ProfileController.lessonDAO;
import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/manager/user")
public class Manager_User extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("admin") != null) {
            req.setAttribute("UserDAO", UserDAO);
            req.setAttribute("CategoryDAO", CategoryDAO);
            req.setAttribute("UserRoleDAO", UserRoleDAO);
            String str = req.getParameter("ViewUserID");
            if (req.getParameter("ViewUserID") != null) {
                int ID = Integer.parseInt(str);
                User u = UserDAO.getUserByUserID(ID);

                ArrayList<CourseEnroll> ce = UserDAO.getAllCourseOfUser(ID);
                req.setAttribute("User", u);
                req.setAttribute("listcourseenroll", ce);
                req.setAttribute("LessonDAO", lessonDAO);

                req.getRequestDispatcher("/UserDetails.jsp").forward(req, resp);
            } else {
                int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();
                req.setAttribute("NumRequest", NumRequest);
                req.setAttribute("p", "usermanager");
                req.getRequestDispatcher("/ManagerUser.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
