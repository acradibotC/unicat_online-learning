
package com.unicat.onlinelearning.dto;

import java.sql.Timestamp;


public class ReviewFeedback {
    private int ReviewFeedbackID;
    private int ReviewID;
    private String ReviewFeedbackContent;
    private Timestamp ReviewFeedbackDate;

    public ReviewFeedback() {
    }

    public ReviewFeedback(int ReviewFeedbackID, int ReviewID, String ReviewFeedbackContent, Timestamp ReviewFeedbackDate) {
        this.ReviewFeedbackID = ReviewFeedbackID;
        this.ReviewID = ReviewID;
        this.ReviewFeedbackContent = ReviewFeedbackContent;
        this.ReviewFeedbackDate = ReviewFeedbackDate;
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

    public String getReviewFeedbackContent() {
        return ReviewFeedbackContent;
    }

    public void setReviewFeedbackContent(String ReviewFeedbackContent) {
        this.ReviewFeedbackContent = ReviewFeedbackContent;
    }

    public Timestamp getReviewFeedbackDate() {
        return ReviewFeedbackDate;
    }

    public void setReviewFeedbackDate(Timestamp ReviewFeedbackDate) {
        this.ReviewFeedbackDate = ReviewFeedbackDate;
    }

    @Override
    public String toString() {
        return "ReviewFeedback{" + "ReviewFeedbackID=" + ReviewFeedbackID + ", ReviewID=" + ReviewID + ", ReviewFeedbackContent=" + ReviewFeedbackContent + ", ReviewFeedbackDate=" + ReviewFeedbackDate + '}';
    }
    
    
}
