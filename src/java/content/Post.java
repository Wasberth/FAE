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
import config.Conexion;
import controlador.Operaciones;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

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
            HttpSession session = request.getSession();
            String DRIVER = "com.mysql.jdbc.Driver";
            Class.forName(DRIVER).newInstance();
            java.sql.Connection con;
            try {
                con = new Conexion().getConnection();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
            String categoria = request.getParameter("categoria");
            String titulo = request.getParameter("titulo");
            String cuerpo = request.getParameter("cuerpo");
            try {
                String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=root";

                con = DriverManager.getConnection(url);
                int usr_id = (int) (session.getAttribute("usr_id"));

                String q = "INSERT INTO MPublicacion (`pub_tit`,`usr_id`) "
                        + "VALUES (?,?);";
                String q2 = "INSERT INTO DPublicacion(`typ_id`, `pub_txt`, `pub_dat`, `pub_vot`, `pub_id`) "
                        + "VALUES (1, ?, CURRENT_TIMESTAMP(), 1, ?);";
                String q3 = "INSERT INTO DHistorial(`usr_id`, `pub_id`, `hst_dat`, `hst_act`) "
                        + "VALUES (?, ?, CURRENT_TIMESTAMP(), 1)";

                //Aquí falta poner la sentencia para agregar el like en el momento en que se crea
                //Y también falta que se guarden las categorías al crear las publicaciones
                PreparedStatement ps = con.prepareStatement(q);
                PreparedStatement ps2 = con.prepareStatement(q2);
                PreparedStatement ps3 = con.prepareStatement(q3);

                ps.setString(1, titulo);
                ps.setInt(2, usr_id);
                ps.executeUpdate();
                int id = new Operaciones().getLastPublicacion(usr_id);

                System.out.println(id);
                System.out.println(q2);

                ps2.setString(1, cuerpo);
                ps2.setInt(2, id);
                ps2.executeUpdate();

                ps3.setInt(1, usr_id);
                ps3.setInt(2, id);
                ps3.executeUpdate();

                response.sendRedirect("MainPage.jsp");
            } catch (IOException | SQLException e) {
                System.out.println("Error en el Post");
                System.err.println(e);
                e.printStackTrace();
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
