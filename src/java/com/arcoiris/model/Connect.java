/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mason
 */
public class Connect {

    private Connection con = null;
    private Statement consulta = null;
    private ResultSet data = null;

    private String server;
    private String BD;
    private String userBD;
    private String passBD;

    public Connect() {
//        this.server = "127.8.158.2:3306"; //local host
//        this.BD = "diego";
//        this.userBD = "admin1Een2er";
//        this.passBD = "kI7pt-K4fnrL";
        
        this.server = "127.0.0.1:3306"; //local host
        this.BD = "arcoiris";
        this.userBD = "erickson";
        this.passBD = "12345678";

    }

    // metodo para abrir conexion
    public void on() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver"); // Cargamos el driver
        String url = "jdbc:mysql://" + this.server + "/" + this.BD;
        this.con = DriverManager.getConnection(url, this.userBD, this.passBD);
        this.consulta = con.createStatement(); //inicializa el objeto Statement para SQL
    }

    //metodo para cerrar conexion
    public void off() throws SQLException {
        this.con.close();
    }

    //metodo para ejecutar SQL: Insert,Update,Delete
    public int execQuery(String com) {
        int res = 0;

        try {

            this.on();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            
            res = this.consulta.executeUpdate(com);
            

        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {

            this.off();

        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    //metodo para ejecutar QUERY: Select
    public ResultSet getQuery(String com) {

//        try {
//
//            this.on();
//
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
//        }
        try {

            this.data = this.consulta.executeQuery(com);

        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
//        try {
//            this.off();
//        } catch (SQLException ex) {
//            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return data;
    }
    
    public int countRow(String com) throws SQLException{
        int count = 0;
        try {
            this.on();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            this.data = this.consulta.executeQuery(com);
            
        } catch (SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        while (data.next()){
            count++;
        }
        return count;
    }
}
