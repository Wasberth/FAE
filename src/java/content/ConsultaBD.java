package content;

import config.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

public class ConsultaBD {

    public static LinkedList<ConsejerosAtributos> getConsejeros() {
        LinkedList<ConsejerosAtributos> listaConsejeros = new LinkedList<>();
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conexion = new Conexion().getConnection();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("select * from musuario");
            while (rs.next()) {
                ConsejerosAtributos contacto = new ConsejerosAtributos();
                contacto.setUsr_id(rs.getInt("usr_id"));
                contacto.setUsr_niv(rs.getInt("usr_niv"));
                contacto.setUsr_tag(rs.getString("usr_tag"));
                contacto.setUsr_pas(rs.getString("usr_pas"));
                listaConsejeros.add(contacto);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto a consultar ");
            e.printStackTrace();
        }
        return listaConsejeros;
    }
    
    
    public static LinkedList<Publicacion> getPublicaciones() {
        LinkedList<Publicacion> listaPublicaciones = new LinkedList<>();
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conexion = new Conexion().getConnection();
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
                pub.setVotos(rs.getInt("pub_vot"));
                pub.setDate(rs2.getDate("pub_dat"));
                listaPublicaciones.add(pub);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se conecto a consultar ");
            e.printStackTrace();
        }
        return listaPublicaciones;
    }
}
