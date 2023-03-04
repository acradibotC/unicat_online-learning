package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.ReviewCommentsDAO;
import com.unicat.onlinelearning.dao.ReviewDAO;
import com.unicat.onlinelearning.dao.ReviewFeedbackDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.ReviewComments;
import com.unicat.onlinelearning.dto.ReviewFeedback;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/course/review/transaction")
public class Course_Review_Transaction extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static ReviewFeedbackDAO ReviewFeedbackDAO = new ReviewFeedbackDAO();
    public static ReviewDAO ReviewDAO = new ReviewDAO();
    public static ReviewCommentsDAO ReviewCommentsDAO = new ReviewCommentsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 3);
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("ReviewFeedbackDAO", ReviewFeedbackDAO);
        req.setAttribute("ReviewCommentsDAO", ReviewCommentsDAO);
        req.setAttribute("ReviewDAO", ReviewDAO);
        
        //Status: 1 Insert - 2 Update -  3 Delete
        req.setAttribute("txtStatus", req.getParameter("txtStatus"));
        int CourseID = Integer.parseInt(req.getParameter("txtCourseID"));
        com.unicat.onlinelearning.dto.Course Course = CoursesDAO.getCourseByCourseID(CourseID);
        req.setAttribute("Course", Course);
        CourseEnroll ce = null;
        if (req.getSession().getAttribute("student") != null) {
            User u = (User) req.getSession().getAttribute("student");
            CoursesDAO cd = new CoursesDAO();
            ce = cd.GetCourseEnrolledByUserID(CourseID, u.getUserID());
            req.setAttribute("ce", ce);
            req.setAttribute("User", u);
        }

        String txtReviewCommentID = req.getParameter("txtReviewCommentID");
        String txtReviewFeedbackID = req.getParameter("txtReviewFeedbackID");
        int ReviewCommentID, ReviewFeedbackID;
        ReviewComments ReviewComment;
        ReviewFeedback ReviewFeedback;
        if (txtReviewCommentID != null) {
            ReviewCommentID = Integer.parseInt(txtReviewCommentID);
            ReviewComment = ReviewCommentsDAO.getReviewCommentByReviewCommentID(ReviewCommentID);
            req.setAttribute("ReviewComment", ReviewComment);
        }
        if (txtReviewFeedbackID != null) {
            ReviewFeedbackID = Integer.parseInt(txtReviewFeedbackID);
            ReviewFeedback = ReviewFeedbackDAO.getReviewFeedbackByReviewFeedbackID(ReviewFeedbackID);
            req.setAttribute("ReviewFeedback", ReviewFeedback);
        }

        req.getRequestDispatcher("/course_review_transaction.jsp").forward(req, resp);
    }

}
