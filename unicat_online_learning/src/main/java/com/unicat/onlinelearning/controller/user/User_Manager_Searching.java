/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.user;

import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author User
 */
@WebServlet("/admin/manager/user/search")
public class User_Manager_Searching extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<com.unicat.onlinelearning.dto.User> allUser = UserDAO.getAllUserSearching(req.getParameter("txtNameSearch"));
        int page, size, numPerPage = 6;

        size = allUser.size();
        int number = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(xpage);
                if (page < 1) {
                    throw new Exception();
                }
                if (page > number) {
                    page = number;
                }
            } catch (Exception e) {
                page = 1;
            }
        }
        int start = (page - 1) * numPerPage;
        int end = Math.min(page * numPerPage, size);
        ArrayList<com.unicat.onlinelearning.dto.User> list;
        if (allUser.isEmpty()) {
            list = null;
        } else {
            list = UserDAO.getListBySearching(allUser, start, end);
        }
        req.setAttribute("list", list);
        req.setAttribute("page", page);
        req.setAttribute("number", number);
        //End Paging

        req.setAttribute("p", "usermanager");
        int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();
        req.setAttribute("NumRequest", NumRequest);
        req.setAttribute("p", "usermanager");

        req.setAttribute("allUser", allUser);
        req.setAttribute("NameSearch", req.getParameter("txtNameSearch"));
        req.setAttribute("UserRoleDAO", UserRoleDAO);

        req.getRequestDispatcher("/User_Manager.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("tutor") != null || req.getSession().getAttribute("admin") != null) {
            req.setAttribute("UserDAO", UserDAO);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

}
