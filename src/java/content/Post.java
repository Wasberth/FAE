/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
public class Post extends HttpServlet {

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
            String DRIVER = "com.mysql.jdbc.Driver";
            Class.forName(DRIVER).newInstance();
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            Statement st2 = null;
            ResultSet rs2 = null;
            Statement st3 = null;
            ResultSet rs3 = null;
            Statement st4 = null;
            ResultSet rs4 = null;
            String categoria = request.getParameter("categoria");
            String titulo = request.getParameter("titulo");
            String cuerpo = request.getParameter("cuerpo");
            try {
                String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=n0m3l0";
                
                con = DriverManager.getConnection(url);
                st = con.createStatement();
                st2 = con.createStatement();
                st3 = con.createStatement();
                String q = "INSERT INTO mpublicacion (pub_tit,pub_txt) values("+titulo+","+cuerpo+")";
                String q2 = "INSERT INTO dpublicacion (pub_vot,tip_pub) values(1,1)";
                String q3 = "INSERT INTO epublicacionetiqueta (eti_id,pub_id) values(1,1)";
                //Aquí falta poner la sentencia para agregar el like en el momento en que se crea
                //Y también falta que se guarden las categorías al crear las publicaciones
                rs = st.executeQuery(q);
                rs2 = st2.executeQuery(q2);
                rs3 = st3.executeQuery(q3);
                response.sendRedirect("MainPage.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException ex) {
            System.out.println(ex);
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
