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
        <link rel="shortcut icon" href="../images/icon.ico"/>
        <link rel="bookmark" href="../images/icon.ico"/>
        <script src="../jquery-ui-1.11.4.custom/external/jquery/jquery.js" type="text/javascript"></script>
        <link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link href="../css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link href="../css/orders_history.css" rel="stylesheet" type="text/css"/>
        <title>查詢歷史訂單</title>
    </head>
    <body>
        <div class ="header_outside">
            <div class="header">
                <a href="../index.jsp"><img class="logo" src="../images/logo2.png" alt=""/></a>
                <div class="memberlist">
                    <%Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {

                    %>

                    <a href="${pageContext.request.contextPath}/login.jsp">登入</a>|
                    <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>
                    <%} else {%>
                    <a href="${pageContext.request.contextPath}/cart.jsp"><img src="../images/shoppingcar.png"/></a>
                    <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>|
                    <a href="${pageContext.request.contextPath}/user/orders_history.jsp">歷史訂單查詢</a>|
                    <a href="${pageContext.request.contextPath}/logout.do">登出</a>
                    <span><%= customer != null ? customer.getName() + "你好" : ""%></span>

                    <%}%>

                </div>
                <form>
                    <input type="search" name="search" placeholder="請輸入關鍵字"/>
                    <input type="submit" value="">
                </form>
            </div>
        </div>
        <div id="article">
            <%
                OrderService service = new OrderService();
                List<Order> list = service.getByCustomer(user.getEmail());
            %>
            <table>
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
                        <td><%= order.getId()%></td>
                        <td><%= order.getCreatedTime()%></td>
                        <td><%= order.getPaymentType()%></td>
                        <td><%= order.getShippingType()%></td>
                        <td><%= order.getTotalAmount()%></td>
                        <td><%= order.getBonus()%></td>
                        <td><%= order.getTotalBonus()%></td>
                        <td><%= order.getStatus()%></td>
                        <td><a href="javascript: showOrder(<%= order.getId()%>)">檢視</a></td>
                        <td><%if (order.getStatus() == 0 && order.getPaymentType() == PaymentType.ATM) {%>        
                            <a class="pay" href="send_paid.jsp?oid=<%= order.getId()%>">通知已轉帳</a>    
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
                    autoOpen: false, width: 600, height: 350,
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
        <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
                <a class="contactus" href="contactUs.jsp">聯絡我們</a>
                <a class="qanda" href="QandA.jsp">Q&A</a>
            </div>
        </div>
        <a href="#" class="go-top">TOP</a>   
    </body>
</html>
