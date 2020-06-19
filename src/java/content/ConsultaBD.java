package content;

import config.Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
//import modelo.Contacto;
//import modelo.Producto;

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

//   public static LinkedList<Producto> getProductos(){
//       LinkedList<Producto> listaContactos=new LinkedList<Producto>();
//      try
//      {
//         Class.forName("org.gjt.mm.mysql.Driver");
//         Connection conexion = DriverManager.getConnection(
//            "jdbc:mysql://localhost:3306/crud", "root", "root");
//         Statement st = conexion.createStatement();
//         Statement st2 = conexion.createStatement();
//         ResultSet rs = st.executeQuery("select * from mproducto" );
//         ResultSet rs2 = st2.executeQuery("select * from dproducto" );
//         while (rs.next() && rs2.next())
//         {
//            Producto contacto = new Producto();
//            contacto.setId(rs.getInt("id_mprod"));
//            contacto.setNombres(rs.getString("nom_mprod"));
//            contacto.setDescripcion(rs2.getString("desc_prod"));
//            contacto.setPrecio(rs2.getDouble("precio_prod"));
//            contacto.setStock(rs2.getInt("stock_prod"));
//            listaContactos.add(contacto);
//         }
//      }
//      catch (Exception e)
//      {
//          System.out.println("No se conecto a consultar ");
//         e.printStackTrace();
//      }
//      return listaContactos;
//   }
}
