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
    private int Phone;
    private Date Dob;
    private int Role;
    private String Name;

    public User() {
    }

    public User(int UserID, String UserName, String PassWord, int Phone, Date Dob, int Role, String Name) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.PassWord = PassWord;
        this.Phone = Phone;
        this.Dob = Dob;
        this.Role = Role;
        this.Name = Name;
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

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int Phone) {
        this.Phone = Phone;
    }

    public Date getDob() {
        return Dob;
    }

    public void setDob(Date Dob) {
        this.Dob = Dob;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", UserName=" + UserName + ", PassWord=" + PassWord + ", Phone=" + Phone + ", Dob=" + Dob + ", Role=" + Role + ", Name=" + Name + '}';
    }


}
