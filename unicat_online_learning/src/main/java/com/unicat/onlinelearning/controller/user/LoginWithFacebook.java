/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.user;

import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Anhnt206
 */
public class LoginWithFacebook {

    @WebServlet("/login-facebook")
    public class LoginFacebookServlet extends HttpServlet {

        private static final long serialVersionUID = 1L;

        public LoginFacebookServlet() {
            super();
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String code = request.getParameter("code");

            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("/login");
                dis.forward(request, response);
            } else {
                String accessToken = RestFB.getToken(code);
                User user = RestFB.getUserInfo(accessToken);
                request.setAttribute("id", user.getId());
                request.setAttribute("name", user.getName());
                RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
                dis.forward(request, response);
            }

        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            doGet(request, response);
        }
    }
}
