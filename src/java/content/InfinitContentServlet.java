/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

import config.Conexion;
import controlador.Operaciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author david
 */
public class InfinitContentServlet extends HttpServlet {

    private static Integer counter = 1;

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String resp = "";
            new Operaciones().resetRowNumber();
            Connection con = null;
            String DRIVER = "com.mysql.jdbc.Driver";
            Class.forName(DRIVER).newInstance();
            PreparedStatement st = null;
            ResultSet rs = null;
            PreparedStatement st2 = null;
            ResultSet rs2 = null;

            String counted = request.getParameter("counted");
            counter = Integer.parseInt(counted);
            for (int i = counter; i <= counter + 10; i++) {

                try {
                    HttpSession session = request.getSession();
                    con = new Conexion().getConnection();
                    String q = request.getParameter("q");
                    String q2 = request.getParameter("q2");
                    st = con.prepareStatement(q);
                    st2 = con.prepareStatement(q2);
                    st.setInt(1, counter);
                    st2.setInt(1, counter);
                    rs = st.executeQuery(q);
                    rs2 = st2.executeQuery(q2);
                    while (rs.next() && rs2.next()) {
                        String tit = rs.getString("pub_tit");
                        String txt = rs2.getString("pub_txt");
                        int id = rs.getInt("pub_id");
                        int votos = rs2.getInt("pub_vot");
                        out.println("<article class=\"container borderSimple\">\n"
                                + "                        <header class=\"row color2\">\n"
                                + "                            <div class=\"col-l2\">\n"
                                + "                                <h5 class=\"text-center\">" + tit + "</h5>\n"
                                + "                            </div>\n"
                                + "                        </header>\n"
                                + "                        <div class=\"row\">\n"
                                + "                            <div class=\"col-2 color2 d-none d-sm-inline-block\">\n"
                                + "                                <div class=\"btn-group-vertical btn-g\">\n"
                                + "                                        <button class=\"btn btn-success\" name=\"upvote\" onclick=\"votes(" + id + "," + session.getAttribute("usr_id") + ", '+1')\">\n"
                                + "                                        <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                                + "                                    </button>\n"
                                + "                                    <button class=\"btn disabled\">\n"
                                + "                                        <i>" + votos + "</i>\n"
                                + "                                    </button>\n"
                                + "                                    <button class=\"btn btn-danger\" name=\"downvote\" onclick=\"votes(" + id + "," + session.getAttribute("usr_id") + ", '-1')\">\n"
                                + "                                        <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                                + "                                    </button>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                            <div class=\"col-12 col-sm-10 color4\">\n"
                                + "                                <p>\n"
                                + "                                    " + txt + "\n"
                                + "                                </p>\n"
                                + "                            </div>\n"
                                + "                        </div>\n"
                                + "                        <div class=\"row d-block d-sm-none color2\">\n"
                                + "                            <div class=\"btn-group btn-g color-12\">\n"
                                + "                                <button class=\"btn btn-success\">\n"
                                + "                                    <i class=\"fas fa-arrow-alt-circle-up\"></i>\n"
                                + "                                </button>\n"
                                + "                                <button class=\"btn disabled\">\n"
                                + "                                    <i>" + votos + "</i>\n"
                                + "                                </button>\n"
                                + "                                <button class=\"btn btn-danger\">\n"
                                + "                                    <i class=\"fas fa-arrow-alt-circle-down\"></i>\n"
                                + "                                </button>\n"
                                + "                            </div>\n"
                                + "                        </div>\n"
                                + "                    </article>");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                counter++;
            }
            out.write(resp);
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("No se cerro la conexon ininit");
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(InfinitContentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
