/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.controller;

import gamebuy.gb.domain.Customer;
import gamebuy.gb.domain.Order;
import gamebuy.gb.model.OrderService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SendPaidServlet", urlPatterns = {"/user/send_paid.do"})
public class SendPaidServlet extends HttpServlet {

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
        Customer user = (Customer) request.getSession().getAttribute("customer");
        if(user == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        //1.
        List<String> errors = new ArrayList<>();
        String orderId = request.getParameter("oid");
        if(orderId == null || !orderId.matches("\\d+")){
            errors.add("無訂單編號獲訂單編號格是不正確!");
        }
        String bank = request.getParameter("bank");
        if(bank == null || (bank = bank.trim()).length() == 0){
            errors.add("必須輸入銀行名稱.");
        }
        String accountId = request.getParameter("accountId");
        if (accountId == null || !accountId.matches("\\d{5}")) {
            errors.add("必須輸入帳號後5碼.");
        }

        String amount = request.getParameter("amount");
        if (amount == null || (amount = amount.trim()).length() == 0) {
            errors.add("必須輸入轉帳金額.");
        }

        String transDate = request.getParameter("transDate");
        if (transDate == null
                || !(transDate = transDate.trim()).matches("2\\d{3}-((0[1-9])|(1[0-2]))-(([0-2][1-9])|(3[01]))")) {
            errors.add("必須輸入格式正確的轉帳日期.");
        }

        String transTime = request.getParameter("transTime");
        if (transTime == null || !(transTime = transTime.trim()).matches("(([01]\\d)|(2[0-3])):00")) {
            errors.add("必須選擇格式正確的轉帳時間.");
        }
        
        //2.
        if(errors.isEmpty()){
            StringBuilder note = new StringBuilder("{bank:'").append(bank);
            note.append("', last5code:'").append(accountId);
            note.append("', amount:").append(amount);
            note.append(", time:'").append(transDate);
            note.append(' ').append(transTime).append("'}");
            System.out.println(note);
            Order order = null;
            try{
                OrderService service = new OrderService();
                order = service.get(Integer.parseInt(orderId));
                if (!user.equals(order.getCustomer())) {
                    throw new gamebuy.gb.domain.GameBuyException("你無權處理此訂單");
                }
                order.setPaymentNote(note.toString());
                service.updateStatus2Paid(order);
            }catch(Exception ex){
                this.log("客戶("+user+")通知訂單"+(order!=null?"("+order.getId()+')':"")+"已轉帳失敗:", ex);
                errors.add("通知已轉帳失敗:" + ex);
            }
        }
        System.out.println("errors:" + errors);
        response.sendRedirect(request.getContextPath() + "/user/orders_history.jsp");
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
