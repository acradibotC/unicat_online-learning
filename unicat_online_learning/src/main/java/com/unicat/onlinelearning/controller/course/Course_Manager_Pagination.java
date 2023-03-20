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

@WebServlet("/admin/manager/course/paging")
public class Course_Manager_Pagination extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static UserRoleDAO UserRoleDAO = new UserRoleDAO();
    public static UserDAO UserDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("tutor") != null || req.getSession().getAttribute("admin") != null) {
            req.setAttribute("CoursesDAO", CoursesDAO);
            req.setAttribute("CategoryDAO", CategoryDAO);
            req.setAttribute("UserRoleDAO", UserRoleDAO);
            req.setAttribute("UserDAO", UserDAO);
            int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();
            String CategoryIDString = req.getParameter("CategoryID");
            int CategoryID;
            if (CategoryIDString == null) {
                CategoryID = 0;
            } else {
                try {
                    CategoryID = Integer.parseInt(CategoryIDString);
                    if (CategoryID < 0) {
                        throw new Exception();
                    }
                    if (CategoryID > CategoryDAO.getAllCategory().size()) {
                        CategoryID = CategoryDAO.getAllCategory().size();
                    }
                } catch (Exception e) {
                    CategoryID = 0;
                }
            }

            //Paging
            User user = null;
            ArrayList<com.unicat.onlinelearning.dto.Course> allCourse = null;

            // Role: Admin
            if (CategoryID == 0) {
                allCourse = CoursesDAO.getAllCourseSearchingWithStatusAndRequest(req.getParameter("Name"), 1, "None");
            } else {
                allCourse = CoursesDAO.getAllCourseSearchingByCategoryIDWithStatusAndRequest(CategoryID, req.getParameter("Name"), 1, "None");
            }

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
            req.setAttribute("NumRequest", NumRequest);
            req.setAttribute("p", "coursemanager");
            req.setAttribute("NameSearch", req.getParameter("Name"));
            req.setAttribute("CategoryID", CategoryID);
            req.getRequestDispatcher("/course_manager.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
