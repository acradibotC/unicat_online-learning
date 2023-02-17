package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogCommentsDAO;
import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.BlogFeedbackDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.Blog;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Blog_Single extends HttpServlet {

    public static BlogDAO BlogDAO = new BlogDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static BlogFeedbackDAO BlogFeedbackDAO = new BlogFeedbackDAO();
    public static BlogCommentsDAO BlogCommentDAO = new BlogCommentsDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int BlogID = Integer.parseInt(req.getParameter("BlogID"));
        Blog blog = BlogDAO.getBlogFromBlogID(BlogID);
        req.setAttribute("BlogID", BlogID);
        req.setAttribute("Blog", blog);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("BlogFeedbackDAO", BlogFeedbackDAO);
        req.setAttribute("BlogCommentDAO", BlogCommentDAO);
        req.getRequestDispatcher("/blog_single.jsp").forward(req, resp);
    }

}
