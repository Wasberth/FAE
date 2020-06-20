package content;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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
public class Voto extends HttpServlet {

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
            Statement st2 = null;
            int rs;
            int rs2;
            String voto = (request.getParameter("vote"));
            String pub_id = (request.getParameter("pub_id"));
            String usr_id = (request.getParameter("usr_id"));
            
            try {
                con = new Conexion().getConnection();
                st = con.createStatement();
                String q = "UPDATE DPublicacion SET pub_vot = pub_vot "+voto+" WHERE pub_id = "+pub_id;
                rs = st.executeUpdate(q);
                st2 = con.createStatement();
                
                int act = 0;
                if(voto == "1"){
                    act = 1;
                }else{
                    act = 2;
                }
                
                String q2 = "INSERT INTO DHistorial (pub_id, usr_id, hst_act, hst_dat) VALUES ("+pub_id+","+usr_id+","+act+", CURRENT_TIMESTAMP())";
                rs2 = st2.executeUpdate(q2);
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("Error en voto.java");
                System.out.println(e);
            }finally{
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
