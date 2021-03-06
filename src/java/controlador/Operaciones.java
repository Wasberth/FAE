package controlador;

import config.Conexion;
import content.ConsultaBD;
import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Operaciones {

    private int id;
    private static int idBorrador;
    private static String textBorrador;
    private static String titleBorrador;
    private String etiqueta = "";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        return new Conexion().getConnection();
    }

    public int loguear(String usuario, String password) {

        System.out.println("Usuario: " + usuario);
        System.out.println("Password: " + password);
        int nivel = 0;
        Connection con = null;
        try {
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
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
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
        System.out.println(id_usuario);
        int id = 0;
        Connection con = null;
        try {
            String q = "SELECT pub_id FROM Mpublicacion WHERE usr_id = ? ORDER BY pub_id DESC LIMIT 1";
            System.out.println(q);
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
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getLastPublicacion");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return id;
    }

    public String getNombreUser(int id_pub) {
        String nombre = "";
        int id_usr = 0;
        Connection con = null;
        try {
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }

            ResultSet rs;
            String q = "SELECT * FROM mpublicacion where pub_id=" + id_pub + ";";
            PreparedStatement ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while (rs.next()) {
                id_usr = rs.getInt("usr_id");
            }

            ResultSet rs2;
            String q2 = "SELECT * FROM musuario where usr_id=" + id_usr + ";";
            PreparedStatement ps2 = con.prepareStatement(q2);
            rs2 = ps2.executeQuery();
            while (rs2.next()) {
                nombre = rs2.getString("usr_tag");
            }

            con.close();
        } catch (SQLException ed) {
            System.out.println(ed.getMessage());
            System.out.println(Arrays.toString(ed.getStackTrace()));
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return nombre;
    }

    public boolean hasBorrador(int id_usuario) {
        System.out.println("Entré a hasborrador");
        Connection con = null;
        try {
            String q = ""
                    + "SELECT `DPublicacion`.`pub_id` AS `id`, `MPublicacion`.`pub_tit` AS `titulo`, `DPublicacion`.`pub_txt` AS `texto` FROM `MPublicacion`, `DPublicacion` WHERE `MPublicacion`.`pub_id` = `DPublicacion`.`pub_id` AND `DPublicacion`.`typ_id` = 3 AND `MPublicacion`.`usr_id` = ?";

            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            ps.setInt(1, id_usuario);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
                idBorrador = rs.getInt("id");
                System.out.println(q);
                System.out.println("Esta es la id " + rs.getInt("id"));
                titleBorrador = rs.getString("titulo");
                textBorrador = rs.getString("texto");
            }
            if (i == 0) {
                idBorrador = 0;
                titleBorrador = "";
                textBorrador = "";
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error hasBorrador");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return (idBorrador != 0);
    }

    public static int getIdBorrador() {
        return idBorrador;
    }

    public static String getTextBorrador() {
        return textBorrador;
    }

    public static String getTitleBorrador() {
        return titleBorrador;
    }

    public void resetRowNumber() {
        Connection con = null;
        try {
            String q = "SET @row_number:=0;";
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            int rs = 0;
            rs = ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getLastPublicacion");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public int getVotosByIdPub(int idpub) {
        int votos = 0;
        Connection con = null;
        try {
            String q = "SELECT * FROM dpublicacion WHERE pub_id = ? ";
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            ps.setInt(1, idpub);
            rs = ps.executeQuery();
            while (rs.next()) {
                votos = rs.getInt("pub_vot");
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getLastPublicacion");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return votos;
    }

    public String getPublicacionesPopulares() {
        String publicaciones = "";
        Connection con = null;
        try {
            String q = "SELECT MPublicacion.pub_tit AS `titulo` "
                    + "FROM MPublicacion, DPublicacion "
                    + "WHERE DPublicacion.pub_id = MPublicacion.pub_id AND DPublicacion.typ_id = 1 "
                    + "ORDER BY DPublicacion.pub_vot DESC "
                    + "LIMIT 3;";
            System.out.println(q);
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
                publicaciones = publicaciones + "<h4 style='color:whitesmoke;'>" + i + ". " + rs.getString("titulo") + "</h4>\n";
                System.out.println(publicaciones);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getPublicacionesPopulares");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return publicaciones;
    }

    public int getDenunciasByIdPub(int idpub) {
        int denunciadas = 0;
        Connection con = null;
        try {
            String q = "SELECT COUNT(*) AS `denunciadas` FROM MPublicacion, DHistorial WHERE DHistorial.pub_id = MPublicacion.pub_id AND DHistorial.hst_act = 3 AND MPublicacion.pub_id = ?;";
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            ps.setInt(1, idpub);
            rs = ps.executeQuery();
            while (rs.next()) {
                denunciadas = rs.getInt("denunciadas");
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getLastPublicacion");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return denunciadas;
    }

    public String getEtiquetaByIdPub(int pub_id) {
        String publicaciones = "";
        Connection con = null;
        try {
            String q = "SELECT CEtiquetas.eti_nom AS `nombre` FROM CEtiquetas, EPublicacionetiqueta WHERE CEtiquetas.eti_id = EPublicacionetiqueta.eti_id AND EPublicacionetiqueta.pub_id = " + pub_id + ";";
            System.out.println(q);
            try {
                con = Operaciones.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Operaciones.class.getName()).log(Level.SEVERE, null, ex);
            }
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = null;
            rs = ps.executeQuery();
            while (rs.next()) {
                publicaciones = rs.getString("nombre");
            }
            con.close();
        } catch (SQLException e) {
            System.out.println("Error getPublicacionesPopulares");
            System.out.println(e);
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConsultaBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return publicaciones;
    }

}
