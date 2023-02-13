/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.utils.DBContext;
import com.unicat.onlinelearning.dto.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public User getAccount(String uname, String pass) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where UserName= ? and PassWord= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String Phone = rs.getString("Phone");
                Date Dob = rs.getDate("Dob");
                int Admin = rs.getInt("Admin");
                int Student = rs.getInt("Student");
                String Name = rs.getString("Name");
                String Gmail = rs.getString("Gmail");
                user = new User(UserID, UserName, PassWord, Phone, Dob, Admin, Student, Name, Gmail);
            }
        } catch (SQLException e) {

        }
        return user;
    }

    public boolean checkUser(String uname, String gmail) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where UserName= ? or Gmail= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, gmail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String Phone = rs.getString("Phone");
                Date Dob = rs.getDate("Dob");
                int Admin = rs.getInt("Admin");
                int Student = rs.getInt("Student");
                String Name = rs.getString("Name");
                String Gmail = rs.getString("Gmail");
                user = new User(UserID, UserName, PassWord, Phone, Dob, Admin, Student, Name, Gmail);
            }
        } catch (SQLException e) {
        }
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where Gmail = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String Phone = rs.getString("Phone");
                Date Dob = rs.getDate("Dob");
                int Admin = rs.getInt("Admin");
                int Student = rs.getInt("Student");
                String Name = rs.getString("Name");
                String Gmail = rs.getString("Gmail");
                user = new User(UserID, UserName, PassWord, Phone, Dob, Admin, Student, Name, Gmail);
            }
        } catch (SQLException e) {

        }
        return user;
    }

    public int insertUser(User u) {
        int kt = 0;
        try {
            String sql = "  insert [User] ( [UserName],[Gmail], [PassWord], [Phone], [Dob], [Admin], [Student], [Name]) "
                    + "values(?,?,?,?,?,0,1,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getGmail());
            ps.setString(3, u.getPassWord());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getDob().toString());
            ps.setString(6, u.getName());
            kt = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kt;
    }

    public int UpdateUser(User u) {
        int k = 0;
        try {
            String sql = "update [User]\n"
                    + "  set [PassWord]=?,Phone=?,Dob=?,[Name]=?\n"
                    + "  where UserID=?";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, u.getPassWord());

            ps.setString(2, u.getPhone());
            ps.setString(3, u.getDob().toString());
            ps.setString(4, u.getName());
            ps.setInt(5, u.getUserID());
            k = ps.executeUpdate();
        } catch (Exception e) {
        }
        return k;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();

        User u = new User(6, "sd2", "123", "0965689", Date.valueOf("2002-12-12"), 0, 1, "manh", "manh@gmail.com");
        System.out.println(ud.UpdateUser(u));
        System.out.println(ud.getUserByEmail("anhnthe153221@fpt.edu.vn"));
    }
}
