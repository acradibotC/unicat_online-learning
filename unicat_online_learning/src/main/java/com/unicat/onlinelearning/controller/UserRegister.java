/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 *
 * @author Admin
 */
@WebServlet("/user/register")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        String UserName = req.getParameter("txtUserName");
        String PassWord = req.getParameter("txtPassWord");
        String Phone = req.getParameter("txtPhone");
        String Dob = req.getParameter("txtDob");
        String rePass = req.getParameter("txtRePass");
        String FullName = req.getParameter("txtFullName");
        String Gmail = req.getParameter("txtGmail");
        String Address = req.getParameter("txtAddress");
        if (UserName.equals("")) {
            req.setAttribute("msgUserName", "UserName is required");
<<<<<<< HEAD:Unitcat_Online_Learning/src/java/com/unicat/onlinelearning/controller/UserRegister.java

        } else {
            if (ud.checkUser(UserName, Gmail) != null) {
                req.setAttribute("msgUserName", "UserName has been used");
            }
        }
        if (PassWord.equals("")) {
            req.setAttribute("msgPass", "PassWord is required");
        } else {
            if (PassWord.contains(" ") || PassWord.length() < 6) {
                req.setAttribute("msgPass", "PassWord length must greater than 6 and not contain space");
                PassWord = "";
            }
        }
        if (Phone.equals("")) {
            req.setAttribute("msgPhone", "Phone is required");
        } else {
            String regex = "[0-9]+";
            if (Phone.matches(regex) == false || Phone.length() < 9) {
                req.setAttribute("msgPhone", "Phone does not exist. Please enter valid phone number!");

            }
=======
        }
        if (PassWord.equals("")) {
            req.setAttribute("msgPass", "PassWord is required");
        }
        if (Phone.equals("")) {
            req.setAttribute("msgPhone", "Phone is required");
>>>>>>> develop:unicat_online_learning/src/main/java/com/unicat/onlinelearning/controller/UserRegister.java
        }
        if (Dob.equals("")) {
            req.setAttribute("msgDob", "Date of birth is required");
        }
        if (rePass.equals("")) {
            req.setAttribute("msgRePass", "Re Pass is required");
        }
        if (FullName.equals("")) {
            req.setAttribute("msgName", "Name is required");
        }
        if (Gmail.equals("")) {
            req.setAttribute("msgGmail", "Gmail is required");
        }
        if (Address.equals("")) {
            req.setAttribute("msgAddress", "Address is required");
        }
        if (UserName.equals("") || PassWord.equals("") || Phone.equals("") || Dob.equals("") || rePass.equals("") || FullName.equals("") || Gmail.equals("") || Address.equals("")) {
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        } else {
            if (rePass.equals(PassWord) == false) {
                req.setAttribute("msgRePassf", "Re-Password is not match with PassWord");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
            } else {
                if (ud.checkUser(UserName, Gmail) != null) {
                    req.setAttribute("msgHave", "User Name or Gmail has been used");
                    req.getRequestDispatcher("/register.jsp").forward(req, resp);
                } else {
                    User user = new User(0, UserName, PassWord, FullName, "", Gmail,Date.valueOf(Dob), Phone, Address, null, null, 0, 0);
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
