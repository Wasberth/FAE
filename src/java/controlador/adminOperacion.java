/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

/**
 *
 * @author tutus
 */
public class adminOperacion {

    public boolean registro(consejero cons) throws ClassNotFoundException {
        boolean registro = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();
            
            String q = "insert into musuario (usr_tag, usr_pas, usr_niv) "
                    + "values (?,?,?); ";
            
            String q2 = "insert into dusuario (usr_nom,usr_app,usr_apm) "
                    + "values (?,?,?)";

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.setString(1, cons.getTag());
            ps.setString(2, cons.getPass());
            ps.setInt(3, cons.getNivel());
            ps2.setString(1,cons.getName());
            ps2.setString(2,cons.getAppat());
            ps2.setString(3, cons.getApmat());
            ps.executeUpdate();
            ps2.executeUpdate();
                        

            if (ps != null && ps2 != null) {
                //ps.close();
                //ps2.close();
                ps = null;
                ps2 = null;
                       
                registro = true;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return registro;
    }
    
    public boolean cambiarPass(int id, String pass,String newpass) throws ClassNotFoundException {
        boolean cambio = false;
        Connection con = null;
        ResultSet rs;
        try {
            con = Operaciones.getConnection();
            
            String q = "select * from musuario where usr_id=? and usr_pas=?;";
            
            String q2 = "update musuario set usr_pas=? where usr_id =?; ";
            
            

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.setInt(1, id);
            ps.setString(2, pass);
            ps2.setString(1,newpass);
            ps2.setInt(2,id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                ps2.executeUpdate();
            }
            
            if (ps != null && ps2 != null) {
                //ps.close();
                //ps2.close();
                ps = null;
                ps2 = null;
                       
                cambio = true;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return cambio;
    }
    
    public boolean cambiarTag(int id, String tag) throws ClassNotFoundException {
        boolean cambio = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();
            
            String q = "update musuario set usr_tag=? where usr_id =?; ";
           
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ps.setString(2, tag);
            ps.executeUpdate();
            
            if (ps != null) {
                //ps.close();
                //ps2.close();
                ps = null;
                       
                cambio = true;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return cambio;
    }
    
    public boolean eliminar(int usr_id) throws ClassNotFoundException {
        boolean eliminar = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();

            String q = "delete from musuario where usr_id = ? ";
            String q2 = "delete from dusuario where usr_id = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.setInt(1, usr_id);
            ps2.setInt(1,usr_id);
            ps.executeUpdate();
            ps2.executeUpdate();
                        

            if (ps != null && ps2 != null) {
                ps = null;
                ps2 = null;
                eliminar = true;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return eliminar;
    }
    
        public boolean eliminarPub(int idpub) throws ClassNotFoundException {
        boolean eliminar = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();

            String q = "delete from mpublicacion where pub_id = ? ";
            String q2 = "delete from dpublicacion where pub_id = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.setInt(1, idpub);
            ps2.setInt(1,idpub);
            ps.executeUpdate();
            ps2.executeUpdate();
                        

            if (ps != null && ps2 != null) {
                ps = null;
                ps2 = null;
                eliminar = true;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return eliminar;
    }
}
