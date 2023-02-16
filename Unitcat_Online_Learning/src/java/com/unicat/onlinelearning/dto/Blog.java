/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

import java.util.Date;

/**
 *
 * @author tuanm
 */
public class Blog {

    private int BlogID;
    private int UserID;
    private String BlogTitler;
    private String BlogImage;
    private String BlogDescription;
    private Date PostDate;

    public Blog() {
    }

    public Blog(int BlogID, int UserID, String BlogTitler, String BlogImage, String BlogDescription, Date PostDate) {
        this.BlogID = BlogID;
        this.UserID = UserID;
        this.BlogTitler = BlogTitler;
        this.BlogImage = BlogImage;
        this.BlogDescription = BlogDescription;
        this.PostDate = PostDate;
    }

    public String getBlogDescription() {
        return BlogDescription;
    }

    public void setBlogDescription(String BlogDescription) {
        this.BlogDescription = BlogDescription;
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

    public String getBlogTitler() {
        return BlogTitler;
    }

    public void setBlogTitler(String BlogTitler) {
        this.BlogTitler = BlogTitler;
    }

    public String getBlogImage() {
        return BlogImage;
    }

    public void setBlogImage(String BlogImage) {
        this.BlogImage = BlogImage;
    }

    public Date getPostDate() {
        return PostDate;
    }

    public void setPostDate(Date PostDate) {
        this.PostDate = PostDate;
    }

    @Override
    public String toString() {
        return "Blog{" + "BlogID=" + BlogID + ", UserID=" + UserID + ", BlogTitler=" + BlogTitler + ", BlogImage=" + BlogImage + ", BlogDescription=" + BlogDescription + ", PostDate=" + PostDate + '}';
    }

}
