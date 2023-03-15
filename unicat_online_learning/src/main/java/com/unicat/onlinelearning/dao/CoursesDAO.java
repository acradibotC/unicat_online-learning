package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Course;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

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
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"),
                        rs.getString("Request")));
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
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public Course getCourseByLatestCourseID() {
        try {
            String sql = "SELECT TOP 1* FROM [Course] ORDER BY CourseID DESC ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Course> getAllCourseSearchingByCategoryIDAndUserID(int UserID, int CategoryID, String Search) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ? AND CategoryID = ? AND UserID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ps.setInt(2, CategoryID);
            ps.setInt(3, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
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
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseSearching(String Search) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
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
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request"));
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
            ps.setInt(2, UserID);
            ps.setInt(3, CourseID);
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

    public ArrayList<Course> getAllCourseByUserID(int UserID) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] where UserID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public void deleteCourseByCourseID(int courseID) {

        try {
            String sql = "DELETE FROM Course WHERE CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Insert Course
    public void insertCourse(Course course) {

        try {
            String sql = "insert into Course ( CategoryID, Name, Image, UserID, CourseInfo, Description, PublishStatus) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, course.getCategoryID());
            ps.setString(2, course.getName());
            ps.setString(3, course.getImage());
            ps.setInt(4, course.getUserID());
            ps.setString(5, course.getCourseInfo());
            ps.setString(6, course.getDescription());
            ps.setInt(7, course.getPublishStatus());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateCourse(Course course) {
        try {
            String sql = "update [Course] "
                    + "set CategoryID=?, Name=?, Image=?, CourseInfo=?, Description=?, PublishStatus = ? ,Request=? where CourseID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, course.getCategoryID());
            ps.setString(2, course.getName());
            ps.setString(3, course.getImage());
            ps.setString(4, course.getCourseInfo());
            ps.setString(5, course.getCourseInfo());
            ps.setInt(6, course.getPublishStatus());
            ps.setString(7, course.getRequest());
            ps.setInt(8, course.getCourseID());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // Publish Status
    public ArrayList<Course> getAllCourseWithStatus(int Status) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE PublishStatus = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseByCategoryIDWithStatus(int Status, int CategoryID) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE CategoryID = ? AND PublishStatus = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ps.setInt(2, Status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseSearchingWithStatus(String Search, int Status) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ? AND PublishStatus = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ps.setInt(2, Status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllCourseSearchingByCategoryIDWithStatus(int CategoryID, String Search, int Status) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String temp = null;
            String sql = "SELECT * FROM [Course] WHERE [Name] LIKE ? AND CategoryID = ? AND PublishStatus = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Search + "%");
            ps.setInt(2, CategoryID);
            ps.setInt(3, Status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getFewLatestCourseWithStatus(int num, int Status) {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT TOP " + num + "* FROM [Course] WHERE PublishStatus = ? ORDER BY CourseID DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"), rs.getString("Request")));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public ArrayList<Course> getAllPublishCourse() {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] where PublishStatus =1  and Request='None'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"),
                        rs.getString("Request")));
            }
        } catch (SQLException e) {
        }
        return List;
    }

    public ArrayList<Course> getAllRequestPublishCourse() {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] where Request='RequestPublish' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"),
                        rs.getString("Request")));
            }
        } catch (SQLException e) {
        }
        return List;
    }

    public ArrayList<Course> getAllRequestUnPublishCourse() {
        ArrayList<Course> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Course] where Request='RequestUnPublish' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Course(rs.getInt("CourseID"), rs.getInt("CategoryID"), rs.getString("Name"), rs.getString("Image"),
                        rs.getInt("UserID"), rs.getString("CourseInfo"), rs.getString("Description"), rs.getInt("PublishStatus"),
                        rs.getString("Request")));
            }
        } catch (SQLException e) {
        }
        return List;
    }

    // End PublishStatus

    
    public String getCourseNameByCourseID(int CourseID) {
        try {
            String sql = "SELECT * FROM [Course] WHERE CourseID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                return rs.getString("Name");
            }
        } catch (Exception e) {
        }
        return null;
    }
   
    
    public static void main(String[] args) {
        CoursesDAO dao = new CoursesDAO();
        Course c = dao.getCourseByCourseID(1);
        c.setPublishStatus(1);
        c.setRequest("None");

        //System.out.println(dao.getFewLatestCourse(1).size());
        
        //System.out.println(dao.getCourseByCourseID(5).getName());
        //System.out.println(dao.getAllCourseByCategoryID(1).size());

    }
}
