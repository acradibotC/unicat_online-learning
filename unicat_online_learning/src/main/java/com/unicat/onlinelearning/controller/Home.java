/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.ReviewDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Home", urlPatterns = {"/index.html", "/home"})
public class Home extends HttpServlet {

    public static BlogDAO BlogDAO = new BlogDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static ReviewDAO ReviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 1);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("ReviewDAO", ReviewDAO);

        //Latest News
        req.setAttribute("LatestBlog", BlogDAO.getLastBlog());

        //Set ROLE
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            req.getSession().setAttribute("User", u);
        }
        if (req.getSession().getAttribute("admin") != null) {
            User u = (User) req.getSession().getAttribute("admin");
            req.getSession().setAttribute("User", u);
        }
        if (req.getSession().getAttribute("tutor") != null) {
            User u = (User) req.getSession().getAttribute("tutor");
            req.getSession().setAttribute("User", u);
        }
        
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }

}
