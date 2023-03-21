/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.course;

import static com.unicat.onlinelearning.controller.course.Course_Manager.CategoryDAO;
import static com.unicat.onlinelearning.controller.course.Course_Manager.CoursesDAO;
import static com.unicat.onlinelearning.controller.course.Course_Manager.UserDAO;
import static com.unicat.onlinelearning.controller.course.Course_Manager.UserRoleDAO;
import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.unicat.onlinelearning.dto.Course;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet("/admin/manager/request")
public class Course_Request extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();

    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDAO CategoryDAO = new CategoryDAO();
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserRoleDAO", UserRoleDAO);
        req.setAttribute("UserDAO", UserDAO);
        CoursesDAO cd = new CoursesDAO();
        if (req.getSession().getAttribute("admin") != null) {

            String view = req.getParameter("view");
            req.setAttribute("p", view);
            int NumRequest = cd.getAllRequestPublishCourse().size() + cd.getAllRequestUnPublishCourse().size();
            ArrayList<com.unicat.onlinelearning.dto.Course> listpublish = cd.getAllRequestPublishCourse();
            ArrayList<com.unicat.onlinelearning.dto.Course> listunpublish = cd.getAllRequestUnPublishCourse();
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
                    resp.sendRedirect(req.getContextPath() + "/admin/manager/request?view=RequestPublish");
                }
            }
        } else {

            resp.sendRedirect(req.getContextPath() + "/home");

        }

    }

}
