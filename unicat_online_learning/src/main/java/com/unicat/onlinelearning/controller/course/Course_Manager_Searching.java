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

@WebServlet("/admin/manager/course/search")
public class Course_Manager_Searching extends HttpServlet {

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
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("UserRoleDAO", UserRoleDAO);
        req.setAttribute("UserDAO", UserDAO);

        int CategoryID = Integer.parseInt(req.getParameter("txtOption"));
        //Paging
        User user = null;
        ArrayList<com.unicat.onlinelearning.dto.Course> allCourse = null;

        // Role: Admin
        if (CategoryID == 0) {
            allCourse = CoursesDAO.getAllCourseSearchingWithStatusAndRequest(req.getParameter("txtNameSearch"), 1, "None");
        } else {
            allCourse = CoursesDAO.getAllCourseSearchingByCategoryIDWithStatusAndRequest(CategoryID, req.getParameter("txtNameSearch"), 1, "None");
        }

        int page, size, numPerPage = 6;

        size = allCourse.size();
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
        int NumRequest = CoursesDAO.getAllRequestPublishCourse().size() + CoursesDAO.getAllRequestUnPublishCourse().size();

        req.setAttribute("list", list);
        req.setAttribute("page", page);
        req.setAttribute("number", number);

        //End Paging
        req.setAttribute("p", "coursemanager");
        req.setAttribute("NumRequest", NumRequest);
        req.setAttribute("allCourse", allCourse);
        req.setAttribute("NameSearch", req.getParameter("txtNameSearch"));
        req.setAttribute("CategoryID", CategoryID);

        req.getRequestDispatcher("/course_manager.jsp").forward(req, resp);
    }

}
