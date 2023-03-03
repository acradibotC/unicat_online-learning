package com.unicat.onlinelearning.utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anhnt206
 */
//public class DBContext {
//
//    public static Connection makeConnection() {
//        Connection conn = null;
//        try {
//            String dbURL = "jdbc:sqlserver://acradiboc-server.database.windows.net;database=unicat-db;encrypt=true;trustServerCertificate=true;";
//            String user = "unicat-admin@acradiboc-server";
//            String pass = "nta020601@";
//            
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            conn = DriverManager.getConnection(dbURL, user, pass);
//            //System.out.println("Connect to DB successfully");
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return conn;
//    }
//
//    public static void closeConnection(Connection conn) {
//
//        if (conn != null) {
//            try {
//                conn.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//    }
//    ////////////////////////////////////////////////////////////////////////////
//    public static void main(String[] args) throws SQLException {
//
//        System.out.println("This is to test if we can connect to SQLServer");
//        Connection conn = makeConnection();
//        DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
//        System.out.println("Driver name: " + dm.getDriverName());
//        System.out.println("Driver version: " + dm.getDriverVersion());
//        closeConnection(conn);
//    }
//}
public class DBContext {

    public static Connection makeConnection() {
        Connection conn = null;
        try {

            String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=Unicat Online Learning;encrypt=true;trustServerCertificate=true;";
            String user = "sa";
            String pass = "123123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dbURL, user, pass);
            //System.out.println("Connect to DB successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static void closeConnection(Connection conn) {

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    public static void main(String[] args) throws SQLException {

        System.out.println("This is to test if we can connect to SQLServer");
        Connection conn = makeConnection();
        DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
        System.out.println("Driver name: " + dm.getDriverName());
        System.out.println("Driver version: " + dm.getDriverVersion());
        closeConnection(conn);
    }
}
