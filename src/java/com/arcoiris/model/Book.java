/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.model;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author mason
 */
public class Book {

    private int ISBN;
    private int year;
    private String writer;
    private String title;
    private int price;
    private String genre;
    private String cover;

//    Connect cx = new Connect();

    public Book() {

    }

    @Override
    public String toString() {
        return "Book{" + "ISBN=" + ISBN + ", year=" + year + ", writer=" + writer + ", title=" + title + ", price=" + price + ", genre=" + genre + '}';
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getISBN() {
        return ISBN;
    }

    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
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

    /*METHODS*/
    public ResultSet listBook() throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT * FROM BOOK";
        ResultSet rs = cx.getQuery(com);

        return rs;
    }
    
    public List<Book> listBookList() throws ClassNotFoundException, SQLException {
Connect cx = new Connect();
        cx.on();
        List<Book> l = new ArrayList<Book>();
        String com = "SELECT * FROM BOOK";
        ResultSet rs = cx.getQuery(com);
        while (rs.next()){
            Book b = new Book();
            b.setISBN(Integer.parseInt(rs.getString("ISBN")));
            b.setYear(Integer.parseInt(rs.getString("YEAR")));
            b.setWriter(rs.getString("WRITER"));
            b.setTitle(rs.getString("TITLE"));
            b.setPrice(Integer.parseInt(rs.getString("PRICE")));
            b.setGenre(rs.getString("GENRE"));
            b.setCover(loadImage(rs.getString("TITLE")));
            l.add(b);
        }
        cx.off();
        return l;
    }

    public ResultSet listBookGenre(String id) throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT * FROM BOOK WHERE GENRE='" + id + "'";
        ResultSet rs = cx.getQuery(com);
        return rs;
    }

    public ResultSet listBookWriter(String id) throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT * FROM BOOK WHERE WRITER='" + id + "'";
        ResultSet rs = cx.getQuery(com);
        return rs;
    }

    public ResultSet listBookPrice(String int1s, String int2s) throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        int int1 = Integer.parseInt(int1s);
        int int2 = Integer.parseInt(int2s);
        String com = "SELECT * FROM BOOK WHERE PRICE >=" + int1 + " AND PRICE <=" + int2 + " ORDER BY PRICE ASC";
        ResultSet rs = cx.getQuery(com);
        return rs;
    }
    
    public ResultSet listBookSearch(String id) throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        
        String com = "SELECT * FROM BOOK WHERE TITLE LIKE '%"+ id +"%' "
                                           +"OR WRITER LIKE '%"+ id +"%'"
                                           +"OR GENRE LIKE '%"+ id +"%'"
                                           +"OR PRICE LIKE '%"+ id +"%'";
        ResultSet rs = cx.getQuery(com);
        System.out.println("SEARCH" + com);
        return rs;
    }
    
    
    /*Info ob books best sellers*/
    public ResultSet TopInfoSalesBook(String id) throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT t1.* FROM `BOOK` t1,"
                + "(SELECT SUM(UNIT) as TOTAL,ISBN"
                + " FROM `PURCHASE`"
                + " GROUP BY ISBN"
                + " ORDER BY SUM( UNIT ) DESC"
                + " ) t2"
                + " WHERE t1.ISBN=t2.ISBN"
                + " LIMIT " + id +";";
        System.out.println("aaa"+ com);
        ResultSet rs = cx.getQuery(com);
//        cx.off();
        return rs;
    }
    

    /*Return link to the image, from its name*/
    public String loadImage(String name) {
        String result = name.toUpperCase();
        result = result.replaceAll(" ", "_");

        result = "images/books/" + result + ".jpg";
        return result;
    }

    public List<String> listWriter() throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT DISTINCT WRITER FROM BOOK";
        ResultSet rs = cx.getQuery(com);

        List<String> l = new ArrayList<String>();

        while (rs.next()) {
            l.add(rs.getString("Writer"));
        }

        cx.off();
        return l;
    }

    public List<String> listGenre() throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT DISTINCT GENRE FROM BOOK";
        ResultSet rs = cx.getQuery(com);

        List<String> l = new ArrayList<String>();

        while (rs.next()) {
            l.add(rs.getString("Genre"));
        }

        cx.off();
        return l;
    }

    public String listMinPrice() throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT MIN(PRICE) as MIN FROM BOOK";
        ResultSet rs = cx.getQuery(com);
        String min="";
        while (rs.next()) {
             min = rs.getString("MIN");
        }
        cx.off();        
        return min;
    }

    public String listMaxPrice() throws ClassNotFoundException, SQLException {
        Connect cx = new Connect();
        cx.on();
        String com = "SELECT MAX(PRICE) as MAX FROM BOOK";
        ResultSet rs = cx.getQuery(com);
        String max="";
        while (rs.next()) {
             max = rs.getString("MAX");
        }
        cx.off();
        return max;
    }

    public List<String> listRangePrice() throws ClassNotFoundException, SQLException {
        List<String> l = new ArrayList<String>();

        String mins = "";
        String maxs = "";

        mins = listMinPrice();//Return min and max prices values

        maxs = listMaxPrice();//Return min and max prices values

        int min = Integer.parseInt(mins);
        int max = Integer.parseInt(maxs);

        //Rank
        int range_min = (int) Math.floor((double) (min * 0.1)) * 10;
        int range_max = (int) Math.ceil((double) (max * 0.1)) * 10;

        int n = (range_max - range_min) / 10; //Numbers or ranges (10by10)
        int value = range_min;

        for (int i = 0; i < n; i++) {           
            String value_s = Integer.toString(value);
            String value_s2 = Integer.toString(value + 10);
            l.add(value_s + "-" + value_s2);
             value += 10;
        }

        return l;
    }
                
}
