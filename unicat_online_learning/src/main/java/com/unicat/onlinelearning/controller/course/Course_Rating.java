package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CourseEnrollDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
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

@WebServlet("/course/rating")
public class Course_Rating extends HttpServlet {

    public static ReviewDAO ReviewDAO = new ReviewDAO();
    public static ReviewFeedbackDAO ReviewFeedbackDAO = new ReviewFeedbackDAO();
    public static CourseEnrollDAO CourseEnrollDAO = new CourseEnrollDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("User");
        String txtCourseID = req.getParameter("CourseID");
        int courseID = 0;
        try {
            courseID = Integer.parseInt(txtCourseID);
            if (courseID < 1 || courseID > CoursesDAO.getCourseByLatestCourseID().getCourseID()) {
                throw new Exception();
            }
            
            //If The user has enrolled Course
            if (CourseEnrollDAO.getCourseEnrollByUserIDAndCourseID(user.getUserID(), courseID) != null) {
                req.setAttribute("CourseID", courseID);
                req.getRequestDispatcher("/course_rating.jsp").forward(req, resp);
            } else throw new Exception();
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("User");
        int CourseID = Integer.parseInt(req.getParameter("CourseID"));
        Timestamp currentTime = new Timestamp(new Date().getTime());
        Review CheckVoteUser = ReviewDAO.checkUserVote(user.getUserID(), CourseID);
        String rate = req.getParameter("rate");
        if (rate == null) {
            rate = "0";
        }

        //If the User have voted (Meaning: having ReviewID)
        if (CheckVoteUser != null) {
            CheckVoteUser.setVote(Float.parseFloat(rate));
            ReviewDAO.updateReview(CheckVoteUser);

            String reviewFeedbackContent = req.getParameter("txtReviewFeedbackContent");
            //If the User input reviewFeedbackContent
            if (!reviewFeedbackContent.isEmpty()) {
                ReviewFeedback reviewFeedback = new ReviewFeedback();
                reviewFeedback.setReviewFeedbackID(0);
                reviewFeedback.setReviewID(CheckVoteUser.getReviewID());
                reviewFeedback.setReviewFeedbackContent(reviewFeedbackContent);
                reviewFeedback.setReviewFeedbackDate(currentTime);
                ReviewFeedbackDAO.insertReviewFeedback(reviewFeedback);
            }
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

        //If the User doesn't voted (Meaning: not having ReviewID)
        if (CheckVoteUser == null) {

            // Insert Review
            ReviewDAO.insertReview(new Review(0, user.getUserID(), CourseID, Float.parseFloat(rate)));
            Review reviewAfterInserting = ReviewDAO.getReviewAfterInsertingReview();

            String reviewFeedbackContent = req.getParameter("txtReviewFeedbackContent");
            //If the User input reviewFeedbackContent
            if (!reviewFeedbackContent.isEmpty()) {
                ReviewFeedback reviewFeedback = new ReviewFeedback();
                reviewFeedback.setReviewFeedbackID(0);
                reviewFeedback.setReviewID(reviewAfterInserting.getReviewID());
                reviewFeedback.setReviewFeedbackContent(reviewFeedbackContent);
                reviewFeedback.setReviewFeedbackDate(currentTime);
                ReviewFeedbackDAO.insertReviewFeedback(reviewFeedback);
            }
            resp.sendRedirect(req.getContextPath() + "/course?CourseID=" + CourseID);
        }

    }

}
