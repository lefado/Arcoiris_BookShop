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
public class Client {

    //Client data
    private String user;
    private String email;
    private String name;
    private String lastname;
    //Book data
    private int ISBN;
    private String writer;
    private String title;
    private int price;
    private String genre;
    //Purchase data
    private int unit;

    Connect cx = new Connect();

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getISBN() {
        return ISBN;
    }

    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    /**
     * Methods clients*
     */
    public List<Client> listAllClient() throws ClassNotFoundException, SQLException {

        List<Client> l = new ArrayList<Client>();
        cx.on();
        String com = "SELECT DISTINCT t2.USER,t2.NAME,t2.EMAIL,t2.LASTNAME FROM PURCHASE t1, USERS t2 WHERE t1.USER=t2.USER;";
        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            Client c = new Client();
            c.setUser(rs.getString("user"));
            c.setName(rs.getString("name"));
            c.setEmail(rs.getString("email"));
            c.setLastname(rs.getString("lastname"));
            l.add(c);
        }
        cx.off();
        return l;
    }

    public List<Client> listTopClient(String id) throws ClassNotFoundException, SQLException {

        List<Client> l = new ArrayList<Client>();
        cx.on();
        String com = "SELECT SUM( UNIT ) as unit , USER"
                + " FROM PURCHASE"
                + " GROUP BY USER"
                + " ORDER BY SUM( UNIT ) DESC"
                + " LIMIT " + id;

        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            Client c = new Client();
            c.setUser(rs.getString("user"));
            c.setUnit(Integer.parseInt(rs.getString("unit")));
            l.add(c);
        }
        cx.off();
        return l;
    }

    public String CountClient() throws ClassNotFoundException, SQLException {
        cx.on();
        String val = "";
        String com = "SELECT count(distinct user) as tot FROM PURCHASE";

        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            val = rs.getString("tot");
        }
        cx.off();
        return val;
    }
    
    public List<Client> listAllBookClient(String nick) throws ClassNotFoundException, SQLException {

        List<Client> l = new ArrayList<Client>();
        cx.on();
        String com = "SELECT DISTINCT t2.TITLE, t2.WRITER"
                        + " FROM PURCHASE t1, BOOK t2"
                        + " WHERE t1.USER = '"+nick
                        + "' AND t2.ISBN = t1.ISBN";


        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            Client c = new Client();
            Book b = new Book();
            String image= b.loadImage(rs.getString("title")); //Transform the book tittle to image ling 
            c.setLastname(image); //Actually, I send image link
            c.setTitle(rs.getString("title"));
            c.setWriter(rs.getString("writer"));
            l.add(c);
        }
        cx.off();
        return l;
    }
}
