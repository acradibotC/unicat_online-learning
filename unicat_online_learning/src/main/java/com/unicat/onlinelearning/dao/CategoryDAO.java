
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.dto.Category;
import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDAO extends DBContext{
    
    private Connection connection = DBContext.makeConnection();
    
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> List = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Category]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                List.add(new Category(rs.getInt("CategoryID"), rs.getString("Name")));
            }
        } catch (Exception e) {
        }
        return List;
    }
    public String getCategoryNameByCategoryID(int CategoryID) {
        try {
            String sql = "SELECT * FROM [Category] WHERE CategoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                return rs.getString("Name");
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        System.out.println(dao.getAllCategory().size());
        System.out.println(dao.getAllCategory().size() - 1);
    }
}
