package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Blog;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BlogDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();
    
    public ArrayList<Blog> getAllBlogg() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Blog]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                AllBlogg.add(new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate));
            }
        } catch (SQLException e) {
        }
        return AllBlogg;
    }

    public Blog getBlogFromBlogID(int blogID) {
        Blog blog = null;
        try {
            String sql = "SELECT * FROM [Blog] WHERE BlogID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, blogID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                blog = new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate);
            }
        } catch (SQLException e) {
        }
        return blog;
    }

    public String getShortString(String description, int number) {
        String shortString = "";
        String[] list = description.split(" ");
        int count = 0;
        for (int i = 0; i < list.length; i++) {
            shortString += list[i] + " ";
            count++;
            if (count == number) {
                break;
            }
        }
        if (shortString.contains("<img")) {
            return null;
        } else {
            return shortString;
        }
    }

    public ArrayList<Blog> getTop5LastestBlog() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        try {
            String sql = "SELECT TOP 5 * FROM [Blog] ORDER BY BlogID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                AllBlogg.add(new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate));
            }
        } catch (SQLException e) {
        }
        return AllBlogg;
    }

    public ArrayList<Blog> getTop5LatestBlogExceptLatestBlog() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        try {
            String sql = "SELECT TOP 5 * FROM Blog \n"
                    + "WHERE BlogID != (SELECT Max(BlogID) FROM Blog) \n"
                    + "ORDER BY BlogID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                AllBlogg.add(new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate));
            }
        } catch (SQLException e) {
        }
        return AllBlogg;
    }

    public ArrayList<Blog> getTop6LastestBlog() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        try {
            String sql = "SELECT TOP 6 * FROM [Blog] ORDER BY BlogID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                AllBlogg.add(new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate));
            }
        } catch (SQLException e) {
        }
        return AllBlogg;
    }

    public ArrayList<Blog> getTop9LastestBlog() {
        ArrayList<Blog> AllBlogg = new ArrayList<>();
        try {
            String sql = "SELECT TOP 6 * FROM [Blog] ORDER BY BlogID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                AllBlogg.add(new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate));
            }
        } catch (SQLException e) {
        }
        return AllBlogg;
    }

    public Blog getLastBlog() {
        try {
            String sql = "SELECT * FROM [Blog] ORDER BY BlogID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int BlogID = rs.getInt("BlogID");
                int UserID = rs.getInt("UserID");
                String BlogTitler = rs.getString("BlogTitler");
                String BlogImage = rs.getString("BlogImage");
                String BlogDescription = rs.getString("BlogDescription");
                Date PostDate = rs.getDate("PostDate");
                return new Blog(BlogID, UserID, BlogTitler, BlogImage, BlogDescription, PostDate);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Blog> getListBySearching(ArrayList<Blog> list, int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        BlogDAO dc = new BlogDAO();
        ArrayList<Blog> all = dc.getAllBlogg();
        Blog blog = dc.getBlogFromBlogID(1);
        // System.out.println(blog.getBlogDescription());
        System.out.println(dc.getTop5LastestBlog());
    }
}
