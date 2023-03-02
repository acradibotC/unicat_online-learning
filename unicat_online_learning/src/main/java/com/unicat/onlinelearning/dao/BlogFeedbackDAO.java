package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.BlogFeedback;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BlogFeedbackDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<BlogFeedback> getAllBlogFeedbackByBlogID(int blogID) {
        ArrayList<BlogFeedback> allBlogFeedback = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [BlogFeedback] WHERE BlogID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, blogID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogFeedbackID = rs.getInt("BlogFeedbackID");
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogFeedbackContent = rs.getString("BlogFeedbackContent");
                Timestamp BlogFeedbackDate = rs.getTimestamp("BlogFeedbackDate");
                allBlogFeedback.add(new BlogFeedback(BlogFeedbackID, BlogID, UserID, BlogFeedbackContent, BlogFeedbackDate));
            }
        } catch (SQLException e) {
        }
        return allBlogFeedback;
    }

    public BlogFeedback getBlogFeedbackByBlogFeedbackID(int id) {
        try {
            String sql = "SELECT * FROM [BlogFeedback] WHERE BlogFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new BlogFeedback(rs.getInt("BlogFeedbackID"), rs.getInt("BlogID"), rs.getInt("UserID"),
                        rs.getString("BlogFeedbackContent"), rs.getTimestamp("BlogFeedbackDate"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void InsertBlogFeedback(BlogFeedback blog) {
        try {
            String sql = "INSERT INTO [BlogFeedback] VALUES (?,?,?,?) ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, blog.getBlogID());
            ps.setInt(2, blog.getUserID());
            ps.setString(3, blog.getBlogFeedbackContent());
            ps.setTimestamp(4, blog.getBlogFeedbackDate());
            ps.execute();
        } catch (Exception e) {
        }
    }

    public void updateBlogFeedback(BlogFeedback blogFeedback) {
        try {
            String sql = "UPDATE [BlogFeedback]\n"
                    + "SET BlogFeedbackContent = ?, BlogFeedbackDate = ?\n"
                    + "WHERE BlogFeedbackID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, blogFeedback.getBlogFeedbackContent());
            ps.setTimestamp(2, blogFeedback.getBlogFeedbackDate());
            ps.setInt(3, blogFeedback.getBlogFeedbackID());
            ps.execute();
        } catch (Exception e) {
        }
    }

    public void deleteBlogFeedbackByBlogFeedbackID(int id) {
        try {
            String sql1 = "DELETE FROM [BlogComments] WHERE BlogFeedbackID = ?";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, id);
            ps1.execute();
            String sql2 = "DELETE FROM [BlogFeedback] WHERE BlogFeedbackID = ?";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, id);
            ps2.execute();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        BlogFeedbackDAO dc = new BlogFeedbackDAO();
//        ArrayList<BlogFeedback> list = dc.getAllBlogFeedbackByBlogID(1);
//        for (BlogFeedback x : list) {
//            System.out.println(x);
//        }
//        System.out.println(list.size());
        System.out.println(dc.getBlogFeedbackByBlogFeedbackID(1).getBlogFeedbackContent());
    }
}
