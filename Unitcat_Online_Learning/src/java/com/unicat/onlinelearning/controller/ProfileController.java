/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ProfileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            String Password, Phone, Dob, Name, Repass;
            if (req.getParameter("txtPass").equals("")) {
                Password = u.getPassWord();
            } else {
                Password = req.getParameter("txtPass");
            }
            if (req.getParameter("txtRepass").equals("")) {
                Repass = u.getPassWord();
            } else {
                Repass = req.getParameter("txtRepass");
            }
            if (req.getParameter("txtPhone").equals("")) {
                Phone = u.getPhone();
            } else {
                Phone = req.getParameter("txtPhone");
            }
            if (req.getParameter("txtDob").equals("")) {
                Dob = u.getDob().toString();
            } else {
                Dob = req.getParameter("txtDob");
            }
            if (req.getParameter("txtName").equals("")) {
                Name = u.getName();
            } else {
                Name = req.getParameter("txtName");
            }
            if (req.getParameter("txtPass").equals("") == false || req.getParameter("txtRepass").equals("") == false) {
                if (req.getParameter("txtPass").equals("") || req.getParameter("txtRepass").equals("")) {
                    req.getSession().setAttribute("msgNotMatch", "Password must match with RePassword to change password");
                }
                else{
                    if(Password.equals(Repass)==false){
                        req.getSession().setAttribute("PoR", "Password must match with RePassword to change password");
                    }else{
                        u.setPassWord(Password);
                    }
                }
            }
            u.setName(Name);
            
            u.setPhone(Phone);
            u.setDob(Date.valueOf(Dob));
            
            ud.UpdateUser(u);
            resp.sendRedirect(req.getContextPath()+"/userprofile?p=profile");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            req.setAttribute("User", u);
            if (req.getParameter("p") != null) {
                String s = req.getParameter("p");
                if (s.equals("profile")) {
                    req.getRequestDispatcher("/userprofile.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("/PageNotFound.jsp").forward(req, resp);
                }
            } else {

            }

        } else {
            if (req.getSession().getAttribute("admin") != null) {
                User u = (User) req.getSession().getAttribute("admin");
                req.setAttribute("User", u);
            } else {
                req.getRequestDispatcher("/home.jsp").forward(req, resp);
            }
        }

    }

}