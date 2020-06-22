/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tutus
 */
public class userOps extends HttpServlet {

    consejero cons = new consejero();
    adminOperacion op = new adminOperacion();
    
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminOps</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminOps at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        
        HttpSession session = request.getSession();
        
        String accion = request.getParameter("action");
        switch (accion){
            
            case "Cambiar nombre":
                int id = Integer.parseInt(request.getParameter("id"));
                String nName = request.getParameter("newName");
                
                session.setAttribute("user", nName);
                
                try {
                    if ( op.cambiarTag(id,nName) ) {
                        request.getRequestDispatcher("MainPage.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminOps.class.getName()).log(Level.SEVERE, null, ex);
                }
            break;

            case "Cambiar password":
                int idp = Integer.parseInt(request.getParameter("idp"));
                String pass = request.getParameter("currPass");
                String npass = request.getParameter("newPass");
                try {
                    if ( op.cambiarPass(idp, pass, npass) ) {
                        request.getRequestDispatcher("MainPage.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminOps.class.getName()).log(Level.SEVERE, null, ex);
                }
            break;
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
