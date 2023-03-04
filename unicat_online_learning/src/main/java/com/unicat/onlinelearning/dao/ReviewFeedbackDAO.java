package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.ReviewFeedback;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewFeedbackDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    //Insert 
    public void insertReviewFeedback(ReviewFeedback reviewFeedback) {
        try {
            String sql = "INSERT INTO [ReviewFeedback] VALUES(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewFeedback.getReviewID());
            ps.setString(2, reviewFeedback.getReviewFeedbackContent());
            ps.setTimestamp(3, reviewFeedback.getReviewFeedbackDate());
            ps.execute();
        } catch (Exception e) {
        }
    }

    //Update
    public void updateReviewFeedback(ReviewFeedback reviewFeedback) {
        try {
            String sql = "UPDATE [ReviewFeedback]\n"
                    + "SET ReviewFeedbackContent = ?, ReviewFeedbackDate = ?\n"
                    + "WHERE ReviewFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, reviewFeedback.getReviewFeedbackContent());
            ps.setTimestamp(2, reviewFeedback.getReviewFeedbackDate());
            ps.setInt(3, reviewFeedback.getReviewFeedbackID());
            ps.execute();
        } catch (Exception e) {
        }
    }

    //Delete
    public void deleteReviewFeedbackByReviewFeedbackID(int reviewFeedbackID) {
        try {
            String sql1 = "DELETE FROM [ReviewComments] WHERE ReviewFeedbackID = ?";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, reviewFeedbackID);
            ps1.execute();
            String sql2 = "DELETE FROM [ReviewFeedback] WHERE ReviewFeedbackID = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, reviewFeedbackID);
            ps2.execute();
        } catch (Exception e) {
        }
    }

    public ReviewFeedback getReviewFeedbackByReviewFeedbackID(int reviewFeedbackID) {
        try {
            String sql = "SELECT * FROM [ReviewFeedback] WHERE ReviewFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewFeedbackID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ReviewFeedback(rs.getInt("ReviewFeedbackID"), rs.getInt("ReviewID"),
                        rs.getString("ReviewFeedbackContent"), rs.getTimestamp("ReviewFeedbackDate"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<ReviewFeedback> getAllReviewFeedbackByCourseID(int id) {
        ArrayList<ReviewFeedback> list = new ArrayList<>();
        try {
            String sql = "SELECT a.ReviewID, a.UserID, a.CourseID, a.Vote, b.ReviewFeedbackID, b.ReviewFeedbackContent, b.ReviewFeedbackDate\n"
                    + "FROM [Review] a JOIN [ReviewFeedback] b\n"
                    + "ON a.ReviewID = b.ReviewID \n"
                    + "WHERE a.CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ReviewFeedback(rs.getInt("ReviewFeedbackID"), rs.getInt("ReviewID"),
                        rs.getString("ReviewFeedbackContent"), rs.getTimestamp("ReviewFeedbackDate")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ReviewFeedbackDAO dao = new ReviewFeedbackDAO();
        System.out.println(dao.getAllReviewFeedbackByCourseID(1).size());
        dao.insertReviewFeedback(new ReviewFeedback(0, 1, "123test", null));
    }
}
