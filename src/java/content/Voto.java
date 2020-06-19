package content;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
            ResultSet rs = null;
            ResultSet rs2 = null;
            String voto = (request.getParameter("vote"));
            String pub_id = (request.getParameter("pub_id"));
            String usr_id = (request.getParameter("usr_id"));
            
            try {
                con = new Conexion().getConnection();
                st = con.createStatement();
                String q = "UPDATE DPublicacion SET pub_vot = pub_vote "+voto+" WHERE pub_id = "+pub_id;
                rs = st.executeQuery(q);
                st2 = con.createStatement();
                String q2 = "INSERT INTO DHistorial (pub_id, usr_id, hst_vot, hst_dat) VALUES ("+pub_id+","+usr_id+","+voto+", GETDATE())";
                rs2 = st2.executeQuery(q2);
            } catch (Exception e) {
                System.out.println(e);
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
