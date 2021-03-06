/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.controller;

import gamebuy.gb.domain.Customer;
import gamebuy.gb.domain.GameBuyException;
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
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        //1.讀取並檢查register.jsp中的dormdata
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        String checkcode = request.getParameter("checkcode");
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("會員帳號必須輸入");
        }
        if (id == null || (id = id.trim()).length() == 0) {
            errors.add("身分證號必須輸入");
        }
        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("會員姓名必須輸入");
        }
        if (!(password1 != null && password2 != null && password1.equals(password2))) {
            errors.add("會員密碼與確認密碼必須輸入且內容一致");
        }
        if (address == null || (address = address.trim()).length() == 0) {
            errors.add("居住地址必須輸入");
        }
        if (phone == null || (phone = phone.trim()).length() == 0) {
            errors.add("電話號碼必須輸入");
        }
        if (birthday == null || (birthday = birthday.trim()).length() == 0) {
            errors.add("出生日期必須輸入");
        }
        HttpSession session = request.getSession();
        if (checkcode == null || (checkcode = checkcode.trim()).length() == 0) {
            errors.add("驗證碼必須輸入");
        } else {
            //須加入驗證碼檢查            
            String oldCheckCode = (String) session.getAttribute("registerImageCheckServlet");
            if (!checkcode.equalsIgnoreCase(oldCheckCode)) {
                errors.add("驗證碼不正確");
            }
        }

        if (errors.isEmpty()) {
            try {
                //2.1建立Customer物件
                Customer customer = new Customer();
                customer.setEmail(email);
                customer.setId(id);
                customer.setName(name);
                customer.setPassword(password1);
                customer.setAddress(address);
                customer.setPhone(phone);
                customer.setBirthday(birthday);

                //2.2呼叫CustomerService的register(Customer)
                CustomerService service = new CustomerService();
                service.register(customer);
                //3.1 forward to register_ok.jsp
                request.setAttribute("customer", customer);
                RequestDispatcher dispacher = request.getRequestDispatcher("/register_ok.jsp");
                dispacher.forward(request, response);
                return;
            }catch (GameBuyException ex) {
                if (ex.getCause() != null) {
                    errors.add(ex.toString() + ":" + ex.getCause().getMessage());
                } else {
                    errors.add(ex.toString());
                }
            } catch (Exception ex) {
                errors.add(ex.toString());
            }
        }
            //3.2 forward to register.jsp
            request.setAttribute("errors", errors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
            dispatcher.forward(request,response);
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
