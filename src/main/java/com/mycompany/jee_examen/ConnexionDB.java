package com.mycompany.jee_examen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnexionDB {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost/jee_examen", "root", "root");
            System.out.println("Connexion réussie");
        } catch (Exception ex) {
            Logger.getLogger(ConnexionDB.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Connexion échouée");
        }
        return conn;  
    }
}
