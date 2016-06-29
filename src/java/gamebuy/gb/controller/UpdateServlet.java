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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/user/update.do"})
public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

//        if (customer == null) {
//            session.setAttribute("session.timeout", "無法修改會員資料, 請重新登入");
//            response.sendRedirect(request.getContextPath() + "/login.jsp");
//            return;
//        }
        //1. get input data, check data
        request.setCharacterEncoding("UTF-8");
        List<String> errors = new ArrayList<>();
        Customer updateUser;
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password1 = request.getParameter("pwd");
        String password2 = request.getParameter("pwd2");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        String checkCode = request.getParameter("checkcode");
        
        try {
            updateUser = (Customer) Class.forName(customer.getClass().getName()).newInstance();
        } catch (Exception ex) {
            updateUser = new Customer();
        }
               System.out.println("email:" + email);
        if (email == null || (email = email.trim()).length() == 0 || !email.equals(customer.getEmail())) {
            errors.add("不可更改帳號");
        } else {
            try {
                updateUser.setEmail(customer.getEmail());
            } catch (GameBuyException ex) {
                Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

       System.out.println("id:" + id);
        if (id == null || (id = id.trim()).length() == 0 || !id.equals(customer.getId())) {
            errors.add("不可更改身分證號.");
        } else {
            try {
                updateUser.setId(customer.getId());
            } catch (GameBuyException ex) {
                Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("必須輸入姓名.");
        } else {
            try {
                updateUser.setName(name);
            } catch (GameBuyException ex) {
                errors.add("無法修改姓名: " + ex);
            }
        }

        if (password1 != null && (password1 = password1.trim()).length() > 0
                && password2 != null && (password2 = password2.trim()).length() > 0) {
            if (!password1.equals(password2)) {
                errors.add("密碼及確認密碼必須一致.");
            } else {
                try {
                    updateUser.setPassword(password1);
                } catch (GameBuyException ex) {
                    errors.add("無法修改密碼: " + ex);
                }
            }
        }

       
        System.out.println("checkcode: " + checkCode);
        if (checkCode == null || (checkCode = checkCode.trim()).length() == 0) {
            errors.add("必須輸入檢核碼.");
        } else {
            String rand = (String) session.getAttribute("registerImageCheckServlet");
            System.out.println("rand: " + rand);
            if (rand == null) {
                errors.add("無法建立session! 請重新修改");
            } else if (!rand.equalsIgnoreCase(checkCode)) {
                errors.add("檢核碼不正確, 請重新輸入");
            }
        }

        
        //System.out.println("birthday:" + birthday);

        
        if (address != null) {
            address = address.trim();
        }

        
        if (phone != null) {
            phone = phone.trim();
        }

        if (errors.isEmpty()) {
            //2. call business service
            try {
                if (birthday != null && (birthday = birthday.trim()).length() > 0) {
                    updateUser.setBirthday(birthday);
                }
                updateUser.setAddress(address);
                updateUser.setPhone(phone);
                //updateUser.setPhoto(customer.getPhoto());
                System.out.println("customer: " + customer);
                System.out.println("updateUser:" + updateUser);
                CustomerService service = new CustomerService();
                service.update(updateUser);
                customer = service.login(updateUser.getId(), updateUser.getPassword());

                //3.1 forward to upload file
                session.removeAttribute("registerImageCheckServlet");
                session.setAttribute("customer", updateUser);

                //處理上傳的頭像
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/upload.do");
//                dispatcher.forward(request, response);
//                System.out.println("上傳成功!!!");
                response.sendRedirect(request.getContextPath());
                return;
            } catch (Exception ex) {
                //ex.printStackTrace();
                this.log("會員修改失敗", ex);
                if (ex.getCause() != null) {
                    errors.add(ex.getMessage() + ":" + ex.getCause());
                } else {
                    errors.add("會員修改失敗:" + ex.getMessage());
                }
            }
        }

        System.out.println("會員修改發生錯誤:" + errors);

        //3.2 forward to Input JSP
        request.setAttribute("errors", errors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/update.jsp");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
