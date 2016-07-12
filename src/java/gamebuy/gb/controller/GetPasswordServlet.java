/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.controller;

import gamebuy.gb.domain.Customer;
import gamebuy.gb.model.CustomerService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "ForgetPasswordServlet", urlPatterns = {"/get_password.do"})
public class GetPasswordServlet extends HttpServlet {

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
        List<String> errors = new ArrayList<>();
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("郵件為帳號,必須輸入正確!!");
        }
        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("名字必須輸入!!");
        }
        if (id == null || (id = id.trim()).length() == 0) {
            errors.add("身分證必須輸入!!");
        }
        if (errors.isEmpty()) {
            try {
                Customer c = new Customer();
                c.setName(name);
                c.setEmail(email);
                c.setId(id);

                CustomerService service = new CustomerService();
                Customer c_origin = service.getPassword(c);
                if (c_origin.getPassword() != null) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                } else {
                    throw new Exception("資料有誤");
                }
            } catch (Exception ex) {
                errors.add("資料有誤");

            }
        }
        request.setAttribute("errors", errors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Forgetpassword.jsp");
        dispatcher.forward(request, response);
        
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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
