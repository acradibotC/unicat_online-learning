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
public class User {

    private int UserID;
    private String UserName;
    private String PassWord;
    private String FullName;
    private String Image;
    private String Email;
    private Date Dob;
    private String Phone;
    private String Address;
    private String FaceBookID;
    private String GmailID;
    private int RoleID;
    private int Status;

    public User() {
    }

    public User(int UserID, String UserName, String PassWord, String FullName, String Image, String Email, Date Dob, String Phone, String Address, String FaceBookID, String GmailID, int RoleID, int Status) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.FullName = FullName;
        this.Image = Image;
        this.Email = Email;
        this.Dob = Dob;
        this.Phone = Phone;
        this.Address = Address;
        this.FaceBookID = FaceBookID;
        this.GmailID = GmailID;
        this.RoleID = RoleID;
        this.Status = Status;
    }

    public String getFaceBookID() {
        return FaceBookID;
    }

    public void setFaceBookID(String FaceBookID) {
        this.FaceBookID = FaceBookID;
    }

    public String getGmailID() {
        return GmailID;
    }

    public void setGmailID(String GmailID) {
        this.GmailID = GmailID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public Date getDob() {
        return Dob;
    }

    public void setDob(Date Dob) {
        this.Dob = Dob;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", UserName=" + UserName + ", PassWord=" + PassWord + ", FullName=" + FullName + ", Image=" + Image + ", Email=" + Email + ", Dob=" + Dob + ", Phone=" + Phone + ", Address=" + Address + ", FaceBookID=" + FaceBookID + ", GmailID=" + GmailID + ", RoleID=" + RoleID + ", Status=" + Status + '}';
    }

}
