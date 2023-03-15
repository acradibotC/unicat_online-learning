/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Anhnt206
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Question {
    private int QuestionID;
    private int QuestionNum;
    private int LessonId;
    private String Content;
    private int CorrectAnswer;
}
