
package com.unicat.onlinelearning.dao;

import com.unicat.onlinelearning.utils.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserRoleDAO extends DBContext {

    private Connection connection = DBContext.makeConnection();
    
    public String getRoleNameByRoleID(int RoleID) {
        try {
            String sql = "SELECT * FROM [UserRole] WHERE RoleID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, RoleID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("Name");
            }
        } catch (Exception e) {
        }
        return null;
    }
}
