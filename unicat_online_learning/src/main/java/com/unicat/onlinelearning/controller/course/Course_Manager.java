package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/manager/course")
public class Course_Manager extends HttpServlet {

    public static UserDAO UserDAO = new UserDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("tutor") != null || req.getSession().getAttribute("admin") != null) {
            req.setAttribute("CoursesDAO", CoursesDAO);
            req.setAttribute("CategoryDAO", CategoryDAO);
            req.setAttribute("UserRoleDAO", UserRoleDAO);
            req.setAttribute("UserDAO", UserDAO);
            req.setAttribute("CategoryID", 0);

            User user = null;
            ArrayList<com.unicat.onlinelearning.dto.Course> allCourse = null;

            if (req.getSession().getAttribute("tutor") != null) {
                user = (User) req.getSession().getAttribute("tutor");
                allCourse = CoursesDAO.getAllCourseByUserID(user.getUserID());
            } else {
                allCourse = CoursesDAO.getAllPublishedCourse(); 
            }   

            //Paging
            int page, numPerPage = 6;
            int size = allCourse.size();
            int number = (size % numPerPage == 0 ? (size / numPerPage) : ((size / numPerPage) + 1));
            String xpage = req.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                try {
                    page = Integer.parseInt(xpage);
                    if (page < 1) {
                        throw new Exception();
                    }
                    if (page > number) {
                        page = number;
                    }
                } catch (Exception e) {
                    page = 1;
                }
            }
            int start = (page - 1) * numPerPage;
            int end = Math.min(page * numPerPage, size);
            ArrayList<com.unicat.onlinelearning.dto.Course> list;
            if (allCourse.isEmpty()) {
                list = null;
            } else {
                list = CoursesDAO.getListBySearching(allCourse, start, end);
            }
            req.setAttribute("allCourse", allCourse);
            req.setAttribute("list", list);
            req.setAttribute("page", page);
            req.setAttribute("number", number);
            //End Paging
            req.setAttribute("p", "coursemanager");
            int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();
            req.setAttribute("NumRequest", NumRequest);
            req.getRequestDispatcher("/course_manager.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = null;

        //user = (User) req.getSession().getAttribute("admin");
        // Set Status Course
        // Set Status = 1
        if (req.getParameter("txtStatusPublish").equalsIgnoreCase("Publish")) {
            com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
            course.setPublishStatus(1);
            course.setRequest("None");
            CoursesDAO.updateCourse(course);
            resp.sendRedirect(req.getContextPath() + "/admin/manager/request?view=RequestPublish");
        }

        // Set Status = 0
        if (req.getParameter("txtStatusPublish").equalsIgnoreCase("UnPublish")) {
            com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
            course.setPublishStatus(0);
            if(CoursesDAO.getNumberUserEnroll(course.getCourseID())>0){
                course.setRequest("Updating");
            }else{
                course.setRequest("None");
            }
            
            CoursesDAO.updateCourse(course);
            resp.sendRedirect(req.getContextPath() + "/admin/manager/request?view=RequestUnPublish");
        }
        if (req.getParameter("txtStatusPublish").equalsIgnoreCase("CancelPublish")) {
            com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
            course.setPublishStatus(0);
            if(CoursesDAO.getNumberUserEnroll(course.getCourseID())>0){
                course.setRequest("Updating");
            }else{
                course.setRequest("None");
            }
            
            CoursesDAO.updateCourse(course);
            String Role = req.getParameter("Role");
            if (Role.equals("Admin")) {
                resp.sendRedirect(req.getContextPath() + "/admin/manager/request?view=RequestPublish");
            } else {
                String NowPage = "";
                if (req.getParameter("NowPage") != null) {
                    NowPage = req.getParameter("NowPage");
                }
                if (NowPage.equals("View")) {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + course.getCourseID());
                } else {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/request?view=RequestPublish");
                }

            }

        }
        if (req.getParameter("txtStatusPublish").equalsIgnoreCase("CancelUnPublish")) {
            com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
            course.setPublishStatus(1);
            course.setRequest("None");
            CoursesDAO.updateCourse(course);
            String Role = req.getParameter("Role");
            if (Role.equals("Admin")) {
                resp.sendRedirect(req.getContextPath() + "/admin/manager/request?view=RequestUnPublish");
            } else {
                String NowPage = "";
                if (req.getParameter("NowPage") != null) {
                    NowPage = req.getParameter("NowPage");
                }
                if (NowPage.equals("View")) {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/course?page=view&CourseID=" + course.getCourseID());
                } else {
                    resp.sendRedirect(req.getContextPath() + "/tutor/manager/request?view=RequestUnPublish");
                }
            }
        }

    }

}
