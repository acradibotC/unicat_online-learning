package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.BlogComments;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BlogCommentsDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<BlogComments> getAllBlogCommentsByBlogFeedbackID(int blogFeedbackID) {
        ArrayList<BlogComments> allBlogComment = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [BlogComments] WHERE BlogFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, blogFeedbackID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogCommentID = rs.getInt("BlogCommentID");
                int BlogFeedbackID = rs.getInt("BlogFeedbackID");
                int UserID = rs.getInt("UserID");
                String BlogCommentContent = rs.getString("BlogCommentContent");
                Timestamp BlogCommentDate = rs.getTimestamp("BlogCommentDate");
                allBlogComment.add(new BlogComments(BlogCommentID, BlogFeedbackID, UserID, BlogCommentContent, BlogCommentDate));
            }
        } catch (SQLException e) {
        }
        return allBlogComment;
    }

    public ArrayList<BlogComments> getAllBlogCommentsByBlogID(int BlogID) {
        ArrayList<BlogComments> allBlogComment = new ArrayList<>();
        try {
            String sql = "SELECT a.BlogCommentID, a.BlogFeedbackID, a.UserID, a.BlogCommentContent, a.BlogCommentDate \n"
                    + "FROM BlogFeedback b inner JOIN BlogComments a\n"
                    + "ON b.BlogFeedbackID = a.BlogFeedbackID \n"
                    + "WHERE b.BlogID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, BlogID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogCommentID = rs.getInt("BlogCommentID");
                int BlogFeedbackID = rs.getInt("BlogFeedbackID");
                int UserID = rs.getInt("UserID");
                String BlogCommentContent = rs.getString("BlogCommentContent");
                Timestamp BlogCommentDate = rs.getTimestamp("BlogCommentDate");
                allBlogComment.add(new BlogComments(BlogCommentID, BlogFeedbackID, UserID, BlogCommentContent, BlogCommentDate));
            }
        } catch (SQLException e) {
        }
        return allBlogComment;
    }

    public BlogComments getBlogCommentByBlogCommentID(int id) {
        try {
            String sql = "SELECT * FROM [BlogComments] WHERE BlogCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogCommentID = rs.getInt("BlogCommentID");
                int BlogFeedbackID = rs.getInt("BlogFeedbackID");
                int UserID = rs.getInt("UserID");
                String BlogCommentContent = rs.getString("BlogCommentContent");
                Timestamp BlogCommentDate = rs.getTimestamp("BlogCommentDate");
                return new BlogComments(BlogCommentID, BlogFeedbackID, UserID, BlogCommentContent, BlogCommentDate);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertBlogComments(BlogComments comment) {
        try {
            String sql = "INSERT INTO [BlogComments]([BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])"
                    + "VALUES(?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, comment.getBlogFeedbackID());
            ps.setInt(2, comment.getUserID());
            ps.setString(3, comment.getBlogCommentContent());
            ps.setTimestamp(4, comment.getBlogCommentDate());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public void deleteBlogCommentByBlogCommentID(int id) {
        try {
            String sql = "DELETE FROM [BlogComments] WHERE BlogCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public void updateBlogcomment(BlogComments blogComment) {
        try {
            String sql = "UPDATE [BlogComments]"
                    + " SET BlogCommentContent = ?, BlogCommentDate = ?"
                    + " WHERE BlogCommentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blogComment.getBlogCommentContent());
            ps.setTimestamp(2, blogComment.getBlogCommentDate());
            ps.setInt(3, blogComment.getBlogCommentID());
            ps.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        BlogCommentsDAO dr = new BlogCommentsDAO();
        ArrayList<BlogComments> list = dr.getAllBlogCommentsByBlogFeedbackID(1);
        System.out.println(list.size());
        dr.deleteBlogCommentByBlogCommentID(10);
    }
}
