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

/**
 *
 * @author tutus
 */
public class consOps extends HttpServlet {

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
            out.println("<title>Servlet consOps</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet consOps at " + request.getContextPath() + "</h1>");
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
        String accion = request.getParameter("action");
        switch (accion){
            
            case "Eliminar":
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    if ( op.eliminar(id) ) {
                        request.getRequestDispatcher("indexCons.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("ConsultarUsers.jsp").forward(request, response);
                    }
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(adminOps.class.getName()).log(Level.SEVERE, null, ex);
                }
            break;
        
            case "Eliminar publicacion":
                int idpub = Integer.parseInt(request.getParameter("idpub"));
                try {
                    if ( op.eliminarPub(idpub) ) {
                        request.getRequestDispatcher("indexCons.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("ConsultarUsers.jsp").forward(request, response);
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
