package com.unicat.onlinelearning.controller.user;

import static com.unicat.onlinelearning.controller.course.Course_Manager.CoursesDAO;
import static com.unicat.onlinelearning.controller.user.ProfileController.lessonDAO;
import com.unicat.onlinelearning.dao.AdminDAO;
import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import com.unicat.onlinelearning.dao.UserRoleDAO;
import com.unicat.onlinelearning.dto.CourseEnroll;
import com.unicat.onlinelearning.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/manager/user")
public class User_Manager extends HttpServlet {
    
    public static UserDAO UserDAO = new UserDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();
    public static AdminDAO AdminDAO = new AdminDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("admin") != null) {
            req.setAttribute("UserDAO", UserDAO);
            req.setAttribute("CategoryDAO", CategoryDAO);
            req.setAttribute("UserRoleDAO", UserRoleDAO);
            String str = req.getParameter("ViewUserID");
            if (req.getParameter("ViewUserID") != null) {
                int ID = Integer.parseInt(str);
                User u = UserDAO.getUserByUserID(ID);
                
                ArrayList<CourseEnroll> ce = UserDAO.getAllCourseOfUser(ID);
                req.setAttribute("User", u);
                req.setAttribute("listcourseenroll", ce);
                req.setAttribute("LessonDAO", lessonDAO);
                
                req.getRequestDispatcher("/UserDetails.jsp").forward(req, resp);
            } else {
                int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();
                req.setAttribute("NumRequest", NumRequest);
                req.setAttribute("p", "usermanager");
                req.getRequestDispatcher("/User_Manager.jsp").forward(req, resp);
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Ban User
        if (req.getParameter("txtStatus").equalsIgnoreCase("Ban")) {
            AdminDAO.BanUser(Integer.parseInt(req.getParameter("txtUserID")));
            resp.sendRedirect(req.getContextPath() + "/admin/manager/user");
        }
        
        // Un Ban User
        if (req.getParameter("txtStatus").equalsIgnoreCase("UnBan")) {
            AdminDAO.UnBanUser(Integer.parseInt(req.getParameter("txtUserID")));
            resp.sendRedirect(req.getContextPath() + "/admin/manager/user");
        }
        
    }
    
}
