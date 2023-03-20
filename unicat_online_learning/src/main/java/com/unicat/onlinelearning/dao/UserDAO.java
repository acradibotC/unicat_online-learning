/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.utils.DBContext;
import com.unicat.onlinelearning.dto.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "Select * from [User]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date DOB = rs.getDate("DOB");
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FacebookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                list.add(new User(rs.getInt("UserID"), UserName, PassWord, FullName, Image, Email, DOB, Phone, Address, FaceBookID, GmailID, RoleID, Status));
            }
        } catch (Exception e) {
            return null;
        }
        return list;
    }

    public ArrayList<User> getAllUserExceptAdmin() {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "Select * from [User] WHERE RoleID > 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String UserName = rs.getString("UserName");
                String PassWord = rs.getString("PassWord");
                String FullName = rs.getString("FullName");
                String Image = rs.getString("Image");
                String Email = rs.getString("Email");
                Date DOB = rs.getDate("DOB");
                String Phone = rs.getString("Phone");
                String Address = rs.getString("Address");
                String FaceBookID = rs.getString("FacebookID");
                String GmailID = rs.getString("GmailID");
                int RoleID = rs.getInt("RoleID");
                int Status = rs.getInt("Status");
                list.add(new User(rs.getInt("UserID"), UserName, PassWord, FullName, Image, Email, DOB, Phone, Address, FaceBookID, GmailID, RoleID, Status));
            }
        } catch (Exception e) {
            return null;
        }
        return list;
    }

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

    public void deleteUser(String id) {
        String query = "delete from [User]\n"
                + "where UserID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int insertUser(User u) {
        int kt = 0;
        try {
            String sql = "INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], \n"
                    + "  [Address],[FacebookID],[GmailID], [RoleID], [Status]) \n"
                    + "VALUES ( ?, ?, ?, '', ?, ?,\n"
                    + " ?,?,?,?, 3, 1)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassWord());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getDob().toString());
            ps.setString(6, u.getPhone());
            ps.setString(7, u.getAddress());
            ps.setString(8, u.getFaceBookID());
            ps.setString(9, u.getGmailID());
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

    public ArrayList<User> getAllAdminUser() {
        ArrayList<User> Lists = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User] where RoleID = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
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
                Lists.add(new User(UserID, UserName, PassWord, FullName, Image, Email, Dob, Phone, Address, FaceBookID, GmailID, RoleID, Status));
            }
        } catch (SQLException e) {
        }
        return Lists;
    }

    public ArrayList<CourseEnroll> getAllCourseOfUser(int UserID) {
        ArrayList<CourseEnroll> List = new ArrayList<>();
        try {
            String sql = "  select ce.*,c.Name as 'CourseName' from CourseEnroll ce join Course c "
                    + "on ce.CourseID=c.CourseID where ce.UserID=? order by EnrollDate desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int CourseEnrollID = rs.getInt("CourseEnrollID");
                int CourseID = rs.getInt("CourseID");
                Date EnrollDate = rs.getDate("EnrollDate");
                int LessonCurrent = rs.getInt("LessonCurrent");
                int CourseStatus = rs.getInt("CourseStatus");
                String CourseName = rs.getString("CourseName");
                CourseEnroll ce = new CourseEnroll(CourseEnrollID, UserID, CourseID, EnrollDate, LessonCurrent, CourseStatus, CourseName);
                List.add(ce);
            }
        } catch (SQLException e) {
            return null;
        }
        return List;

    }

    public int insertSocialUser(User u) {
        int kt = 0;
        try {
            String sql = "INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], \n"
                    + "  [Address],[FacebookID],[GmailID], [RoleID], [Status]) \n"
                    + "VALUES ( ?, ?, ?, ?, ?, ?,\n"
                    + " ?, ?, ?, ?, 3, 1)";
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

    public ArrayList<User> getAllUserSearching(String Search) {
        ArrayList<User> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [User] WHERE [FullName] LIKE ? AND RoleID > 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new User(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("PassWord"), rs.getString("FullName"),
                        rs.getString("Image"), rs.getString("Email"), rs.getDate("DOB"), rs.getString("Phone"),
                        rs.getString("Address"), rs.getString("FacebookID"), rs.getString("GmailID"), rs.getInt("RoleID"), rs.getInt("Status")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    
    public ArrayList<User> getListBySearching(ArrayList<User> list, int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();

        //User u = new User(9, "sdd", "123", "NguyenMAnh", "", "manhdinh@gmail", Date.valueOf("2020-12-12"), "036541254", "VN", null, null, 3, 1);
        //System.out.println(ud.UpdateUser(u));
//        User user = new User(0, "", "", googlePojo.getName(), googlePojo.getPicture(), googlePojo.getEmail(), Date.valueOf(LocalDate.now()), "", "", "", googlePojo.getId(), 3, 1);
        System.out.println(ud.getAllCourseOfUser(6));

    }
}
