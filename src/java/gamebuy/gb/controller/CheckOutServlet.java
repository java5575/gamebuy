/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.controller;

import gamebuy.gb.domain.Customer;
import gamebuy.gb.domain.Order;
import gamebuy.gb.domain.PaymentType;
import gamebuy.gb.domain.ShippingType;
import gamebuy.gb.domain.ShoppingCart;
import gamebuy.gb.model.OrderService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/user/check_out.do"})
public class CheckOutServlet extends HttpServlet {

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
        //1.1取得sission中的user.cart
        HttpSession session = request.getSession(false);
        Customer user = null;
        ShoppingCart cart = null;
        if(session == null || session.isNew()){
            errors.add("找不到購物車，請重新登入後繼續購物!");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }else{
            user = (Customer)session.getAttribute("customer");
            cart = (ShoppingCart) session.getAttribute("cart");
            if(user == null || cart == null){
                errors.add("找不到購物車，請重新登入後繼續購物!");
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
        }
        //1.2 取得並檢查parameter中的Form Data
        String payment = request.getParameter("paymentType");
        if(payment == null || payment.length() == 0 || 
                !payment.matches("[0-" + (PaymentType.values().length-1) + "]")){
            errors.add("請選擇付款方式!");
        }
        String shipping = request.getParameter("shippingType");
        if(shipping == null || shipping.length() == 0 ||
                !shipping.matches("[0-" + (ShippingType.values().length-1)+"]")){
            errors.add("請選擇貨運方式");
        }
        String name = request.getParameter("receiver_name");
        if(name == null || (name = name.trim()).length() == 0){
            errors.add("請輸入收件人姓名!");
        }
        String email = request.getParameter("receiver_email");
        if(email == null || (email = email.trim()).length() == 0){
            errors.add("請輸入收件人電子郵件!");
        }
        String phone = request.getParameter("receiver_phone");
        if(phone == null || (phone = phone.trim()).length() == 0){
            errors.add("請輸入收件人電話!");
        }
        String address = request.getParameter("receiver_address");
        if(address == null || (address = address.trim()).length() == 0){
            errors.add("請輸入收件人地址!");
        }
        int bonus = Integer.parseInt(request.getParameter("used_bonus"));
        if(bonus > user.getBonus()){
            errors.add("紅利不足!");
        }
        if(errors.isEmpty()){
            //2.呼叫商業邏輯
            try{
                OrderService service = new OrderService();
                Order order = service.makeOrder(user, cart);
                
                PaymentType pType = PaymentType.values()[Integer.parseInt(payment)];
                order.setPaymentType(pType);
                order.setPaymentFee(pType.getFee());
                
                ShippingType sType = ShippingType.values()[Integer.parseInt(shipping)];
                order.setShippingType(sType);
                order.setShippingFee(sType.getFee());
                
                order.setReceiverName(name);
                order.setReceiverEmail(email);
                order.setReceiverPhone(phone);
                order.setShippingAddress(address);
                order.setBonus(bonus);
                
                service.create(order);
                session.removeAttribute("cart");
                //3.1 redirect to "/user/orders_history.jsp"
                response.sendRedirect(request.getContextPath() + "/user/orders_history.jsp");
                return;
            }catch(Exception ex){
                errors.add(ex.toString());
            }
        }
        //3.2 errors:forward to "/user/check_out.jsp"
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/user/check_out.jsp").forward(request, response);
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
