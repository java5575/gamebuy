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
    Customer user = (Customer) session.getAttribute("customer");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../jquery-ui-1.11.4.custom/external/jquery/jquery.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
                        <th>商品金額</th>
                        <th>使用紅利</th>
                        <th>獲得紅利</th>
                        <th>處理狀態</th>
                        <th>訂單明細</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Order order : list) {%>
                    <tr>
                        <th><%= order.getId()%></th>
                        <th><%= order.getCreatedTime()%></th>
                        <th><%= order.getPaymentType()%></th>
                        <th><%= order.getShippingType()%></th>
                        <th><%= order.getTotalAmount()%></th>
                        <th><%= order.getBonus()%></th>
                        <th><%= order.getTotalBonus()%></th>
                        <th><%= order.getStatus()%></th>
                        <th><a href="javascript: showOrder(<%= order.getId()%>)">檢視</a></th>
                        <td><%if (order.getStatus() == 0 && order.getPaymentType() == PaymentType.ATM) {%>        
                    <a href="send_paid.jsp?oid=<%= order.getId()%>">通知已轉帳</a>    
                    <%}%>
                </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div id="detail" title="產品明細"></div>
        <script>
            $(function () {
                $("#detail").dialog({
                    autoOpen: false, width: 500, height: 350,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        effect: "blind",
                        duration: 300
                    }
                });
            });

            function showOrder(orderId) {
//                alert(orderId);
                $.ajax({
                    url: "<%= request.getContextPath()%>/user/show_order.jsp",
                    method: "POST",
                    data: {oid: orderId}
                }).done(
                        function (result) {
//                            alert(result);
                            $("#detail").html(result);
                            $("#detail").dialog("open");
                        }
                ).fail(
                        function (xhr, status) {
                            console.log(status);
                        }
                );
            }
        </script>
    </body>
</html>
