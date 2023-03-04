package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Review;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    //Insert
    public void insertReview(Review review) {
        try {
            String sql = "INSERT INTO [Review] VALUES(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, review.getUserID());
            ps.setInt(2, review.getCourseID());
            ps.setInt(3, review.getVote());
            ps.execute();
        } catch (Exception e) {
        }
    }

    //Delete
    public void deleteReviewByReviewID(int reviewID) {
        try {
            String sql = "DELETE FROM [Review] WHERE ReviewID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewID);
            ps.execute();
        } catch (Exception e) {
        }
    }

    public Review checkUserVote(int userID, int courseID) {
        try {
            String sql = "SELECT * FROM [Review] WHERE UserID = ? AND CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, courseID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt("ReviewID"), rs.getInt("UserID"), rs.getInt("CourseID"), rs.getInt("Vote"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Review getReviewByReviewFeedbackID(int id) {
        try {
            String sql = "SELECT a.ReviewID, a.UserID, a.CourseID, a.Vote, b.ReviewFeedbackID, b.ReviewFeedbackContent, b.ReviewFeedbackDate\n"
                    + "FROM [Review] a JOIN [ReviewFeedback] b\n"
                    + "ON a.ReviewID = b.ReviewID \n"
                    + "WHERE b.ReviewFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt("ReviewID"), rs.getInt("UserID"), rs.getInt("CourseID"), rs.getInt("Vote"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Review getReviewByReviewCommentID(int reviewCommentID) {
        try {
            String sql = "SELECT a.ReviewID, a.UserID, a.CourseID, a.Vote, b.ReviewCommentID, b.ReviewFeedbackID, b.ReviewCommentContent, b.ReviewCommentDate\n"
                    + "FROM [Review] a JOIN [ReviewComments] b\n"
                    + "ON a.ReviewID = b.ReviewID\n"
                    + "WHERE b.ReviewCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewCommentID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt("ReviewID"), rs.getInt("UserID"), rs.getInt("CourseID"), rs.getInt("Vote"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Review getReviewAfterInsertingReview() {
        try {
            String sql = "SELECT * FROM [Review] ORDER BY ReviewID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt("ReviewID"), rs.getInt("UserID"), rs.getInt("CourseID"), rs.getInt("Vote"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        ReviewDAO dao = new ReviewDAO();
        //System.out.println(dao.checkUserVote(1, 3).getUserID());
        System.out.println(dao.getReviewByReviewCommentID(2).getUserID());
    }
}
