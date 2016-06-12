/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mason
 */
public class Suplier {

    private String idSuplier;
    private String ruc; //Identificador de la razon socal
    private String phone;
    private String address;
    private String state;

    Connect cx = new Connect();

    //Constructor
    public Suplier() {
    }

    public Suplier(String idSuplier, String ruc, String phone, String address, String state) {
//        this.idSuplier = idSuplier;
        this.ruc = ruc;
        this.phone = phone;
        this.address = address;
        this.state = state;
    }

    public String getIdSuplier() {
        return idSuplier;
    }

    public void setIdSuplier(String idSuplier) {
        this.idSuplier = idSuplier;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Connect getCx() {
        return cx;
    }

    public void setCx(Connect cx) {
        this.cx = cx;
    }

    // Metodos y operaciones
    public int registrationSuplier(Suplier p) throws SQLException, ClassNotFoundException {
//        System.out.println("HOLA");
//        cx.on(); //Abrimos conexioin
        String com = "INSERT INTO SUPLIER (IDSUPLIER,RUC,PHONE,ADDRESS,STATE)"
                + //Consulta SQL
                "VALUES (NULL,'" + p.getRuc() + "','" + p.getPhone() + "','" + p.getAddress() + "','" + p.getState() + "')";

        int res = cx.execQuery(com);
//        cx.off();

        return res;
    }

    public ResultSet listSuplier() throws ClassNotFoundException, SQLException {
        cx.on();
        String com = "SELECT * FROM SUPLIER";
        ResultSet rs = cx.getQuery(com);
        
        return rs;
    }

    public int deleteSuplier(String id) throws ClassNotFoundException, SQLException {
        String com = "DELETE FROM SUPLIER WHERE IDSUPLIER=" + id;
//        cx.con(); //Abrimos conexioin
        int res = cx.execQuery(com);
//        cx.desconectar();

        return res;
    }

    public int updateSuplier(Suplier p) throws ClassNotFoundException, SQLException {
        String com = "UPDATE SUPLIER SET"
                + " RUC='" + p.getRuc() + "'"
                + " , ADDRESS='" + p.getAddress() + "'"
                + " , PHONE='" + p.getPhone() + "' , STATE='" + p.getState() + "'"
                + " WHERE IDSUPLIER=" + p.getIdSuplier();

        System.out.println("IDDDD "+ p.getIdSuplier());
        System.out.println("COM= " + com);
//        cx.con(); //Abrimos conexioin
        int res = cx.execQuery(com);
//        cx.desconectar();

        return res;
    }

    public ResultSet searchSuplier(String id) throws ClassNotFoundException, SQLException {
        cx.on();
        
        String com = "SELECT * FROM SUPLIER WHERE IDSUPLIER=" + id;
        ResultSet rs = cx.getQuery(com);
        
//        cx.off();
        return rs;
    }
}
