/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package content;

import controlador.Operaciones;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author david
 */
public class usrOperacion {

    public boolean modificar(Usuario usr) throws ClassNotFoundException {
        boolean modif = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();

            String q = "update musuario set usr_tag = ?, usr_niv = ? "
                    + "where usr_id = ?";

            String q2 = "update dusuario set usr_nom = ?, usr_app = ?, usr_apm = ? "
                    + "where usr_id = ?";

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            
            ps.setString(1, usr.getUsr_tag());
            ps.setInt(2, usr.getUsr_niv());
            ps.setInt(3, usr.getUsr_id());
            
            ps2.setString(1, usr.getUsr_nom());
            ps2.setString(2, usr.getUsr_app());
            ps2.setString(3, usr.getUsr_apm());
            ps2.setInt(4, usr.getUsr_id());

            if (ps.executeUpdate() > 0 && ps2.executeUpdate() > 0) {
                ps = null;
                ps2 = null;
                modif = true;
            }

            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return modif;
    }

    public boolean eliminar(int id) throws ClassNotFoundException {
        boolean elim = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();

            String q = "delete from mpublicacion "
                    + "where pub_id = ?";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);

            if (ps.executeUpdate() > 0) {
                ps = null;
                elim = true;
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return elim;
    }
}
