/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.control;

import com.arcoiris.model.Suplier;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mason
 */
public class cSuplier extends HttpServlet {

    Suplier p = new Suplier();

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

//        PrintWriter out;
//        out = response.getWriter();
//        String titulo = "desde el Servlet";
//        response.setContentType("text/html");
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>");
//        out.println("</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println(titulo);
//        out.println("</body>");
//        out.println("</html>");
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
        String opc = request.getParameter("opc");

        if (opc.contains("del")) {

            try {
                eliminarProveedor(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (opc.contains("upd")) {
//               actualizarProveedor(request,response);

        }
    }

    protected void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {

        String id = request.getParameter("id");

        String msj = "";

        int valor = p.deleteSuplier(id);
        if (valor == 1) {
            msj = "1";//Correcto
        } else {
            msj = "2"; //Error en la eliminacion
        }
        response.sendRedirect("suplier.jsp?opc=del&msj=" + msj);
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
//        processRequest(request, response);
        String opc = request.getParameter("f_opc");
        System.out.println("opc: " + opc);

        if (opc.contains("reg")) {

            try {
                register_suplier(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (opc.contains("act")) {
            update_suplier(request, response);

        }
    }

    protected void register_suplier(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {

        String ruc = request.getParameter("f_ruc");
        String phone = request.getParameter("f_phone");
        String address = request.getParameter("f_address");
        String state = request.getParameter("f_state");

        p.setRuc(ruc);
        p.setPhone(phone);
        p.setAddress(address);
        p.setState(state);

        p.registrationSuplier(p); // Meto el objeto en la BBDD

        response.sendRedirect("suplier.jsp");
    }

    protected void update_suplier(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int idp = Integer.valueOf(request.getParameter("f_id"));
        String msj = "";

        String idp = request.getParameter("f_id");
        String ruc = request.getParameter("f_ruc");
        String phone = request.getParameter("f_phone");
        String address = request.getParameter("f_address");
        String state = request.getParameter("f_state");

        p.setIdSuplier(idp);
        p.setRuc(ruc);
        p.setPhone(phone);
        p.setAddress(address);
        p.setState(state);

        int valor = 0;
        try {
            valor = p.updateSuplier(p); // Meto el objeto en la BBDD

        } catch (SQLException ex) {
            Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cSuplier.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (valor == 1) {
            msj = "3";//Correcto
        } else {
            msj = "4"; //Error en la eliminacion
        }

        response.sendRedirect("suplier.jsp?msj=" + msj);

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
