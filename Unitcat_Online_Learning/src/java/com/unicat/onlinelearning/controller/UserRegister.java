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
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        String UserName = req.getParameter("txtUserName");
        String PassWord = req.getParameter("txtPassWord");
        String Phone = req.getParameter("txtPhone");
        String Dob = req.getParameter("txtDob");
        String rePass = req.getParameter("txtRePass");
        String Name = req.getParameter("txtName");
        String Gmail=req.getParameter("txtGmail");
        if (UserName.equals("")) {
            req.setAttribute("msgUserName", "UserName is required");
        }
        if (PassWord.equals("")) {
            req.setAttribute("msgPass", "PassWord is required");
        }
        if (Phone.equals("")) {
            req.setAttribute("msgPhone", "Phone is required");
        }
        if (Dob.equals("")) {
            req.setAttribute("msgDob", "Date of birth is required");
        }
        if (rePass.equals("")) {
            req.setAttribute("msgRePass", "Re Pass is required");
        }
        if (Name.equals("")) {
            req.setAttribute("msgName", "Name is required");
        }
        if (Gmail.equals("")){
            req.setAttribute("msgGmail", "Gmail is required");
        }
        if (UserName.equals("") || PassWord.equals("") || Phone.equals("") || Dob.equals("") || rePass.equals("") || Name.equals("") || Gmail.equals("")) {
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        } else {
            if (rePass.equals(PassWord) == false) {
                req.setAttribute("msgRePassf", "Re-Password is not match with PassWord");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
            } else {
                if (ud.checkUser(UserName, Gmail) == true) {
                    req.setAttribute("msgHave", "User Name or Gmail has been used");
                    req.getRequestDispatcher("/register.jsp").forward(req, resp);
                } else {
                    User user = new User(0, UserName, PassWord, Phone, Date.valueOf(Dob), 0, 1, Name,Gmail);
                    ud.insertUser(user);
                    resp.sendRedirect(req.getContextPath() + "/user/login");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

}
