package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Course;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CoursesDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<Course> getAllCourse() {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public ArrayList<Course> getFewLatestCourse(int num){
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT TOP " + num + "* FROM [Course] ORDER BY CourseID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public ArrayList<Course> getAllCourseByCategoryID(int CategoryID){
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE CategoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public ArrayList<Course> getAllCourseSearchingByCategoryID(int CategoryID, String Search){
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ? AND CategoryID = ?";           
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search  + "%");
            ps.setInt(2, CategoryID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public ArrayList<Course> getAllCourseSearching(String Search){
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ?";           
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search  + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public Course getCourseByCourseID(int CourseID) {
        Course course = null;
        try {
            String sql = "SELECT * FROM [Course] WHERE CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"));
            }
        } catch (Exception e) {
        }
        return course;
    }
    
    public ArrayList<Course> getListBySearching(ArrayList<Course> list, int start, int end) {
        ArrayList<Course> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    public static void main(String[] args) {
        CoursesDAO dao = new CoursesDAO();
        //System.out.println(dao.getFewLatestCourse(1).size());
        BlogDAO dc = new BlogDAO();
        //System.out.println(dao.getCourseByCourseID(5).getName());
        //System.out.println(dao.getAllCourseByCategoryID(1).size());
        System.out.println(dao.getAllCourseSearchingByCategoryID(1, "j").size());
    }
}
