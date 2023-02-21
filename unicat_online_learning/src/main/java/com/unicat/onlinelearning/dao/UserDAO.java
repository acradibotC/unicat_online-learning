/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.utils.DBContext;
import com.unicat.onlinelearning.dto.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

//    public String randomString(int n) {
//        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//                + "0123456789"
//                + "abcdefghijklmnopqrstuvxyz";
//        StringBuilder sb = new StringBuilder(n);
//        for (int i = 0; i < n; i++) {
//            int index
//                    = (int) (AlphaNumericString.length()
//                    * Math.random());
//            sb.append(AlphaNumericString
//                    .charAt(index));
//        }
//        return sb.toString();
//    }
    public User getUser(String uname, String pass) {
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
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date Dob = rs.getDate("Dob");

                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FaceBookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                user = new User(UserID, UserName, PassWord, FullName, Image, Email, Dob, Phone, Address, FaceBookID, GmailID, RoleID, Status);

            }
        } catch (SQLException e) {

        }
        return user;
    }

    public User checkUser(String uname, String email) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where UserName= ? or Email= ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date Dob = rs.getDate("Dob");
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FaceBookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                user = new User(UserID, UserName, PassWord, FullName, Image, Email, Dob, Phone, Address, FaceBookID, GmailID, RoleID, Status);

            }
        } catch (SQLException e) {
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = null;
        try {
            String sql = "SELECT * FROM [User] where Email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date Dob = rs.getDate("Dob");
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FaceBookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                user = new User(UserID, UserName, PassWord, FullName, Image, Email, Dob, Phone, Address, FaceBookID, GmailID, RoleID, Status);
            }
        } catch (SQLException e) {

        }
        return user;
    }

    public int insertUser(User u) {
        int kt = 0;
        try {
            String sql = "INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], \n"
                    + "  [Address],[FacebookID],[GmailID], [RoleID], [Status]) \n"
                    + "VALUES ( ?, ?, ?, ?, ?, ?,\n"
                    + " ?,?,?,?, 3, 1)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassWord());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getImage());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getDob().toString());
            ps.setString(7, u.getPhone());
            ps.setString(8, u.getAddress());
            ps.setString(9, u.getFaceBookID());
            ps.setString(10, u.getGmailID());
            kt = ps.executeUpdate();
        } catch (SQLException e) {
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

                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date Dob = rs.getDate("Dob");
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FaceBookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                user = new User(UserID, UserName, PassWord, FullName, Image, Email, Dob, Phone, Address, FaceBookID, GmailID, RoleID, Status);

            }
        } catch (SQLException e) {
        }
        return user;
    }

    public int UpdateUser(User u) {
        int k = 0;
        try {
            String sql = "update [User]\n"
                    + "set [PassWord]=?,Phone=?,DOB=?,FullName=?,[Address]=?\n"
                    + "where UserID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getPassWord());
            ps.setString(2, u.getPhone());
            ps.setString(3, u.getDob().toString());
            ps.setString(4, u.getFullName());
            ps.setString(5, u.getAddress());
            ps.setInt(6, u.getUserID());
            k = ps.executeUpdate();
        } catch (SQLException e) {
        }
        return k;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();

        System.out.println(ud.getUserByUserID(1));
    }
}
