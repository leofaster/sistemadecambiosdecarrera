/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author CHANGE Gate
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {
    
    private static Connection connection = null;

    public static Connection getConnection() {
        return connection;
    }
    
    public static void establishConnection() {
        if (connection != null)
            return;
        
        String url = "jdbc:postgresql://localhost:5432/prueba";
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, "postgres", "12345");
           
            if (connection != null) {
                System.out.println("Connecting to database...");
            }
        
        } catch(Exception e) {
            System.out.println("Problem when connecting to the database 1");
        }
    }
    
    public static void closeConnection() {
        try {
            connection.close();
        } catch(Exception e) {
            System.out.println("Problem to close the connection to the database");
        }
    }
    
}