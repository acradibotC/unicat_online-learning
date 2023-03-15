/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

/**
 *
 * @author tuanm
 */
public class Course {
    private int CourseID;
    private int CategoryID;
    private String Name;
    private String Image;
    private int UserID;
    private String CourseInfo;
    private String Description;
    private int PublishStatus;
    private String Request;

    public Course() {
    }

    public Course(int CourseID, int CategoryID, String Name, String Image, int UserID, String CourseInfo, String Description, int PublishStatus,String Request) {
        this.CourseID = CourseID;
        this.CategoryID = CategoryID;
        this.Name = Name;
        this.Image = Image;
        this.UserID = UserID;
        this.CourseInfo = CourseInfo;
        this.Description = Description;
        this.PublishStatus = PublishStatus;
        this.Request=Request;
    }

    public String getRequest() {
        return Request;
    }

    public void setRequest(String Request) {
        this.Request = Request;
    }
    
    public int getCourseID() {
        return CourseID;
    }

    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getCourseInfo() {
        return CourseInfo;
    }

    public void setCourseInfo(String CourseInfo) {
        this.CourseInfo = CourseInfo;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getPublishStatus() {
        return PublishStatus;
    }

    public void setPublishStatus(int PublishStatus) {
        this.PublishStatus = PublishStatus;
    }

    @Override
    public String toString() {
        return "Course{" + "CourseID=" + CourseID + ", CategoryID=" + CategoryID + ", Name=" + Name + ", Image=" + Image + ", UserID=" + UserID + ", CourseInfo=" + CourseInfo + ", Description=" + Description + ", PublishStatus=" + PublishStatus + '}';
    }
    
    
}
