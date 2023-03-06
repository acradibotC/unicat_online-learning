package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.ReviewCommentsDAO;
import com.unicat.onlinelearning.dao.ReviewDAO;
import com.unicat.onlinelearning.dto.Review;
import com.unicat.onlinelearning.dto.ReviewComments;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/course/review/comment")
public class Course_Review_Comment extends HttpServlet {

    public static ReviewDAO ReviewDAO = new ReviewDAO();
    public static ReviewCommentsDAO ReviewCommentsDAO = new ReviewCommentsDAO();

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
                ReviewCommentsDAO.insertReviewComment(new ReviewComments(0, Integer.parseInt(req.getParameter("txtReviewFeedbackID")), reviewAfterInserting.getReviewID(),
                        req.getParameter("txtReview"), currentTime));
            } else {
                //If the User has voted (Meaning: having ReviewID)
                ReviewCommentsDAO.insertReviewComment(new ReviewComments(0, Integer.parseInt(req.getParameter("txtReviewFeedbackID")), reviewCheckVote.getReviewID(),
                        req.getParameter("txtReview"), currentTime));
            }
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

        // Update
        if (req.getParameter("txtStatus").equalsIgnoreCase("2")) {
            ReviewComments reviewComment = ReviewCommentsDAO.getReviewCommentByReviewCommentID(Integer.parseInt(req.getParameter("txtReviewCommentID")));
            reviewComment.setReviewCommentContent(req.getParameter("txtReview"));
            reviewComment.setReviewCommentDate(currentTime);
            ReviewCommentsDAO.updateReviewComment(reviewComment);
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

        // Delete
        if (req.getParameter("txtStatus").equalsIgnoreCase("3")) {
            ReviewCommentsDAO.deleteReviewCommentByReviewCommentID(Integer.parseInt(req.getParameter("txtReviewCommentID")));
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }
    }

}
