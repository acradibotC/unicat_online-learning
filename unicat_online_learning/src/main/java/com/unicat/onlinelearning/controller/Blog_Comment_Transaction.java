package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogCommentsDAO;
import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.BlogFeedbackDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.BlogComments;
import com.unicat.onlinelearning.dto.BlogFeedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog/comment/transaction")
public class Blog_Comment_Transaction extends HttpServlet {

    public static BlogDAO BlogDAO = new BlogDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static BlogFeedbackDAO BlogFeedbackDAO = new BlogFeedbackDAO();
    public static CoursesDAO CourseDAO = new CoursesDAO();
    public static BlogCommentsDAO BlogCommentsDAO = new BlogCommentsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 4);
        req.setAttribute("BlogDAO", BlogDAO);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("CourseDAO", CourseDAO);
        req.setAttribute("BlogFeedbackDAO", BlogFeedbackDAO);
        req.setAttribute("BlogCommentDAO", BlogCommentsDAO);
        
        String txtBlogCommentID = req.getParameter("txtBlogCommentID");
        String txtBlogFeedbackID = req.getParameter("txtBlogFeedbackID");

        int BlogCommentID, BlogFeedbackID;
        BlogComments BlogComment;
        BlogFeedback Blogfeedback;
        if (txtBlogCommentID != null) {
            BlogCommentID = Integer.parseInt(txtBlogCommentID);
            BlogComment = BlogCommentsDAO.getBlogCommentByBlogCommentID(BlogCommentID);
            req.setAttribute("BlogComment", BlogComment);
        }
        if (txtBlogFeedbackID != null) {
            BlogFeedbackID = Integer.parseInt(txtBlogFeedbackID);
            Blogfeedback = BlogFeedbackDAO.getBlogFeedbackByBlogFeedbackID(BlogFeedbackID);
            req.setAttribute("BlogFeedback", Blogfeedback);
        } 

        req.setAttribute("txtStatus", req.getParameter("txtStatus"));
        req.setAttribute("BlogID", req.getParameter("txtBlogID"));
        req.getRequestDispatcher("/blog_comment.jsp").forward(req, resp);
    }

}
