/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Categories;
import model.Game;

/**
 *
 * @author Admin
 */
public class GameDAO extends DBContext{
    
    //phan trang cho home
    public List<Game> PaginationForHome(int indexpage) {
        List<Game> GameList = new ArrayList();
        String sql = "select * from game order by gameid offset ? rows fetch next 8 rows only";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, indexpage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                GameList.add(new Game(id,title,image,description,megaup,gofile));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return GameList;
    }
    //phan trang cho search
    public List<Game> PaginationForSearch(String s, int indexpage) {
        List<Game> GameList = new ArrayList();
        String sql = "select * from game where title like ? order by gameid offset ? rows fetch next 8 rows only";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+s+"%");
            ps.setInt(2, indexpage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                GameList.add(new Game(id,title,image,description,megaup,gofile));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return GameList;
    }
    
    //lay tat ca du lieu game
    public List<Game> getAllGame() {
        List<Game> GameList = new ArrayList();
        String sql = "select * from game";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                GameList.add(new Game(id,title,image,description,megaup,gofile));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return GameList;
    }
    //lay game bang ten
    public List<Game> SearchGame(String s) {
        List<Game> GameList = new ArrayList();
        String sql = "select * from game where title like ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+s+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                GameList.add(new Game(id,title,image,description,megaup,gofile));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return GameList;
    }
    //lay data cua categories game
    public List<Categories> getAllCate() {
        List<Categories> CateList = new ArrayList();
        String sql = "select * from categories";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(1);
                String catetitle = rs.getString(2);               
                CateList.add(new Categories(id,catetitle));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return CateList;
    }
    
    //them duu lieu game yeu thich cho user
    public void addFavGame(int userid, int gameid) {
        String sql = "insert userGame values(?,?,CONVERT(VARCHAR, GETDATE(), 120))";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, gameid);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        } 
    }
    
    
    
    //lay du lieu game yeu thich cua user 
    public List<Game> getAlLFavGame(int userid) {
        List<Game> FavGameList = new ArrayList();
        String sql = "select * from userGame a join userdata b on a.userid = b.userid join game c on a.gameid = c.gameid where a.userid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(2);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                FavGameList.add(new Game(id,title,image,description,megaup,gofile));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }   
        return FavGameList;
    }
    //delete user fav game 
    public void DeleteFavGame(int userid, int gameid) {
        String sql = "delete from userGame where userid = ? and gameid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, gameid);
            ps.execute();
        } catch(SQLException e) {
            System.out.println(e);
        } 
    }
    //delete user fav game 
    public Game getGameByID(int gameid) {
        String sql = "select * from game where gameid = ?";
        Game game = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, gameid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt(2);
                String title = rs.getString("title");
                String image = rs.getString("image");
                String description = rs.getString("description");
                String megaup = rs.getString("link_1");
                String gofile = rs.getString("link_2");
                game = new Game(id,title,image,description,megaup,gofile);
            }
        } catch(SQLException e) {
            System.out.println(e);
        } 
        return game;
    }
    
    //check fav already have yet ?
    public boolean isHaveFavGame(int userid, int gameid) { // check da co phone chua
        String sql = "select * from userGame where userid = ? and gameid = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, gameid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(rs.getInt("gameid") == gameid) {
                    return false;
                } 
            }
        } catch(SQLException e) {
            System.out.println(e);
        }     
        return true;
    }
    
    public static void main(String[] args) {
        GameDAO user = new GameDAO();

        user.getAlLFavGame(2).forEach(a ->{
            System.out.println(a.toString());
        });
    }
}
