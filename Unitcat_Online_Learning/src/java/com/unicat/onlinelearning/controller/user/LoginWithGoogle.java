/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Anhnt206
 */
public class LoginWithGoogle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
            dis.forward(req, resp);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            req.setAttribute("id", googlePojo.getId());
            req.setAttribute("name", googlePojo.getName());
            req.setAttribute("email", googlePojo.getEmail());
            RequestDispatcher dis = req.getRequestDispatcher("index.jsp");
            dis.forward(req, resp);
        }
    }

}
