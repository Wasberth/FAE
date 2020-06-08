package controlador;

import config.Conexion;
import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class Operaciones {

    private int id;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //cambiar nombre de la bd
//        String url = "jdbc:mysql://localhost:3306/db_faev1?user=root&password=root";
//
//        Connection con = null;
//
//        try {
//            String DRIVER = "com.mysql.jdbc.Driver";
//            Class.forName(DRIVER).newInstance();
//            con = DriverManager.getConnection(url);
//        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
//            System.out.println(e.getMessage());
//            System.out.println(Arrays.toString(e.getStackTrace()));
//        }
//        return con;
        return new Conexion().getConnection();
    }

    public int loguear(String usuario, String password) {

        System.out.println("Usuario: " + usuario);
        System.out.println("Password: " + password);
        int nivel = 0;
        try {
            Connection con = null;
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            ResultSet rs;

            //verificar nombre de las columnas
            String q = "SELECT * FROM musuario where usr_tag='" + usuario + "' and usr_pas='" + password + "'";
            PreparedStatement ps = con.prepareStatement(q);

            rs = ps.executeQuery();

            while (rs.next()) {
                nivel = rs.getInt("usr_niv");
                id = rs.getInt("usr_id");
            }
            con.close();
        } catch (SQLException ed) {
            System.out.println(ed.getMessage());
            System.out.println(Arrays.toString(ed.getStackTrace()));
        }
        return nivel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLastPublicacion(int id_usuario) {
        int id = 0;
        try {
            String q = "SELECT pub_id FROM Mpublicacion WHERE usr_id = ? ORDER BY pub_id DESC LIMIT = 1";
            Connection con = null;
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            ps.setInt(1, id_usuario);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(q);
            }
        } catch (SQLException e) {
            System.out.println("Error getLasPublicacion");
            System.out.println(e);
            e.printStackTrace();
        }
        return id;
    }
}
