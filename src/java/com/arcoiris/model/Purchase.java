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
public class Purchase {

    private String user;
    private int isbn;
    private String date;
    private int unit;

    Connect cx = new Connect();

    public Purchase() {

    }

    public Purchase(String user, int isbn, String date, int unit) {
        this.user = user;
        this.isbn = isbn;
        this.date = date;
        this.unit = unit;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    /*METHODS*/
    public int insertPurchase(List<Purchase> l) throws ClassNotFoundException, SQLException {

        cx.on(); //Abrimos conexioin
        int res = 0;
        for (int i = 0; i < l.size(); i++) {

            int isbn = l.get(i).getIsbn();
            int unit = l.get(i).getUnit();
            String user = l.get(i).getUser();
            String date = l.get(i).getDate();

            String com = "INSERT INTO PURCHASE (USER,ISBN,DATE,UNIT)"
                    + //Consulta SQL
                    " VALUES ('" + user + "','" + isbn + "','" + date + "','"
                    + unit + "')";
            res = cx.execQuery(com);
        }
        cx.off();

        return res;
    }

    /*PROCEDURES FOR TOP SELLERS BOOK*/
    //Returns ISBN sort by most sell
    public List<String> TopSalesBook(String id) throws ClassNotFoundException, SQLException {

        List<String> l = new ArrayList<String>();
        cx.on();
        String com = "SELECT SUM(UNIT) as TOTAL FROM `PURCHASE` GROUP BY ISBN"
                + " ORDER BY SUM(UNIT) DESC LIMIT "+id;
        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            String total = rs.getString("total");
            l.add(total);
        }
        cx.off();
        return l;
    }
    
    //Returns numbers of different book which has been bought
    public int NSalesBook() throws ClassNotFoundException, SQLException {

        int tot=0;
        cx.on();
        String com = "SELECT COUNT(DISTINCT ISBN) as TOT  FROM `PURCHASE`;"; 
        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            tot = Integer.parseInt(rs.getString("tot"));
            
        }
        cx.off();
        return tot;
    }
    
    //Returns numbers of different book which has been bought
    public int NSales() throws ClassNotFoundException, SQLException {

        int tot=0;
        cx.on();
        String com = "SELECT COUNT(ISBN) as TOT  FROM `PURCHASE`;"; 
        ResultSet rs = cx.getQuery(com);
        while (rs.next()) {
            tot = Integer.parseInt(rs.getString("tot"));
            
        }
        cx.off();
        return tot;
    }

    /*Info ob books best sellers*/
    public List<Book> TopInfoSalesBook() throws ClassNotFoundException, SQLException {

        List<Book> l = new ArrayList<Book>();
        cx.on();
        String com = "SELECT t1.*,t2.TOTAL FROM `BOOK` t1,"
                + "(SELECT SUM(UNIT) as TOTAL,ISBN"
                + " FROM `PURCHASE`"
                + " GROUP BY ISBN"
                + " ORDER BY SUM( UNIT ) DESC"
                + " ) t2"
                + " WHERE t1.ISBN=t2.ISBN;";
        ResultSet rs = cx.getQuery(com);

        while (rs.next()) {
            Book b = new Book();
            b.setISBN(Integer.parseInt(rs.getString("ISBN")));
            b.setPrice(Integer.parseInt(rs.getString("PRICE")));
            b.setTitle(rs.getString("TITLE"));
            b.setWriter(rs.getString("WRITER"));
            b.setGenre(rs.getString("GENRE"));
            l.add(b);
        }
        cx.off();

        return l;
    }

}
