/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

/**
 *
 * @author tuanm
 */
public class Review {

    private int ReviewID;
    private int UserID;
    private int CourseID;
    private int Vote;

    public Review() {
    }

    public Review(int ReviewID, int UserID, int CourseID, int Vote) {
        this.ReviewID = ReviewID;
        this.UserID = UserID;
        this.CourseID = CourseID;
        this.Vote = Vote;
    }

    public int getReviewID() {
        return ReviewID;
    }

    public void setReviewID(int ReviewID) {
        this.ReviewID = ReviewID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public int getVote() {
        return Vote;
    }

    public void setVote(int Vote) {
        this.Vote = Vote;
    }

    @Override
    public String toString() {
        return "Review{" + "ReviewID=" + ReviewID + ", UserID=" + UserID + ", CourseID=" + CourseID + ", Vote=" + Vote + '}';
    }

}
