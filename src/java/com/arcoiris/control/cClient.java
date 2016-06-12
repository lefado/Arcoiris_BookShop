/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.control;

import com.arcoiris.model.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mason
 */
public class cClient extends HttpServlet {

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
//            out.println("<title>Servlet cClient</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet cClient at " + request.getContextPath() + "</h1>");
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
   

        try {
            all_clients_top(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cClient.class.getName()).log(Level.SEVERE, null, ex);
        }

        all_clients_section(request, response);
        getServletContext().getRequestDispatcher("/all_clients.jsp").forward(request, response);
        
    }

    //Llamada a all_clients_top.jsp
    public void all_clients_top(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        List<Client> l = new ArrayList<Client>();
        Client c = new Client();

        String LIMIT = request.getParameter("LIMIT");
        
        if (LIMIT == null) { //Initialialize 1
            LIMIT = "1";
        }
        System.out.println("LIMIT" + LIMIT);

        l = c.listTopClient(LIMIT); //List LIMIT number of best buyers
        
        String N_buyers = c.CountClient();//Total numbers of buyers

        request.setAttribute("list_top", l); //Save list in objet request
        request.setAttribute("N_buyers", N_buyers);

    }

    //Llamada a all_clients_section.jsp
    public void all_clients_section(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Client> l = new ArrayList<Client>();
        Client c = new Client();
        try {
            l = c.listAllClient();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cClient.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("list", l); //Save list in objet request

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
