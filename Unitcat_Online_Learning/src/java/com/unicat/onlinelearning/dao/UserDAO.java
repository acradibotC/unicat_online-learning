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
                int Phone = rs.getInt("Phone");
                Date Dob = rs.getDate("Dob");
                int Role = rs.getInt("Role");
                String Name = rs.getString("Name");
                user = new User(UserID, UserName, PassWord, Phone, Dob, Role, Name);
            }
        } catch (SQLException e) {

        }
        return user;
    }

    public boolean checkUser(String uname, int phone) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where UserName= ? or Phone= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setInt(2, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                int Phone = rs.getInt("Phone");
                Date Dob = rs.getDate("Dob");
                int Role = rs.getInt("Role");
                String Name = rs.getString("Name");
                user = new User(UserID, UserName, PassWord, Phone, Dob, Role, Name);
            }
        } catch (SQLException e) {
        }
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    public int insertUser(User u) {
        int kt=0;
        try {
            String sql = "insert into [User]\n"
                    + "  values (?,?,?,?,0,?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassWord());
            ps.setString(3, String.valueOf(u.getPhone()));
            ps.setString(4, u.getDob().toString());
            ps.setString(5, u.getName());
            kt = ps.executeUpdate();
        } catch (Exception e) {
        }
        return kt;
    }
    
    public User getUserByUserID(int UserID) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where UserID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                int Phone = rs.getInt("Phone");
                Date Dob = rs.getDate("Dob");
                int Role = rs.getInt("Role");
                String Name = rs.getString("Name");
                user = new User(userID, UserName, PassWord, Phone, Dob, Role, Name);
            }
        } catch (SQLException e) {
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();    
        User u=new User(0,"test1","123",123123123,Date.valueOf("2002-12-12"),0, "le tuan 2");
        System.out.println(ud.insertUser(u));
    }
}
