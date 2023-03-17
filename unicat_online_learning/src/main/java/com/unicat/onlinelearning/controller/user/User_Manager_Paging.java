/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.user;

import static com.unicat.onlinelearning.controller.user.User_Manager_Searching.UserDAO;
import com.unicat.onlinelearning.dao.UserDAO;
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
@WebServlet("/admin/manager/usesr/paging")
public class User_Manager_Paging extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<com.unicat.onlinelearning.dto.User> allUser = UserDAO.getAllUserSearching(req.getParameter("Name"));
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

        req.setAttribute("allUser", allUser);
        req.setAttribute("NameSearch", req.getParameter("txtNameSearch"));
        req.getRequestDispatcher("/User_Manager.jsp").forward(req, resp);
    }

}
