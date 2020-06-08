/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author PORTO
 */
public final class Conexion {

    private static java.sql.Connection con;
    private static final String URL = "jdbc:mysql://localhost:3306/db_FAEv1";
    private static final String USER = "root";
    private static final String PASS = "root";

    public java.sql.Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(URL, USER, PASS);
        return con;
    }

}
