/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Anhnt206
 */
public class LessonDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<Lesson> getAllLessonByCourseID(int Id) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Lesson WHERE CourseID =? order by LessonNum asc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNum = rs.getInt("LessonNum");
                int CourseID = rs.getInt("CourseID");
                String Name = rs.getString("Name");
                String Title = rs.getString("Title");
                String Description = rs.getString("Description");
                String Video = rs.getString("Video");
                lessons.add(new Lesson(LessonID, LessonNum, CourseID, Name, Title, Description, Video));
            }
        } catch (SQLException e) {
        }
        return lessons;
    }

    public Lesson getLesson(int lessonNum, int CourseId) {
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM Lesson WHERE LessonNum =? AND CourseID =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lessonNum);
            ps.setInt(2, CourseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNum = rs.getInt("LessonNum");
                int CourseID = rs.getInt("CourseID");
                String Name = rs.getString("Name");
                String Title = rs.getString("Title");
                String Description = rs.getString("Description");
                String Video = rs.getString("Video");
                lesson = new Lesson(LessonID, LessonNum, CourseID, Name, Title, Description, Video);
            }
        } catch (SQLException e) {
        }
        return lesson;
    }

    public int getNumberOfLessonsOfCourse(int courseId) {
        int total = 0;
        try {
            String sql = "SELECT COUNT(LessonNum) AS [Total Lesson]\n"
                    + "FROM Lesson\n"
                    + "WHERE  CourseID =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total Lesson");
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public ArrayList<Lesson> getAllLesson() {
        ArrayList<Lesson> lessons = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Lesson] order by LessonNum asc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNum = rs.getInt("LessonNum");
                int CourseID = rs.getInt("CourseID");
                String Name = rs.getString("Name");
                String Title = rs.getString("Title");
                String Description = rs.getString("Description");
                String Video = rs.getString("Video");
                lessons.add(new Lesson(LessonID, LessonNum, CourseID, Name, Title, Description, Video));
            }
        } catch (SQLException e) {
        }
        return lessons;
    }

    public void deleteLessonByLessonID(int lessonID) {

        try {
            String sql = "DELETE FROM [Lesson] WHERE LessonID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lessonID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateLesson(Lesson lesson) {
        try {
            String sql = "update [Lesson] "
                    + "set [LessonNum]=?, [CourseID]=?, [Name]=?, [Title]=?, [Description]=?, [Video] = ? "
                    + "where LessonID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson.getLessonNum());
            ps.setInt(2, lesson.getCourseID());
            ps.setString(3, lesson.getName());
            ps.setString(4, lesson.getTitle());
            ps.setString(5, lesson.getDescription());
            ps.setString(6, lesson.getVideo());
            ps.setInt(7, lesson.getLessonID());
            ps.execute();
        } catch (Exception e) {
        }
    }

    public Lesson getLessonByLessonID(int LessonID) {
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM [Lesson] WHERE LessonID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, LessonID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Lesson(rs.getInt("LessonID"), rs.getInt("LessonNum"), rs.getInt("CourseID"), rs.getString("Name"),
                        rs.getString("Title"), rs.getString("Description"), rs.getString("Video"));
            }
        } catch (Exception e) {
        }
        return lesson;
    }

    public Lesson getLastLessonNum(int courseID) {
        Lesson lesson = null;
        try {
            String sql = "select top 1.* from Lesson where CourseID = ? order by LessonNum desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Lesson(rs.getInt("LessonID"), rs.getInt("LessonNum"), rs.getInt("CourseID"), rs.getString("Name"),
                        rs.getString("Title"), rs.getString("Description"), rs.getString("Video"));
            }
        } catch (Exception e) {
        }
        return lesson;
    }

    //Insert Lesson at last
    public void insertLesson(Lesson lesson) {

        try {
            String sql = "insert into Lesson ( LessonNum, CourseID, Name, Title, Description, Video) values (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson.getLessonNum());
            ps.setInt(2, lesson.getCourseID());
            ps.setString(3, lesson.getName());
            ps.setString(4, lesson.getTitle());
            ps.setString(5, lesson.getDescription());
            ps.setString(6, lesson.getVideo());
            ps.execute();
        } catch (Exception e) {
        }
    }

    //Insert Lesson with Number into Database
    public int insertLessonNum(int LessonNum, int CourseID) {
        int k = 0;
        try {
            String sql = "select LessonID,LessonNum from Lesson where CourseID=? and LessonNum>=? order by LessonNum desc";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ps.setInt(2, LessonNum);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");

                int LessonNumber = rs.getInt("LessonNum");

                String sqlupdate = "update Lesson set LessonNum=? where LessonID=?";
                PreparedStatement psupdate = connection.prepareStatement(sqlupdate);
                psupdate.setInt(1, LessonNumber + 1);
                psupdate.setInt(2, LessonID);
                psupdate.executeUpdate();

            }
            Lesson l = new Lesson(0, LessonNum, CourseID, null, null, null, null);
            insertLesson(l);
        } catch (SQLException e) {
            return -1;
        }
        return k;
    }

    public int deleteLessonNum(int LessonNum, int CourseID) {
        int k = 0;
        try {
            String sqldelete = "delete from Lesson where LessonNum=? and CourseID=?";
            PreparedStatement psdelete = connection.prepareStatement(sqldelete);
            psdelete.setInt(1, LessonNum);
            psdelete.setInt(2, CourseID);
            psdelete.executeUpdate();
            String sql = "select LessonID,LessonNum from Lesson where CourseID=? and LessonNum>=? order by LessonNum asc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ps.setInt(2, LessonNum);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNumber = rs.getInt("LessonNum");
                String sqlupdate = "update Lesson set LessonNum=? where LessonID=?";
                PreparedStatement psupdate = connection.prepareStatement(sqlupdate);
                psupdate.setInt(1, LessonNumber - 1);
                psupdate.setInt(2, LessonID);
                psupdate.executeUpdate();

            }
        } catch (SQLException e) {
            return -1;
        }
        return k;
    }

    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();
//        ArrayList<Lesson> list = dao.getAllLessonByCourseID(1);
        System.out.println(dao.getNumberOfLessonsOfCourse(1));
        
    }

}
