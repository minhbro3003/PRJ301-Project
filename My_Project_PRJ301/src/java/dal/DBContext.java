/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public abstract class DBContext<T> {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost\\MSSQLSERVER:1433;databaseName=AssDemo1; encrypt=true;trustServerCertificate=true;";
            String user = "sa";
            String pass = "minh";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);

        } catch(SQLException ex){
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public abstract ArrayList<T> list();
}
