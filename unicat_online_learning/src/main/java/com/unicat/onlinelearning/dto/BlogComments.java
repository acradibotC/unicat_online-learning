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
public class BlogComments {
    private int BlogCommentID;
    private int BlogFeedbackID;
    private int UserID;
    private String BlogCommentContent;
    private Timestamp BlogCommentDate;

    public BlogComments() {
    }

    public BlogComments(int BlogCommentID, int BlogFeedbackID, int UserID, String BlogCommentContent, Timestamp BlogCommentDate) {
        this.BlogCommentID = BlogCommentID;
        this.BlogFeedbackID = BlogFeedbackID;
        this.UserID = UserID;
        this.BlogCommentContent = BlogCommentContent;
        this.BlogCommentDate = BlogCommentDate;
    }

    public int getBlogCommentID() {
        return BlogCommentID;
    }

    public void setBlogCommentID(int BlogCommentID) {
        this.BlogCommentID = BlogCommentID;
    }

    public int getBlogFeedbackID() {
        return BlogFeedbackID;
    }

    public void setBlogFeedbackID(int BlogFeedbackID) {
        this.BlogFeedbackID = BlogFeedbackID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getBlogCommentContent() {
        return BlogCommentContent;
    }

    public void setBlogCommentContent(String BlogCommentContent) {
        this.BlogCommentContent = BlogCommentContent;
    }

    public Timestamp getBlogCommentDate() {
        return BlogCommentDate;
    }

    public void setBlogCommentDate(Timestamp BlogCommentDate) {
        this.BlogCommentDate = BlogCommentDate;
    }

    @Override
    public String toString() {
        return "BlogComments{" + "BlogCommentID=" + BlogCommentID + ", BlogFeedbackID=" + BlogFeedbackID + ", UserID=" + UserID + ", BlogCommentContent=" + BlogCommentContent + ", BlogCommentDate=" + BlogCommentDate + '}';
    }
    
}
