/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Categories {
    private int cateid;
    private String catetitle;

    public Categories(int cateid, String catetitle) {
        this.cateid = cateid;
        this.catetitle = catetitle;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatetitle() {
        return catetitle;
    }

    public void setCatetitle(String catetitle) {
        this.catetitle = catetitle;
    }

    @Override
    public String toString() {
        return "Categories{" + "cateid=" + cateid + ", catetitle=" + catetitle + '}';
    }

    
    
}
