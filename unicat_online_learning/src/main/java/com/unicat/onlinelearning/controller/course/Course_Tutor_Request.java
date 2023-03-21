/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.course;

import static com.unicat.onlinelearning.controller.course.Course_Request.CoursesDAO;
import static com.unicat.onlinelearning.controller.course.Course_Request.UserDAO;
import static com.unicat.onlinelearning.controller.course.Course_Request.UserRoleDAO;
import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
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
 * @author Admin
 */
@WebServlet("/tutor/manager/request")
public class Course_Tutor_Request extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();

    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        CategoryDAO CategoryDAO = new CategoryDAO();
        CoursesDAO cd = new CoursesDAO();
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserRoleDAO", UserRoleDAO);
        req.setAttribute("UserDAO", UserDAO);
        if (req.getSession().getAttribute("tutor") != null) {
            User u = (User) req.getSession().getAttribute("tutor");
            String view = req.getParameter("view");
            req.setAttribute("p", view);
            int NumRequest = cd.getTutorRequestPublishCourse(u.getUserID()).size() + cd.getTutorRequestUnPublishCourse(u.getUserID()).size();
            ArrayList<com.unicat.onlinelearning.dto.Course> listpublish = cd.getTutorRequestPublishCourse(u.getUserID());
            ArrayList<com.unicat.onlinelearning.dto.Course> listunpublish = cd.getTutorRequestUnPublishCourse(u.getUserID());
            req.setAttribute("listpublish", listpublish);
            req.setAttribute("listunpublish", listunpublish);
            req.setAttribute("NumRequest", NumRequest);
            req.setAttribute("CategoryDAO", CategoryDAO);
            if (view.equals("RequestPublish")) {

                req.getRequestDispatcher("/RequestPublish.jsp").forward(req, resp);
            } else {
                if (view.equals("RequestUnPublish")) {

                    req.getRequestDispatcher("/RequestUnPublish.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/request?view=RequestPublish");
                }
            }
        } else {

            resp.sendRedirect(req.getContextPath() + "/home");

        }
    }

}
