
package com.unicat.onlinelearning.dto;

import java.sql.Timestamp;
import java.util.Date;


public class BlogFeedback {
    private int BlogFeedbackID;
    private int BlogID;
    private int UserID;
    private String BlogFeedbackContent;
    private Timestamp BlogFeedbackDate;

    public BlogFeedback() {
    }

    public BlogFeedback(int BlogFeedbackID, int BlogID, int UserID, String BlogFeedbackContent, Timestamp BlogFeedbackDate) {
        this.BlogFeedbackID = BlogFeedbackID;
        this.BlogID = BlogID;
        this.UserID = UserID;
        this.BlogFeedbackContent = BlogFeedbackContent;
        this.BlogFeedbackDate = BlogFeedbackDate;
    }

    public int getBlogFeedbackID() {
        return BlogFeedbackID;
    }

    public void setBlogFeedbackID(int BlogFeedbackID) {
        this.BlogFeedbackID = BlogFeedbackID;
    }

    public int getBlogID() {
        return BlogID;
    }

    public void setBlogID(int BlogID) {
        this.BlogID = BlogID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getBlogFeedbackContent() {
        return BlogFeedbackContent;
    }

    public void setBlogFeedbackContent(String BlogFeedbackContent) {
        this.BlogFeedbackContent = BlogFeedbackContent;
    }

    public Timestamp getBlogFeedbackDate() {
        return BlogFeedbackDate;
    }

    public void setBlogFeedbackDate(Timestamp BlogFeedbackDate) {
        this.BlogFeedbackDate = BlogFeedbackDate;
    }

    @Override
    public String toString() {
        return "BlogFeedback{" + "BlogFeedbackID=" + BlogFeedbackID + ", BlogID=" + BlogID + ", UserID=" + UserID + ", BlogFeedbackContent=" + BlogFeedbackContent + ", BlogFeedbackDate=" + BlogFeedbackDate + '}';
    }
    
}
