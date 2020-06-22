package content;

import config.Conexion;
import controlador.Operaciones;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConsultaBD {

    private static LinkedList<Publicacion> listaPublicacionesq = new LinkedList<>();

    public static LinkedList<Usuario> getConsejeros() {
        LinkedList<Usuario> listaUsuarios = new LinkedList<>();
        Connection conexion = null;
        try {
            conexion = new Conexion().getConnection();
            Class.forName("org.gjt.mm.mysql.Driver");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT MUsuario.usr_id AS `ID`, MUsuario.usr_tag AS `tag`, "
                    + "MUsuario.usr_niv AS `niv`, DUsuario.usr_nom AS `nombre`, "
                    + "DUsuario.usr_app AS `appat`, DUsuario.usr_apm AS `apmat` "
                    + "FROM MUsuario, DUsuario "
                    + "WHERE MUsuario.usr_id = DUsuario.usr_id;");
            while (rs.next()) {
                Usuario user = new Usuario(rs.getInt("ID"),
                        rs.getInt("niv"), rs.getString("tag"),
                        rs.getString("nombre"), rs.getString("appat"),
                        rs.getString("apmat"));
                listaUsuarios.add(user);
            }
            conexion.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto a consultar ");
            e.printStackTrace();
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listaUsuarios;
    }

    public static LinkedList<Publicacion> getPublicaciones() {
        LinkedList<Publicacion> listaPublicaciones = new LinkedList<>();
        Connection conexion = null;
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            conexion = new Conexion().getConnection();
            Statement st = conexion.createStatement();
            Statement st2 = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from mpublicacion");
            ResultSet rs2 = st2.executeQuery("select * from dpublicacion");
            while (rs.next() && rs2.next()) {
                Publicacion pub = new Publicacion();
                pub.setUser_id(rs.getInt("usr_id"));
                pub.setPub_id(rs.getInt("pub_id"));
                pub.setTitulo(rs.getString("pub_tit"));
                pub.setTexto(rs2.getString("pub_txt"));
                pub.setVotos(rs2.getInt("pub_vot"));
                pub.setDate(rs2.getDate("pub_dat"));
                listaPublicaciones.add(pub);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto a consultar ");
            e.printStackTrace();
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listaPublicaciones;
    }

    public static void getPublicaciones(String q, String q2) {
        Connection conexion = null;
        listaPublicacionesq.clear();
        new Operaciones().resetRowNumber();
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            conexion = new Conexion().getConnection();
            Statement st = conexion.createStatement();
            Statement st2 = conexion.createStatement();
            ResultSet rs = st.executeQuery(q);
            ResultSet rs2 = st2.executeQuery(q2);
            while (rs.next() && rs2.next()) {
                Publicacion pub = new Publicacion();
                pub.setUser_id(rs.getInt("usr_id"));
                pub.setPub_id(rs.getInt("pub_id"));
                pub.setTitulo(rs.getString("pub_tit"));
                pub.setTexto(rs2.getString("pub_txt"));
                pub.setVotos(rs2.getInt("pub_vot"));
                pub.setDate(rs2.getDate("pub_dat"));
                pub.setTyp_id(rs2.getInt("typ_id"));
                listaPublicacionesq.add(pub);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto a consultar q q2");
            e.printStackTrace();
        } finally {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static LinkedList<Publicacion> getPubs() {
        return listaPublicacionesq;
    }
}
