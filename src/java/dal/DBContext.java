/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBContext {
    protected Connection con;
    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=GameServerDataBase";
            String username = "sa";
            String password = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, username, password);
        } catch(ClassNotFoundException | SQLException err) {
            System.out.println(err);
        }
    }
}
