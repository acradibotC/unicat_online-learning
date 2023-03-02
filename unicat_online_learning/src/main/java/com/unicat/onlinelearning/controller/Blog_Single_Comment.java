package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogCommentsDAO;
import com.unicat.onlinelearning.dto.BlogComments;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/blog/comment")
public class Blog_Single_Comment extends HttpServlet {

    public static BlogCommentsDAO BlogCommentsDAO = new BlogCommentsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 4);
        if (req.getSession().getAttribute("student") == null && req.getSession().getAttribute("admin") == null && req.getSession().getAttribute("tutor") == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login");
        } else {
            User User = null;
            if (req.getSession().getAttribute("student") != null) {
                User = (User) req.getSession().getAttribute("student");
            }
            if (req.getSession().getAttribute("tutor") != null) {
                User = (User) req.getSession().getAttribute("tutor");
            }
            if (req.getSession().getAttribute("admin") != null) {
                User = (User) req.getSession().getAttribute("admin");
            }
            Timestamp BlogFeedbackDate = new Timestamp(new Date().getTime());
            int BlogID = Integer.parseInt(req.getParameter("txtBlogID"));
            
            // Insert 
            if (req.getParameter("txtStatus").equalsIgnoreCase("1")) {
                BlogCommentsDAO.insertBlogComments(new BlogComments(0, Integer.parseInt(req.getParameter("txtBlogFeedbackID")), User.getUserID(),
                        req.getParameter("txtBlogCommentContent"), BlogFeedbackDate));
                resp.sendRedirect(req.getContextPath() + "/blog/single?BlogID=" + BlogID);
            }
            
            // Update 
            if (req.getParameter("txtStatus").equalsIgnoreCase("2")) {
                BlogComments blogComment = BlogCommentsDAO.getBlogCommentByBlogCommentID(Integer.parseInt(req.getParameter("txtBlogCommentID")));
                blogComment.setBlogCommentContent(req.getParameter("txtBlogCommentContent"));
                blogComment.setBlogCommentDate(BlogFeedbackDate);
                BlogCommentsDAO.updateBlogcomment(blogComment);
                resp.sendRedirect(req.getContextPath() + "/blog/single?BlogID=" + BlogID);
            }
            
            // Delete  
            if (req.getParameter("txtStatus").equalsIgnoreCase("3")) {
                BlogCommentsDAO.deleteBlogCommentByBlogCommentID(Integer.parseInt(req.getParameter("txtBlogCommentID")));
                resp.sendRedirect(req.getContextPath() + "/blog/single?BlogID=" + BlogID);
            }     
        }
    }

}
