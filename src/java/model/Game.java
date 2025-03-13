/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Game {
    private int gameid;
    private String title;
    private String image;
    private String description;
    private String megaup;
    private String gofile;

    public Game(int gameid, String title, String image, String description, String megaup, String gofile) {
        this.gameid = gameid;
        this.title = title;
        this.image = image;
        this.description = description;
        this.megaup = megaup;
        this.gofile = gofile;
    }

    public int getGameid() {
        return gameid;
    }

    public void setGameid(int gameid) {
        this.gameid = gameid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMegaup() {
        return megaup;
    }

    public void setMegaup(String megaup) {
        this.megaup = megaup;
    }

    public String getGofile() {
        return gofile;
    }

    public void setGofile(String gofile) {
        this.gofile = gofile;
    }

    @Override
    public String toString() {
        return "Game{" + "gameid=" + gameid + ", title=" + title + ", image=" + image + ", description=" + description + ", megaup=" + megaup + ", gofile=" + gofile + '}';
    }
    
}
