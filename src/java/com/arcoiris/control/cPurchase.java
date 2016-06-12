/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.control;

import com.arcoiris.model.Purchase;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mason
 */
public class cPurchase extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet cPurchase</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet cPurchase at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String isbns = request.getParameter("isbn");
        String units = request.getParameter("unit");
        String[] isbn_s = isbns.split("\\|");
        String[] unit_s = units.split("\\|");
        String user = "";

        if (isbn_s[0] == "") { //If doesnt exist any book
            response.sendRedirect("basket.jsp?auth=x");
            return;
        }

        HttpSession sesionOK = request.getSession();
        //If user is not login
        if (sesionOK.getAttribute("user") == null) {
            response.sendRedirect("basket.jsp?auth=no");
            return;
        } else {
            user = sesionOK.getAttribute("user").toString();
        }

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

        List<Purchase> l = new ArrayList<Purchase>();

        for (int i = 0; i < isbn_s.length; i++) {

            int isbn = Integer.parseInt(isbn_s[i]);
            int unit = Integer.parseInt(unit_s[i]);

            Purchase p = new Purchase();
            p.setIsbn(isbn);
            p.setUnit(unit);
            p.setUser(user);
            p.setDate(timeStamp);
            l.add(p);

        }

        Purchase p = new Purchase();

        try {
            p.insertPurchase(l);
            //<a href="javascript:;" class="simpleCart_checkout btn btn-default btn-lg">Check Out</a>
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cPurchase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("basket2.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
