package content;

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
            ResultSet rs = null;
            int voto = 0;
            int id = Integer.parseInt(request.getParameter("id")); //parametro de la funcion js
            if(request.getParameter("upvote")!=null){
                voto = 1;
            }
            if(request.getParameter("downvote")!=null){
                voto = -1;
            }
            try {
                String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=n0m3l0";
                con = DriverManager.getConnection(url);
                st = con.createStatement();
                String q = "UPDATE dpublicacion SET pub_vot = pub_vote +"+voto+"WHERE pub_id ="+id;
                rs = st.executeQuery(q);
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
