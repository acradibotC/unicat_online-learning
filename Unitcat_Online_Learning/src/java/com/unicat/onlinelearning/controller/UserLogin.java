/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dto.User;
import com.unicat.onlinelearning.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("txtUserName");
        String pass = req.getParameter("txtPassWord");
        if (uname.equals("")) {
            req.setAttribute("msgUserName", "Username is required");
        }
        if (pass.equals("")) {
            req.setAttribute("msgPass", "Password is required");
        }
        if (pass.equals("") || uname.equals("")) {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            UserDAO ud = new UserDAO();
            User user = ud.getAccount(uname, pass);
            if (user != null) {
                if (user.getRole()== 1) {
                    req.getSession().setAttribute("admin", user);
                } else {
                    req.getSession().setAttribute("student", user);
                }
                resp.sendRedirect(req.getContextPath() + "/home");
            } else {
                req.setAttribute("message", "Account's not found");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("student") != null || req.getSession().getAttribute("admin") != null) {
            req.getSession().removeAttribute("student");
            req.getSession().removeAttribute("admin");
            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }     
    }

}