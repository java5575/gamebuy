<%-- 
    Document   : orders_history
    Created on : 2016/7/5, 上午 10:13:03
    Author     : Administrator
--%>

<%@page import="gamebuy.gb.domain.*"%>
<%@page import="java.util.List"%>
<%@page import="gamebuy.gb.model.OrderService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Customer user = (Customer)session.getAttribute("customer");
    if(user == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查詢歷史訂單</title>
    </head>
    <body>
        <div id="article">
            <%
                OrderService service = new OrderService();
                List<Order> list = service.getByCustomer(user.getEmail());
            %>
            <table style='width: 80%;padding: 2px;margin: auto'>
                <thead>
                    <tr>
                        <th>訂單編號</th>
                        <th>訂單時間</th>
                        <th>付款方式</th>
                        <th>貨運方式</th>
                        <th>訂單金額</th>
                        <th>使用紅利</th>
                        <th>處理狀態</th>
                        <th>檢視明細</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Order order:list){%>
                    <tr>
                        <th><%= order.getId()%></th>
                        <th><%= order.getCreatedTime()%></th>
                        <th><%= order.getPaymentType()%></th>
                        <th><%= order.getShippingType()%></th>
                        <th><%= order.getTotalAmount()%></th>
                        <th><%= order.getBonus()%></th>
                        <th><%= order.getStatus()%></th>
                        <th><td>檢視</td></th>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
