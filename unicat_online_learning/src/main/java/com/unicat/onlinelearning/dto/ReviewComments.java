/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

import java.sql.Timestamp;

/**
 *
 * @author tuanm
 */
public class ReviewComments {
    private int ReviewCommentID;
    private int ReviewFeedbackID;
    private int ReviewID;
    private String ReviewCommentContent;
    private Timestamp ReviewCommentDate;

    public ReviewComments(int ReviewCommentID, int ReviewFeedbackID, int ReviewID, String ReviewCommentContent, Timestamp ReviewCommentDate) {
        this.ReviewCommentID = ReviewCommentID;
        this.ReviewFeedbackID = ReviewFeedbackID;
        this.ReviewID = ReviewID;
        this.ReviewCommentContent = ReviewCommentContent;
        this.ReviewCommentDate = ReviewCommentDate;
    }

    public ReviewComments() {
    }

    public int getReviewCommentID() {
        return ReviewCommentID;
    }

    public void setReviewCommentID(int ReviewCommentID) {
        this.ReviewCommentID = ReviewCommentID;
    }

    public int getReviewFeedbackID() {
        return ReviewFeedbackID;
    }

    public void setReviewFeedbackID(int ReviewFeedbackID) {
        this.ReviewFeedbackID = ReviewFeedbackID;
    }

    public int getReviewID() {
        return ReviewID;
    }

    public void setReviewID(int ReviewID) {
        this.ReviewID = ReviewID;
    }

    public String getReviewCommentContent() {
        return ReviewCommentContent;
    }

    public void setReviewCommentContent(String ReviewCommentContent) {
        this.ReviewCommentContent = ReviewCommentContent;
    }

    public Timestamp getReviewCommentDate() {
        return ReviewCommentDate;
    }

    public void setReviewCommentDate(Timestamp ReviewCommentDate) {
        this.ReviewCommentDate = ReviewCommentDate;
    }

    @Override
    public String toString() {
        return "ReviewComments{" + "ReviewCommentID=" + ReviewCommentID + ", ReviewFeedbackID=" + ReviewFeedbackID + ", ReviewID=" + ReviewID + ", ReviewCommentContent=" + ReviewCommentContent + ", ReviewCommentDate=" + ReviewCommentDate + '}';
    }

   
}
