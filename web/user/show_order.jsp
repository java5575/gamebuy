<%@page import="gamebuy.gb.model.OrderService"%>
<%@page import="gamebuy.gb.domain.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getMethod().equalsIgnoreCase("get")) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
    }

    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String oid = request.getParameter("oid");
    if (oid != null && oid.matches("\\d+")) {
        OrderService service = new OrderService();
        Order order = service.get(Integer.parseInt(oid));
        if (order != null) {
            if (!customer.equals(order.getCustomer())) {
                throw new gamebuy.gb.domain.GameBuyException("你無權檢視此訂單");
            }
%>
<!DOCTYPE html>

<div style="font-size: smaller">
        <html>
            <head>
                <style>
                    table tr td{
                        padding:20px;
                    }
                    p{
                        padding:5px;
                    }
                </style>
            </head>
            <body>
                <div style="font-size: smaller">
                    <p><b>訂單編號: <%= order.getId()%>, 訂購時間: <%= order.getCreatedTime()%>, 狀態: <%= order.getStatus()%></b></p>
                    <table style="width:100%">
                        <tr><th>No.</th><th>名稱.</th><th>價格</th><th>數量</th></tr>
                                <% for (OrderItem item : order.getOrderItemSet()) {%>
                        <tr><td><%= item.getProduct().getId()%></td>
                            <td><%= item.getProduct().getName()%></td>
                            <td><%= Product.priceFormat.format(item.getPrice())%></td>
                            <td><%= item.getQuantity()%></td></tr>
                            <%}%>
                        <tr><td colspan="5">
                                <p>付款方式: <%= order.getPaymentType().getDesciption()%>-<%= order.getPaymentFee()%></p>
                                <p>貨運方式: <%= order.getShippingType().getDesciption()%>-<%= order.getShippingFee()%></p>
                                <p>含運總額: $<%= order.getTotalAmount() + order.getShippingFee() + order.getPaymentFee() - order.getBonus()%></p> <%-- (免運下限: <%= order.MIN_TOTAL %>)--%>
                                <fieldset>
                                    <legend>收件人資料</legend>
                                    <p>姓名: <%= order.getReceiverName()%></p>
                                    <p>電郵: <%= order.getReceiverEmail()%></p>
                                    <p>電話: <%= order.getReceiverPhone()%></p>
                                    <p>地址: <%= order.getShippingAddress()%></p>
                                </fieldset>
                                <%if (order.getPaymentNote() != null) {%>
                                <fieldset>
                                    <legend>付款資料</legend>
                                    <%= order.getPaymentNote()%>
                                </fieldset>
                                <%}%>
                                <%if (order.getShippingNote() != null) {%>
                                <fieldset>
                                    <legend>貨運資料</legend>
                                    <%= order.getShippingNote()%>
                                </fieldset>
                                <%}%>


                            </td></tr>  
                    </table>        
                </div>
                <%      return;
        } else { %>
                <h5>查無訂單!</h5>
                <%      } %>
                <h5>查無訂單編號!</h5>
                <%  }%>

            </body>
        </html>