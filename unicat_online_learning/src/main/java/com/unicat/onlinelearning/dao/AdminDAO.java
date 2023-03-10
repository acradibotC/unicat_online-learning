/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class AdminDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public int UnPublishCourse(int CourseID) {
        int ck = 0;
        try {
            String sql1 = "select count(CourseID) as 'Number' from CourseEnroll where CourseID=?";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, CourseID);
            ResultSet rs1 = ps1.executeQuery();
            int n = 0;
            while (rs1.next()) {
                n = rs1.getInt("Number");
            }
            if (n != 0) {
                return 0;
            } else {
                String sql2 = "Update Course set PublishStatus=0 where CourseID=?";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, CourseID);
                ck = ps2.executeUpdate();
            }
        } catch (SQLException e) {
        }
        return ck;
    }

    public int PublishCourse(int CourseID) {
        int ck = 0;
        try {
            String sql = "Update Course set PublishStatus=1 where CourseID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ck = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return ck;
    }
    public static void main(String[] args) {
        AdminDAO ad=new AdminDAO();
        System.out.println(ad.UnPublishCourse(12));
    }
}
