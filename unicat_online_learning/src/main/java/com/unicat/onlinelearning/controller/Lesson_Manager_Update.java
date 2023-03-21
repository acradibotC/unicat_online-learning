/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller;


import com.unicat.onlinelearning.dao.LessonDAO;
import com.unicat.onlinelearning.dto.Lesson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author User
 */
@WebServlet("/admin/manager/lesson/update")
public class Lesson_Manager_Update extends HttpServlet {
    public static LessonDAO LessonDAO = new LessonDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Lesson lesson = LessonDAO.getLessonByLessonID(Integer.parseInt(req.getParameter("txtLessonID")));
        req.setAttribute("lesson", lesson);
        req.getRequestDispatcher("/lesson_manager_update.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/home");
    }
    
}
