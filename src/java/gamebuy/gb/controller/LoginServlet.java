/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.controller;

import gamebuy.gb.domain.Customer;
import gamebuy.gb.model.CustomerService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String> errors = new ArrayList<>();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("請輸入會員帳號");
        }
        if (password == null || (password = password.trim()).length() == 0) {
            errors.add("請輸入會員帳號");
        }
        if (checkcode == null || (checkcode = checkcode.trim()).length() == 0) {
            errors.add("請輸入會員帳號");
        }else{
            String oldCheckCode = (String)session.getAttribute("ImageCheckServlet");
            if(!checkcode.equalsIgnoreCase(oldCheckCode)){//equalsIgnoreCase不分大小寫
                errors.add("驗證碼不正確");
            }else{
                session.removeAttribute("ImageCheckServlet");
            }
        }
        if(errors.isEmpty()){//當錯誤清單沒有錯誤訊息的時候
            //2.呼叫CustomerService的商業邏輯方法:login(u,p)
            try{
                CustomerService service = new CustomerService();
                Customer customer = service.login(email,password);
                session.removeAttribute("ImageCheckServlet");
                //3.1登入成功
                session.setAttribute("customer", customer);
                response.sendRedirect(request.getContextPath());
                return;
            }catch(Exception ex){
                errors.add(ex.toString());
            
            }
        
        }
        //3.2forward給登入失敗view:login.jsp
        request.setAttribute("errors", errors);
        RequestDispatcher dispacher = request.getRequestDispatcher("/login.jsp");//尋找login.jsp
        dispacher.forward(request,response);//指派給login.jsp
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
