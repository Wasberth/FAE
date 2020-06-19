/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;

/**
 *
 * @author tutus
 */
public class registro {

    public boolean registro(String user_tag, String user_password, String user_name, String user_appat, String user_apmat) throws ClassNotFoundException {
        boolean registro = false;
        Connection con = null;
        try {
            con = Operaciones.getConnection();

            //verificar nombre de las columnas
            String q = "insert into musuario (usr_tag, usr_pas, usr_niv) "
                    + "values (?,?,3); ";
            
            String q2 = "insert into dusuario (usr_nom,usr_app,usr_apm) "
                    + "values (?,?,?)";
            
            

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement ps2 = con.prepareStatement(q2);
            ps.setString(1, user_tag);
            ps.setString(2, user_password);
            ps2.setString(1,user_name);
            ps2.setString(2,user_appat);
            ps2.setString(3, user_apmat);
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
}
