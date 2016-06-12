/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arcoiris.control;

import com.arcoiris.model.Login;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javafx.scene.web.WebEvent;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author mason
 */
public class cLogin extends HttpServlet {

    Login l = new Login();

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
        processRequest(request, response);

        String user = request.getParameter("f_user");
        String pass = request.getParameter("f_pass");

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

        String user = request.getParameter("f_user");
        String pass = request.getParameter("f_pass");
        String sign = request.getParameter("f_sign");
        
//        if (sign == null)
//            sign = "";
//        if (pass== null)
//            pass="";
//        if (user==null)
//            user = "";
        System.out.println("SIGN_IN" + sign);

        if (sign.contains("sign_in")) {
            signIn(user, pass, response);
            signSesion(request);
        } else if (sign.contains("sign_up")) {
            response.sendRedirect("registration.jsp");
        } else if (sign.contains("registration")) {
            try {
                signUp(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (sign.contains("update")) {
            try {
                signUpdate(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    protected void signIn(String user, String pass, HttpServletResponse response) throws IOException {

        l.setPassword(pass);
        l.setUser(user);

        boolean flag = false;
        try {
            flag = l.UserValidation(l);

        } catch (SQLException ex) {
            Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(cLogin.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!flag) {
            response.sendRedirect("login.jsp?auth=no");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    protected void signSesion(HttpServletRequest request) {

        //VARIABLES EN SESION
        HttpSession sesionOK = request.getSession();
        sesionOK.setAttribute("iduser", sesionOK.getId());
        sesionOK.setAttribute("user", request.getParameter("f_user"));
        sesionOK.setAttribute("state", 1);
        sesionOK.setAttribute("ip", request.getRemoteAddr());
        /////////////////////
    }

    protected void signUp(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException, ServletException {
        String user = request.getParameter("f_user");
        String email = request.getParameter("f_email");
        String pass = request.getParameter("f_pass");
        String name = request.getParameter("f_name");
        String lastname = request.getParameter("f_lastname");
        

        l.setPassword(pass);
        l.setUser(user);

        boolean flag = false;
        flag = l.UserValidationName(l);

        if (flag) {
            response.sendRedirect("registration.jsp?user=1");
        } else {
            l.setEmail(email);
            l.setLastname(lastname);
            l.setName(name);

            int r = l.UserRegistration(l);
            response.sendRedirect("login.jsp?auth=reg&user=" + user);
        }
    }

    //Update user data
    protected void signUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException, ServletException {
        String user = request.getParameter("f_user2");
        String email = request.getParameter("f_email");
        String pass = request.getParameter("f_pass");
        String name = request.getParameter("f_name");
        String lastname = request.getParameter("f_lastname");

        l.setEmail(email);
        l.setPassword(pass);
        l.setUser(user);
        l.setName(name);
        l.setLastname(lastname);

        int flag = 0;
        flag = l.UpdateRegistration(l);

        if (flag == 1) {
            response.sendRedirect("account.jsp?update=1");
        } else {
            response.sendRedirect("account.jsp?update=0");
        }
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
