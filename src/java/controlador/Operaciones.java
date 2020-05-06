package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author PORTO
 */
public class Operaciones {
    public static Connection getConnection(){
        String url="jdbc:mysql:3306/localhost/nombre_bd";
        String userName="root";
        String password="nomelo";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, userName, password);
        }catch(Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return con;
    }
    
        public static int Nivel(String usuario, String password){
        int nivel = 0;
        try{
            Connection con = Operaciones.getConnection();
            String q = "select nivel from Usuarios where nombre = ? and password = ?)";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, usuario);
            ps.setString(2, password);
            
            nivel = ps.executeUpdate();
            con.close();
        }catch(Exception ed){
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return nivel;
    }
}
