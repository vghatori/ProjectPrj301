/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.GameDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class HomeService extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GameDAO service = new GameDAO();
        HttpSession session = request.getSession();
        // lay so luong page
        int totalnumpage;
        if(service.getAllGame().size() % 8 != 0) {
            totalnumpage = service.getAllGame().size() / 8 + 1;
        } else {
            totalnumpage = service.getAllGame().size() / 8;
        }
        // lay index 0 vs n de hien thi the previous va next
        String s = request.getParameter("pagenum");
        if(s == null) s = "1";
        int index = Integer.parseInt(s);
        request.setAttribute("PNindex",index);
        //lay data cate
        session.setAttribute("catelist",service.getAllCate());
        //edlenring game 
        request.setAttribute("edldenring", service.SearchGame("elden ring").get(0));
        //lay du lieu game de gui len web
        request.setAttribute("gamelistforhome", service.PaginationForHome((index - 1) * 8));      
        request.setAttribute("allgamelistforhome", service.getAllGame());
        request.setAttribute("totalnumpage", totalnumpage);
               
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
