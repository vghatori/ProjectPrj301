/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{
    
    
    // phan register
    public boolean isRegisterEmail(String email) { // check da co email chua
        String sql = "select * from userdata where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getString("email").equals(email)) { // co email
                    return false;
                } 
            }
        } catch(SQLException e) {
            System.out.println(e);
        }     
        return true; // chua co email
    }
    
    public boolean isRegisterUsername(String username) { // check da co username chua
        String sql = "select * from userdata where username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getString("username").equals(username)) { // co username
                    return false;
                } 
            }
        } catch(SQLException e) {
            System.out.println(e);
        }     
        return true; // chua co username
    }
    
    public boolean isRegisterPhone(long Phone) { // check da co phone chua
        String sql = "select * from userdata where phonenumber = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, Phone);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getLong("phonenumber") == Phone) { // co phone number
                    return false;
                } 
            }
        } catch(SQLException e) {
            System.out.println(e);
        }     
        return true; // chua co phone number
    }
    
    public void addUser(String email, String username, String password, String phone) { // dang ky tai khoan
        String sql = "insert userdata(email,username,password,phonenumber,status,admin) \n" +
                     "values\n" +
                     "(?,?,?,?,0,0)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        }       
    }
    // phan login
    public boolean isLogin(String email, String password) { // check da co phone chua
        String sql = "select * from userdata where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getString("password").equals(password)) {
                    return true;
                } 
            }
        } catch(SQLException e) {
            System.out.println(e);
        }     
        return false;
    }
    
    // lay du lieu cua 1 user 
    public User getUserByEmail(String email) {
        User u = null;
        String sql = "select * from userdata where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String mail = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                long phonenumber = rs.getLong("phonenumber");
                int status = rs.getInt("status");
                int admin = rs.getInt("admin");
                u = new User(id,mail,username,password,phonenumber,status,admin);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return u;
    } 
    //lay du lieu tat ca nguoi dung khong phai admin
    public List<User> getClientUser(int st) {
        List<User> userlist = new ArrayList();
        String sql = "select * from userdata where status = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, st);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String mail = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                long phonenumber = rs.getLong("phonenumber");
                int status = rs.getInt("status");
                int admin = rs.getInt("admin");
                userlist.add(new User(id,mail,username,password,phonenumber,status,admin));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return userlist;
    }
    //lay tat ca du lieu nguoi dung
    public List<User> getAllClientUser() {
        List<User> userlist = new ArrayList();
        String sql = "select * from userdata where userid != 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String mail = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                long phonenumber = rs.getLong("phonenumber");
                int status = rs.getInt("status");
                int admin = rs.getInt("admin");
                userlist.add(new User(id,mail,username,password,phonenumber,status,admin));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return userlist;
    }
    
    //cap nhat tai khoan cua user
    
    public void UpdateAccount(String email, String username, String password, Long phone) {
        String sql = "update userdata set username = ?, password = ?, phonenumber = ? where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setLong(3, phone);
            ps.setString(4, email);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        }       
    }
    //ban user
    public void ControlAccount(String email, int status) {
        String sql = "update userdata set status = ? where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setString(2, email);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        }       
    }
    
    //reset password
    public void ResetPassword(String email, String password) {
        String sql = "update userdata set password = ? where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        }       
    }
    
    public static void main(String[] args) {
        UserDAO user = new UserDAO();
        System.out.println(user.isRegisterPhone(913568775));
    }
    
}
