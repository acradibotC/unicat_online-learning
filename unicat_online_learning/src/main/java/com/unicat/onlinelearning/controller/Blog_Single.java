package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogCommentsDAO;
import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.BlogFeedbackDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/blog/single")
public class Blog_Single extends HttpServlet{
    
    public static UserDAO UserDAO = new UserDAO();  
    public static BlogDAO BlogDAO = new BlogDAO();
    public static BlogFeedbackDAO BlogFeedbackDAO = new BlogFeedbackDAO();
    public static BlogCommentsDAO BlogCommentDAO = new BlogCommentsDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 4);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int BlogID;
        com.unicat.onlinelearning.dto.Blog blog;
        req.setAttribute("StatusHome", 4);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("BlogFeedbackDAO", BlogFeedbackDAO);
        req.setAttribute("BlogCommentDAO", BlogCommentDAO);
        req.setAttribute("CoursesDAO", CoursesDAO);
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

