/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.unicat.onlinelearning.dto;

/**
 *
 * @author tuanm
 */
public class Category {
    private int CategoryID;
    private String Name;

    public Category() {
    }

    public Category(int CategoryID, String Name) {
        this.CategoryID = CategoryID;
        this.Name = Name;
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

    @Override
    public String toString() {
        return "Category{" + "CategoryID=" + CategoryID + ", Name=" + Name + '}';
    }
    
    
}
