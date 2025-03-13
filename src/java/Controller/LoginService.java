/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 *
 * @author Admin
 */
public class LoginService extends HttpServlet {

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
        Cookie cookie_user[] = request.getCookies();
        for(Cookie c : cookie_user) {
            if(c.getName().equals("c_mail")) {
                request.setAttribute("usermail", c.getValue());
            }
            if(c.getName().equals("c_pass")) {
                request.setAttribute("userpass", c.getValue());
            }
        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
        
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
        UserDAO service = new UserDAO();
        // get client input account
        String email = request.getParameter("emaillogin");
        String pass = request.getParameter("passlogin");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        // check login and push data to client 
        if(service.isLogin(email, pass) == false) {
            session.setAttribute("loginErr", "pass or email is incorrect, enter again!");                     
            request.getRequestDispatcher("Login.jsp").forward(request, response);                     
        } else {
            User u = service.getUserByEmail(email);            
            session.setAttribute("userdata", u);
            if(u.getAdmin() == 1) { // check tai khoan co phai admin ko de dieu huong den dung trang
                response.sendRedirect("admin");
            } else {     
                if(u.getStatus() == 1) {
                    session.setAttribute("unlogmess", "This Account has been banned");
                    response.sendRedirect("login");
                }           
                Cookie cookie_mail = new Cookie("c_mail",email);
                Cookie cookie_pass = new Cookie("c_pass",pass);
                if(remember != null) { // remember de set cookie time                                       
                    cookie_mail.setMaxAge(60);
                    cookie_pass.setMaxAge(60);                   
                } else {
                    cookie_mail.setMaxAge(0);
                    cookie_pass.setMaxAge(0);
                }
                response.addCookie(cookie_mail);
                    response.addCookie(cookie_pass);
                response.sendRedirect("home");          
            }
        }
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
