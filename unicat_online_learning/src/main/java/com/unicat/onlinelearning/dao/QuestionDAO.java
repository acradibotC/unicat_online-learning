/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Lesson;
import com.unicat.onlinelearning.dto.Question;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Anhnt206
 */
public class QuestionDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();

    public ArrayList<Question> getAllQuestionByLessonId(int lessonId) {
        ArrayList<Question> questions = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Question] WHERE LessonID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lessonId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int QuestionID = rs.getInt("QuestionID");
                int QuestionNum = rs.getInt("QuestionNum");
                int LessonID = rs.getInt("LessonID");
                String Content = rs.getString("Content");
                int CorrectAnswer = rs.getInt("CorrectAnswer");

                questions.add(new Question(QuestionID, QuestionNum, LessonID, Content, CorrectAnswer));
            }
        } catch (SQLException e) {
        }
        return questions;
    }

    public Question getQuestion(int questionNum, int lessonId) {
        Question question = null;
        try {
            String sql = "SELECT * \n"
                    + "  FROM [dbo].[Question] WHERE LessonID = ? AND QuestionNum = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, questionNum);
            ps.setInt(2, lessonId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int QuestionID = rs.getInt("QuestionID");
                int QuestionNum = rs.getInt("QuestionNum");
                int LessonID = rs.getInt("LessonID");
                String Content = rs.getString("Content");
                int CorrectAnswer = rs.getInt("CorrectAnswer");

                
                question = new Question(QuestionID, QuestionNum, LessonID, Content, CorrectAnswer);
            }
        } catch (SQLException e) {
        }
        return question;
    }

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        ArrayList list = dao.getAllQuestionByLessonId(1);
        for (Object object : list) {
            System.out.println(object);
        }
    }
}
