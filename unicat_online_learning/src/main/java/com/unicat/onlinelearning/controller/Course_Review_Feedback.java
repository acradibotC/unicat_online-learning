package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.ReviewDAO;
import com.unicat.onlinelearning.dao.ReviewFeedbackDAO;
import com.unicat.onlinelearning.dto.Review;
import com.unicat.onlinelearning.dto.ReviewFeedback;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/course/review/feedback")
public class Course_Review_Feedback extends HttpServlet {

    public static ReviewFeedbackDAO ReviewFeedbackDAO = new ReviewFeedbackDAO();
    public static ReviewDAO ReviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 3);
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
        Timestamp currentTime = new Timestamp(new Date().getTime());
        int CourseID = Integer.parseInt(req.getParameter("txtCourseID"));

        // Insert
        if (req.getParameter("txtStatus").equalsIgnoreCase("1")) {
            Review reviewCheckVote = ReviewDAO.checkUserVote(User.getUserID(), CourseID);

            //If the User doesn't vote (Meaning: not having ReviewID)
            if (reviewCheckVote == null) {
                Review review = new Review();
                review.setReviewID(0);
                review.setUserID(User.getUserID());
                review.setCourseID(CourseID);
                if (req.getParameter("txtVoteStatus").equalsIgnoreCase("0")) {
                    review.setVote(0);
                }
                ReviewDAO.insertReview(review);
                Review reviewAfterInserting = ReviewDAO.getReviewAfterInsertingReview();
                ReviewFeedbackDAO.insertReviewFeedback(new ReviewFeedback(0, reviewAfterInserting.getReviewID(), req.getParameter("txtReview"), currentTime));
            } else {
                //If the User has voted (Meaning: having ReviewID)
                ReviewFeedbackDAO.insertReviewFeedback(new ReviewFeedback(0, reviewCheckVote.getReviewID(), req.getParameter("txtReview"), currentTime));
            }
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

        // Update
        if (req.getParameter("txtStatus").equalsIgnoreCase("2")) {
            ReviewFeedback reviewFeedback = ReviewFeedbackDAO.getReviewFeedbackByReviewFeedbackID(Integer.parseInt(req.getParameter("txtReviewFeedbackID")));
            reviewFeedback.setReviewFeedbackContent(req.getParameter("txtReview"));
            reviewFeedback.setReviewFeedbackDate(currentTime);
            ReviewFeedbackDAO.updateReviewFeedback(reviewFeedback);
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

        // Delete
        if (req.getParameter("txtStatus").equalsIgnoreCase("3")) {
            ReviewFeedbackDAO.deleteReviewFeedbackByReviewFeedbackID(Integer.parseInt(req.getParameter("txtReviewFeedbackID")));
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }
    }

}
