
package com.unicat.onlinelearning.controller.course;

import com.unicat.onlinelearning.dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/tutor/manager/course/add")
public class Course_Manager_Insert_Transaction extends HttpServlet {

    public static CategoryDAO CategoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("CategoryDAO", CategoryDAO);
        req.getRequestDispatcher("/course_manager_insert_transaction.jsp").forward(req, resp);
    }

}
