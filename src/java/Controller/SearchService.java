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
import java.io.IOException;


/**
 *
 * @author Admin
 */
public class SearchService extends HttpServlet {

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
        
        //lay gia tri input       
        String title = request.getParameter("searchinput");
        //lay gia tri trang hien tai
        String s = request.getParameter("pagenum");
        if(s == null) s = "1";
        int index = Integer.parseInt(s);
        
        if(title == null) title = "";
        int totalpagesearch;
        if(service.SearchGame(title).size() % 8 != 0) {
            totalpagesearch = service.SearchGame(title).size() / 8 + 1;
        } else {
            totalpagesearch = service.SearchGame(title).size() / 8;
        }
        
        request.setAttribute("PNindexS",index);
        request.setAttribute("gamelistsearch", service.PaginationForSearch(title, (index - 1)  * 8));
        request.setAttribute("totalpagesearch", totalpagesearch);
        request.setAttribute("searchinput", title);
        request.setAttribute("gamesearchlistsize", service.SearchGame(title).size());
        request.getRequestDispatcher("searchResult.jsp").forward(request, response);
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
