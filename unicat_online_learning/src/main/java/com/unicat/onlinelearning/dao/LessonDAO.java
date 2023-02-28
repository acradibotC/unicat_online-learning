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
            String sql = "SELECT * FROM Lesson WHERE CourseID =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNum = rs.getInt("LessonNum");
                int  CourseID = rs.getInt("CourseID");
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
    
    public Lesson getLesson(int Id, int CourseId) {
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM Lesson WHERE LessonNum =? AND CourseID =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Id);
            ps.setInt(2,CourseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int LessonID = rs.getInt("LessonID");
                int LessonNum = rs.getInt("LessonNum");
                int  CourseID = rs.getInt("CourseID");
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
    
    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();
//        ArrayList<Lesson> list = dao.getAllLessonByCourseID(1);
        Lesson o = dao.getLesson(1,1);
        System.out.println(o);
    }

}
