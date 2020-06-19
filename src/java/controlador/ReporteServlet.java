/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReporteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        int pub_id = Integer.parseInt(request.getParameter("id"));

        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = new Conexion().getConnection();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        ResultSet rs;
        int rs2;
        String usr_idS;
        int usr_id = 0;
        String accion = request.getParameter("accion");

        HttpSession sesion = request.getSession();
        usr_idS = sesion.getAttribute("usr_id").toString();
        usr_id = Integer.parseInt(usr_idS);

        switch (accion) {
            case "reportar":

                System.out.println("LLegue a reportar en servlet");

                String sql2 = "INSERT INTO DHistorial (pub_id,usr_id,hst_dat,hst_act)"
                        + "VALUES(" + pub_id + ",?,CURRENT_TIMESTAMP(),3)";

                PreparedStatement ps2 = con.prepareStatement(sql2);

                ps2.setInt(1, usr_id);
                System.out.println(sql2);
                rs2 = ps2.executeUpdate();
                break;
            case "eliminarPub":
                System.out.println("Llegue a elimiar pub en servlet");
                String sql = "DELETE FROM MPublicacion WHERE pub_id = "+pub_id+"";
                PreparedStatement ps = con.prepareStatement(sql);
                rs2 = ps.executeUpdate();
                break;
            default:
                System.out.println("me fui al default");

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReporteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReporteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
