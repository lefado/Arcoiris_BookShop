/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import static org.apache.tomcat.jni.Time.now;

/**
 *
 * @author mason
 */
public class Sesion {

    private String id;
    private String user;
    private String initiate;
    private String finish;
    private String ip;
    private String host;
    private String servername;
    private String state;

    Connect cx = new Connect();

    public Sesion() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getInitiate() {
        return initiate;
    }

    public void setInitiate(String initiate) {
        this.initiate = initiate;
    }

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getServername() {
        return servername;
    }

    public void setServername(String servername) {
        this.servername = servername;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

  
    
    

    //METODOS Y OPERACIONES
    public int registrarSesion(Sesion s) throws ClassNotFoundException, SQLException {

        cx.on(); //Abrimos conexioin

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

        String com = "INSERT INTO SESION (id,user,initiate,finish,ip,host,servername,state)"
                + //Consulta SQL
                " VALUES ('" + s.getId() + "','" + s.getUser() + "','" + timeStamp + "','"
                + timeStamp + "','" + s.getIp() + "','" + s.getHost()
                + "','" + s.getServername() + "','1')";
        System.out.println("Consulta registrarSesion = "+com);
        int res = cx.execQuery(com);
        cx.off();

        return res;
    }
    
    public int buscarSesion(String id) throws SQLException, ClassNotFoundException {
        cx.on();
        String com = "SELECT * FROM SESION";
        ResultSet rs = cx.getQuery(com);
        int res = 0;
        while (rs.next()) {
            if (rs.getString("id").contentEquals(id)) {

                res=1;
            }
        }
        cx.off();
       return res;
    }
    
    public int actualizarSesion(String id) throws ClassNotFoundException, SQLException {

        cx.on(); //Abrimos conexioin

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

        String com = "UPDATE SESION SET finish='"+ timeStamp + "' WHERE id='"+ id +"'";
                
        System.out.println("Update registrarSesion = "+com);
        int res = cx.execQuery(com);
        cx.off();

        return res;
    }
}
