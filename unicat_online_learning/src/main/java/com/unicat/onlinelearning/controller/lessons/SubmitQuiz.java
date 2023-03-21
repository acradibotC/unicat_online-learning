/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.controller.lessons;

import static com.unicat.onlinelearning.controller.lessons.QuizServlet.answerDAO;
import static com.unicat.onlinelearning.controller.lessons.QuizServlet.questionDAO;
import static com.unicat.onlinelearning.controller.lessons.QuizServlet.rand;
import com.unicat.onlinelearning.dao.AnswerDAO;
import com.unicat.onlinelearning.dao.QuestionDAO;
import com.unicat.onlinelearning.dto.Answer;
import com.unicat.onlinelearning.dto.Question;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;

/**
 *
 * @author Anhnt206
 */
@WebServlet("/QuizResult")
public class SubmitQuiz extends HttpServlet {

    public static QuestionDAO questionDAO = new QuestionDAO();
    public static AnswerDAO answerDAO = new AnswerDAO();
    public static SecureRandom rand = new SecureRandom();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lessonId = (int) req.getSession().getAttribute("lessonId");
        ArrayList<Question> questions = questionDAO.getAllQuestionByLessonId(lessonId);
        int score = 0;
        int index = 0;
        for (Question question : questions) {
            int selectedOption = Integer.parseInt(req.getParameter("q" + index));
            if (selectedOption == question.getCorrectAnswer()) {
                score++;
            }
            index++;
        }
        req.setAttribute("score", Math.round(score*100/questions.size()));
        req.setAttribute("questions", questions);
        req.setAttribute("answerDAO", answerDAO);
        req.setAttribute("random", rand);
        req.setAttribute("currentLessonNum", req.getSession().getAttribute("currentLessonNum"));
        RequestDispatcher view = req.getRequestDispatcher("Result.jsp");
        view.forward(req, resp);
    }

}
