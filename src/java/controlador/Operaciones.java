package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author PORTO
 */
public class Operaciones {
    public static Connection getConnection(){
        //cambiar nombre de la bd
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
    
        public int nivel_consulta(String usuario, String password){
        int nivel = 0;
        try{
            Connection con = Operaciones.getConnection();
            ResultSet rs;

            //verificar nombre de las columnas
            String q = "select nivel from Usuarios where nombre = ? and password = ?)";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, usuario);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                nivel = rs.getInt(1);
            }
            con.close();
        }catch(Exception ed){
            System.out.println(ed.getMessage());
            System.out.println(ed.getStackTrace());
        }
        return nivel;
    }
}
