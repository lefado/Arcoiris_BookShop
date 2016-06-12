/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mason
 */
public class Suplier2 {

    private String idSuplier;
    private String ruc; //Identificador de la razon socal
    private String phone;
    private String address;
    private String state;
    
    Connect cx = new Connect();

    public Suplier2(String idSuplier, String ruc, String phone, String address, String state) {
        this.idSuplier = idSuplier;
        this.ruc = ruc;
        this.phone = phone;
        this.address = address;
        this.state = state;
                
    }

    public Suplier2(){
        
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
        
    
    public int registerSuplier(Suplier2 p){
         String com = "INSERT INTO SUPLIER (IDSUPLIER,RUC,PHONE,ADDRESS,STATE)"
                + //Consulta SQL
                "VALUES (NULL,'" + p.getRuc() + "','" + p.getPhone() + "','" + p.getAddress() + "','" + p.getState() + "')";

        int res = cx.execQuery(com);
        return res;
    }
    
    public int deleteSuplier(String id) throws ClassNotFoundException, SQLException {
        String com = "DELETE FROM SUPLIER WHERE IDSUPLIER=" + id;
        int res = cx.execQuery(com);
        return res;
    }
    
    public int updateSuplier(Suplier2 s) throws ClassNotFoundException, SQLException {
        
        String com = "UPDATE SUPLIER SET"
                + " RUC='" + s.getRuc() + "'"
                + " , ADDRESS='" + s.getAddress() + "'"
                + " , PHONE='" + s.getPhone() + "' , STATE='" + s.getState() + "'"
                + " WHERE IDSUPLIER=" + s.getIdSuplier();
        System.out.println("upd " + com);
        int res = cx.execQuery(com);
        return res;
    }
    
    public Suplier2 findSuplier(String id) throws ClassNotFoundException, SQLException {
        cx.on();
        String com = "SELECT * FROM SUPLIER WHERE IDSUPLIER="+id;
        ResultSet rs = cx.getQuery(com);
        Suplier2 s = new Suplier2();       
        while (rs.next()){
            
            s.setIdSuplier(id);
            s.setRuc(rs.getString("ruc"));
            s.setPhone(rs.getString("phone"));
            s.setAddress(rs.getString("address"));
            s.setState(rs.getString("state"));      
        }
        cx.off();
        return s;
    }
    
    public List<Suplier2> listAllSuplier() throws ClassNotFoundException, SQLException{
        List<Suplier2> l = new ArrayList<Suplier2>();
        
        cx.on();
        String com = "SELECT * FROM SUPLIER";
        ResultSet rs = cx.getQuery(com);
        while (rs.next()){
            Suplier2 s = new Suplier2();
            s.setIdSuplier(rs.getString("IDSUPLIER"));
            s.setRuc(rs.getString("ruc"));
            s.setPhone(rs.getString("phone"));
            s.setAddress(rs.getString("address"));
            s.setState(rs.getString("state"));
            l.add(s);
        }
        cx.off();
        
        return l;
    }
}
