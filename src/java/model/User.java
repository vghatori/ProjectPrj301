/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private int userid;
    private String email;
    private String username;
    private String password;
    private long phone;
    private int status;
    private int admin;

    public User(int userid, String email, String username, String password, long phone, int status, int admin) {
        this.userid = userid;
        this.email = email;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.status = status;
        this.admin = admin;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "user{" + "email=" + email + ", username=" + username + ", password=" + password + ", phone=" + phone + ", status=" + status + ", admin=" + admin + '}';
    }
    
}
