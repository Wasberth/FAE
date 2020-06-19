/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

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
public class pubAServ extends HttpServlet {

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
            out.println("<title>Servlet pubAServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet pubAServ at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
            Publicacion publicacion = new Publicacion();
            pubOperacion op = new pubOperacion();
            String action = request.getParameter("action");
            
            switch(action){
                
                case "Guardar cambios":
                    int pub_id = Integer.parseInt(request.getParameter("pub_id").toString());
                    String titulo = request.getParameter("titulo_pub");
                    String texto = request.getParameter("texto_pub");
                    
                    publicacion.setPub_id(pub_id);
                    publicacion.setTitulo(titulo);
                    publicacion.setTexto(texto);
                    
                    if(op.modificar(publicacion)){
                        request.getRequestDispatcher("PubsUsers.jsp").forward(request, response);
                    }else{
                        request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
                    }
                    
                    break;
                    
                case "Eliminar":
                    int id_pubd = Integer.parseInt(request.getParameter("publicacionDelete"));
                    publicacion.setPub_id(id_pubd);
                    
                    if(op.eliminar(publicacion)){
                        request.getRequestDispatcher("PubsUsers.jsp").forward(request, response);
                    }else{
                        request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
                    }
                    
                    break;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(pubAServ.class.getName()).log(Level.SEVERE, null, ex);
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
