
package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/manager/update")
public class Course_Manager_Update_Transaction extends HttpServlet {

    public static CoursesDAO CoursesDAO = new CoursesDAO();
    public static CategoryDAO CategoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        com.unicat.onlinelearning.dto.Course course = CoursesDAO.getCourseByCourseID(Integer.parseInt(req.getParameter("txtCourseID")));
        req.setAttribute("course", course);
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.getRequestDispatcher("/course_manager_update_transaction.jsp").forward(req, resp);
    }

    
}
