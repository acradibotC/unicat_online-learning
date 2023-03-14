/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Answer;
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
public class AnswerDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();
    
    public ArrayList<Answer> getAllAnswerByQuestionId(int questionId) {
        ArrayList<Answer> answers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Answer] WHERE QuestionID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, questionId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int QuestionID = rs.getInt("QuestionID");
                int AnswerID = rs.getInt("AnswerID");
                String Answer = rs.getString("Answer");
                
                answers.add(new Answer(AnswerID, QuestionID, Answer));
            }
        } catch (SQLException e) {
        }
        return answers;
    }
    
}
