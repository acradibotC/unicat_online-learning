package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogFeedbackDAO;
import com.unicat.onlinelearning.dto.BlogFeedback;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/blog_single/postcomments")
public class Blog_Single_PostComments extends HttpServlet {

    public static BlogFeedbackDAO BlogFeedbackDAO = new BlogFeedbackDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 4);
        if (req.getSession().getAttribute("student") == null && req.getSession().getAttribute("admin") == null && req.getSession().getAttribute("tutor") == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login");
        } else {
            User User = null;
            if (req.getSession().getAttribute("student") != null) 
                User = (User) req.getSession().getAttribute("student");           
            if (req.getSession().getAttribute("tutor") != null)
                User = (User) req.getSession().getAttribute("tutor");
            if (req.getSession().getAttribute("admin") != null)
                User = (User) req.getSession().getAttribute("admin");    
            int BlogFeedbackID = 0;
            int BlogID = Integer.parseInt(req.getParameter("txtBlogID"));
            int UserID = User.getUserID();
            String BlogFeedbackContent = req.getParameter("txtReview");
            Timestamp BlogFeedbackDate = new Timestamp(new Date().getTime());
            BlogFeedbackDAO.InsertBlogFeedback(new BlogFeedback(BlogFeedbackID, BlogID, UserID, BlogFeedbackContent, BlogFeedbackDate));
            resp.sendRedirect(req.getContextPath() + "/blog_single?BlogID=" + BlogID);
        }
    }

}
