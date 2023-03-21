package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseEnrollDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();
    
    public CourseEnroll getCourseEnrollByUserIDAndCourseID(int userID, int courseID) {
        try {
            String sql = "SELECT * FROM [CourseEnroll] WHERE UserID = ? AND CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, courseID);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
                return new CourseEnroll(rs.getInt("CourseEnrollID"), rs.getInt("UserID"), rs.getInt("CourseID"),
                        rs.getTimestamp("EnrollDate"), rs.getInt("LessonCurrent"), rs.getInt("CourseStatus"));
        } catch (Exception e) {
        }
        return null;
    }
    
   
    
    
    public static void main(String[] args) {
        CourseEnrollDAO dao = new CourseEnrollDAO();
        System.out.println(dao.getCourseEnrollByUserIDAndCourseID(3, 1));
    }
    
}
