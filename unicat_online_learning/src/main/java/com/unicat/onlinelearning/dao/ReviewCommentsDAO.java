package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.ReviewComments;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewCommentsDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();
    
    //Insert
    public void insertReviewComment(ReviewComments reviewComment){
        try {
            String sql = "INSERT INTO [ReviewComments] VALUES(?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewComment.getReviewFeedbackID());
            ps.setInt(2, reviewComment.getReviewID());
            ps.setString(3, reviewComment.getReviewCommentContent());
            ps.setTimestamp(4, reviewComment.getReviewCommentDate());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    //Update
    public void updateReviewComment(ReviewComments reviewComment) {
        try {
            String sql = "UPDATE [ReviewComments]\n"
                    + "SET ReviewCommentContent = ?, ReviewCommentDate = ?\n"
                    + "WHERE ReviewCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, reviewComment.getReviewCommentContent());
            ps.setTimestamp(2, reviewComment.getReviewCommentDate());
            ps.setInt(3, reviewComment.getReviewCommentID());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    //Delete
    public void deleteReviewCommentByReviewCommentID(int reviewCommentID) {
        try {
            String sql = "DELETE FROM [ReviewComments] WHERE ReviewCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewCommentID);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<ReviewComments> getAllReviewCommentsByReviewFeedbackID(int reviewFeedbackID){
        ArrayList<ReviewComments> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [ReviewComments] WHERE ReviewFeedbackID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewFeedbackID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                list.add(new ReviewComments(rs.getInt("ReviewCommentID"), rs.getInt("ReviewFeedbackID"), 
                        rs.getInt("ReviewID"), rs.getString("ReviewCommentContent"), rs.getTimestamp("ReviewCommentDate")));
        } catch (Exception e) {
        }
        return list;
    }
    
    public ReviewComments getReviewCommentByReviewCommentID(int reviewCommentID) {
        try {
            String sql = "SELECT * FROM [ReviewComments] WHERE ReviewCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, reviewCommentID);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
                return new ReviewComments(rs.getInt("ReviewCommentID"), rs.getInt("ReviewFeedbackID"), 
                        rs.getInt("ReviewID"), rs.getString("ReviewCommentContent"), rs.getTimestamp("ReviewCommentDate"));
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        ReviewCommentsDAO dao = new ReviewCommentsDAO();
        System.out.println(dao.getAllReviewCommentsByReviewFeedbackID(9).size());
    }
}
