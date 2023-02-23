package com.unicat.onlinelearning.controller;

import com.unicat.onlinelearning.dao.BlogDAO;
import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/courses/paging")
public class Courses_Pagination extends HttpServlet {

    public static CategoryDAO CategoryDAO = new CategoryDAO();
    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static UserDAO UserDAO = new UserDAO();
    public static BlogDAO BlogDAO = new BlogDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("StatusHome", 3);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.setAttribute("CoursesDAO", CoursesDAO);
        req.setAttribute("UserDAO", UserDAO);
        req.setAttribute("BlogDAO", BlogDAO);

        String CategoryIDString = req.getParameter("CategoryID");
        int CategoryID;
        if (CategoryIDString == null) {
            CategoryID = 0;
        } else {
            try {
                CategoryID = Integer.parseInt(req.getParameter("CategoryID"));
                if (CategoryID < 0)
                    throw new Exception();
                if (CategoryID > CategoryDAO.getAllCategory().size())
                    CategoryID = CategoryDAO.getAllCategory().size();
            } catch (Exception e) {
                CategoryID = 0;
            }
        }

        //Paging
        int page, size, numPerPage = 4;
        ArrayList<com.unicat.onlinelearning.dto.Course> AllCourse;
        if (CategoryID == 0) {
            AllCourse = CoursesDAO.getAllCourseSearching(req.getParameter("Name"));
        } else {
            AllCourse = CoursesDAO.getAllCourseSearchingByCategoryID(CategoryID, req.getParameter("Name"));
        }

        size = AllCourse.size();
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
        if (AllCourse.isEmpty()) {
          list = null;  
        } else list = CoursesDAO.getListBySearching(AllCourse, start, end);
        req.setAttribute("list", list);
        req.setAttribute("page", page);
        req.setAttribute("number", number);
        //End Paging
        
        req.setAttribute("AllCourse", AllCourse);
        req.setAttribute("CategoryID", CategoryID);
        req.setAttribute("NameSearch", req.getParameter("Name"));
        req.getRequestDispatcher("/courses.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
