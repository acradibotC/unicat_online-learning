
package com.unicat.onlinelearning.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Blog_Single extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/blog_single.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int BlogID;
        Blog blog;
        req.setAttribute("StatusHome", 4);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("BlogFeedbackDAO", BlogFeedbackDAO);
        req.setAttribute("BlogCommentDAO", BlogCommentDAO);
        try {
            BlogID = Integer.parseInt(req.getParameter("BlogID"));
            if (BlogID < 1 || BlogID > BlogDAO.getLastBlog().getBlogID()) {
                throw new Exception();
            }
            blog = BlogDAO.getBlogFromBlogID(BlogID);
            req.setAttribute("Blog", blog);
            req.setAttribute("BlogID", BlogID);
            req.getRequestDispatcher("/blog_single.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/home");
        }

    }

}
