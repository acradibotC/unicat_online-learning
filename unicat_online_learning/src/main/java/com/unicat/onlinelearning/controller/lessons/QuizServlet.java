/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.lessons;

import static com.unicat.onlinelearning.controller.lessons.LessonDetail.lessonDAO;
import com.unicat.onlinelearning.dao.AnswerDAO;
import com.unicat.onlinelearning.dao.CoursesDAO;
import com.unicat.onlinelearning.dao.QuestionDAO;
import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.Question;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Anhnt206
 */
@WebServlet("/Quiz")
public class QuizServlet extends HttpServlet {

    public static QuestionDAO questionDAO = new QuestionDAO();
    public static AnswerDAO answerDAO = new AnswerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int lessonId = 1;
        ArrayList<Question> questions = questionDAO.getAllQuestionByLessonId(lessonId);

        req.setAttribute("questions", questions);
        req.setAttribute("answerDAO", answerDAO);
        req.setAttribute("questionIndex", 0);
        RequestDispatcher view = req.getRequestDispatcher("quiz.jsp");
        view.forward(req, resp);
    }

}
