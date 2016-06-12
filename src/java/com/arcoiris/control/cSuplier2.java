/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.control;

import com.arcoiris.model.Suplier;
import com.arcoiris.model.Suplier2;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
public class cSuplier2 extends HttpServlet {

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
        if (opc == null) {
            opc = "";
        }

        if (opc.contains("del")) {
            try {
                deleteSuplier(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (opc.contains("upd")) {
            try {
                updateSuplier(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try {

            //Procedure to get data to listsuplier2.jsp
            listSuplier(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
        }

        getServletContext().getRequestDispatcher("/suplier2.jsp").forward(request, response);

    }

    public void updateSuplier(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
        String id = request.getParameter("id");
        Suplier2 s = new Suplier2();
        Suplier2 r = s.findSuplier(id);

        request.setAttribute("Suplier2", r);

    }

    public void deleteSuplier(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException, SQLException {
        String id = request.getParameter("id");
        Suplier2 s = new Suplier2();
        int r = s.deleteSuplier(id);
        if (r == 1) {
            request.setAttribute("action", "3");//resgistration correct
        } else {
            request.setAttribute("action", "4"); //Registration error
        }
    }

    //Llamada a listsuplier.jsp
    public void listSuplier(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ClassNotFoundException, SQLException {
        List<Suplier2> l = new ArrayList<Suplier2>();
        Suplier2 s = new Suplier2();

        l = s.listAllSuplier();

        request.setAttribute("listSuplier", l); //Save list in objet request

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

        String opc = request.getParameter("f_submit");
        if (opc.contains("Submit")) {
            int r = registerSuplier(request, response); //Register a new Suplier
            if (r == 1) {
                request.setAttribute("action", "1");//resgistration correct
            } else {
                request.setAttribute("action", "2"); //Registration error
            }
        } else if (opc.contains("Update")) {
            int r=0;
            try {
                r = UpdateRegisterSuplier(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(cSuplier2.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (r == 1) {
                request.setAttribute("action", "5");//resgistration correct
            } else {
                request.setAttribute("action", "6"); //Registration error
            }
        }

        doGet(request, response);
//        getServletContext().getRequestDispatcher("/suplier2.jsp").forward(request, response);

    }
    
    public int UpdateRegisterSuplier(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
        Suplier2 s = new Suplier2();
        s.setIdSuplier(request.getParameter("f_idsuplier"));
        s.setRuc(request.getParameter("f_ruc"));
        s.setPhone(request.getParameter("f_phone"));
        s.setAddress(request.getParameter("f_address"));
        s.setState(request.getParameter("f_state"));

        return (s.updateSuplier(s));

    }

    public int registerSuplier(HttpServletRequest request, HttpServletResponse response) {
        Suplier2 s = new Suplier2();
        s.setRuc(request.getParameter("f_ruc"));
        s.setPhone(request.getParameter("f_phone"));
        s.setAddress(request.getParameter("f_address"));
        s.setState(request.getParameter("f_state"));

        return (s.registerSuplier(s));

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
