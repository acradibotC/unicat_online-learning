/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.user;

import com.unicat.onlinelearning.dao.AdminDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Duc Anh
 */
@WebServlet("/delete")
public class deleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("uid"));
        AdminDAO dao = new AdminDAO();
        UserDAO ud = new UserDAO();
        User u = ud.getUserByUserID(id);
        if (u.getStatus() == 0) {
            dao.UnBanUser(id);
        } else {
            dao.BanUser(id);
        }

        resp.sendRedirect("admin/manager/user");

    }

}
