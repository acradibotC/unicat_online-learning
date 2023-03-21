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
            ps.setFloat(3, review.getVote());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    //Update
    public void updateReview(Review review) {
        try {
            String sql = "UPDATE [Review] \n"
                    + "SET [Vote] = ?\n"
                    + "WHERE ReviewID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, review.getVote());
            ps.setInt(2, review.getReviewID());
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
    
    public float getAvgVoteCourseByCourseID(int courseID) {
        try {
            String sql = "SELECT AVG(Vote) AS [Average] FROM [Review] WHERE CourseID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                return rs.getFloat("Average");
        } catch (Exception e) {
        }
        return 0;
    }
    
    public int getTotalVoteCourseByCourseID(int courseID) {
        try {
            String sql = "SELECT COUNT(*) AS [SUM] FROM [Review] WHERE CourseID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                return rs.getInt("SUM");
        } catch (Exception e) {
        }
        return 0;
    }
    
    public int getTotalVoteCourseByCourseIDAndVote(int courseID, int vote) {
        try {
            String sql = "SELECT COUNT(*) AS [Total] FROM [Review] WHERE CourseID = ? AND Vote = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.setInt(2, vote);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                return rs.getInt("Total");
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        ReviewDAO dao = new ReviewDAO();
        //System.out.println(dao.checkUserVote(1, 3).getUserID());
        //System.out.println(dao.getReviewByReviewCommentID(2).getUserID());
        System.out.println(dao.getTotalVoteCourseByCourseID(1));
        System.out.println(dao.getTotalVoteCourseByCourseIDAndVote(14, 5));
    }
}
