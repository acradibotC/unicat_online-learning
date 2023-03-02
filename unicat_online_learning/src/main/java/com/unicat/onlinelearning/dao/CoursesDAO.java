package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Course;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.User;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CoursesDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<Course> getAllCourse() {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getFewLatestCourse(int num) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT TOP " + num + "* FROM [Course] ORDER BY CourseID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseByCategoryID(int CategoryID) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE CategoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseSearchingByCategoryID(int CategoryID, String Search) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ? AND CategoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ps.setInt(2, CategoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseSearching(String Search) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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
            while (rs.next()) {
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

    public int EnrollCoure(int UserID, int CourseID) {
        int kt = 0;
        try {
            String sql = "insert into CourseEnroll (UserID,CourseID,EnrollDate,LessonCurrent,CourseStatus) "
                    + "values (?,?,?,1,0)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setDate(3, Date.valueOf(java.time.LocalDate.now()));
            kt = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return kt;
    }

    public int doneCurrentLesson(int UserID, int CourseID, int LessonCurrent) {
        int kt = 0;
        try {
            String sql = "UPDATE CourseEnroll SET LessonCurrent = ? WHERE UserID = ? AND CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, LessonCurrent);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            kt = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return kt;
    }

    public CourseEnroll GetCourseEnrolledByUserID(int CourseID, int UserID) {
        CourseEnroll c = null;
        try {
            String sql = "SELECT * FROM [CourseEnroll] WHERE CourseID = ? and UserID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ps.setInt(2, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Date EnrollDate = rs.getDate("EnrollDate");
                int LessonCurrent = rs.getInt("LessonCurrent");
                int CourseStatus = rs.getInt("CourseStatus");
                c = new CourseEnroll(0, UserID, CourseID, EnrollDate, LessonCurrent, CourseStatus);
            }
        } catch (SQLException e) {

        }
        return c;
    }

    public static void main(String[] args) {
        CoursesDAO dao = new CoursesDAO();
        //System.out.println(dao.getFewLatestCourse(1).size());
        BlogDAO dc = new BlogDAO();

        System.out.println(dao.GetCourseEnrolledByUserID(1, 6));
        //System.out.println(dao.getCourseByCourseID(5).getName());
        //System.out.println(dao.getAllCourseByCategoryID(1).size());

    }
}
