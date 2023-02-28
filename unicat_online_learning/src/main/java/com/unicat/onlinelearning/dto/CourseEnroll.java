/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class CourseEnroll {

    private int CourseEnrollID;
    private int UserID;
    private int CourseID;
    private Date EnrollDate;
    private int LessonCurrent;
    private int CourseStatus;
    private String CourseName;

    public CourseEnroll(int CourseEnrollID, int UserID, int CourseID, Date EnrollDate, int LessonCurrent, int CourseStatus) {
        this.CourseEnrollID = CourseEnrollID;
        this.UserID = UserID;
        this.CourseID = CourseID;
        this.EnrollDate = EnrollDate;
        this.LessonCurrent = LessonCurrent;
        this.CourseStatus = CourseStatus;
    }

    public CourseEnroll(int CourseEnrollID, int UserID, int CourseID, Date EnrollDate, int LessonCurrent, int CourseStatus, String CourseName) {
        this.CourseEnrollID = CourseEnrollID;
        this.UserID = UserID;
        this.CourseID = CourseID;
        this.EnrollDate = EnrollDate;
        this.LessonCurrent = LessonCurrent;
        this.CourseStatus = CourseStatus;
        this.CourseName = CourseName;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public CourseEnroll() {
    }

    public int getCourseEnrollID() {
        return CourseEnrollID;
    }

    public void setCourseEnrollID(int CourseEnrollID) {
        this.CourseEnrollID = CourseEnrollID;
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

    public Date getEnrollDate() {
        return EnrollDate;
    }

    public void setEnrollDate(Date EnrollDate) {
        this.EnrollDate = EnrollDate;
    }

    public int getLessonCurrent() {
        return LessonCurrent;
    }

    public void setLessonCurrent(int LessonCurrent) {
        this.LessonCurrent = LessonCurrent;
    }

    public int getCourseStatus() {
        return CourseStatus;
    }

    public void setCourseStatus(int CourseStatus) {
        this.CourseStatus = CourseStatus;
    }

}
