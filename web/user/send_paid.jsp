<%-- 
    Document   : send_paid
    Created on : 2016/7/11, 下午 05:17:33
    Author     : Administrator
--%>

<%@page import="gamebuy.gb.model.OrderService"%>
<%@page import="gamebuy.gb.domain.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%!
    private DateFormat webDateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<c:set var="today" value="<%= new java.sql.Date(System.currentTimeMillis())%>"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>轉帳通知</title>
        <script src="../js/jquery.js" type="text/javascript"></script>
        <link href="../css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <style>
            #article{
                width: 300px;
                background-color: rgba(255,255,255,0.5);
                line-height: 30px;
                margin: 200px auto 0 auto;
            }
        </style>

    </head>
    <body>
        <div class="header_outside">
            <div class="header">
                <a href="index.jsp"><img class="logo" src="../images/logo2.png" alt=""/></a>
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
        <%
            Customer user = (Customer) session.getAttribute("customer");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            Order order = null;
            String oid = request.getParameter("oid");
            if (oid != null && oid.matches("\\d+")) {
                OrderService service = new OrderService();
                order = service.get(Integer.parseInt(oid));
                if (!user.equals(order.getCustomer())) {
                    throw new gamebuy.gb.domain.GameBuyException("你無權檢視此訂單");
                }

        %>
        <div id="article">
            <% if (order.getStatus() == Status.NEW.ordinal() && order.getPaymentType() == PaymentType.ATM) {%>
            <script>
                $(function () {
                    var userAgent = navigator.userAgent;
                    if (userAgent.indexOf("Chrome") < 0 && userAgent.indexOf("ipad") < 0 && userAgent.indexOf("iphone") < 0) {
                        $.getScript("js/datepicker-zh-TW.js");
                        $("#trans_date").datepicker({
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: 'yy-mm-dd',
                            minDate: '<%= webDateFormat.format(order.getCreatedTime())%>',
                            maxDate: '${today}'
                        });
                    }
                });
            </script>

            <form id="paid_form" method="POST" action="send_paid.do">
                <p>
                    <label for="order_id">訂單編號</label>
                    <input id="order_id" name="oid" value="<%= order.getId()%>" readonly>
                </p>
                <p>
                    <label for="bank">銀行名稱:</label>
                    <input id="bank" name="bank" value="${param.bank}" placeholder="請輸入轉帳銀行名稱" required>
                </p>
                <p>
                    <label for="account_id">轉帳帳號:</label>
                    <input id="account_id" name="accountId" maxlength="5" pattern="\d{5}" required
                           value="${param.accountId}" placeholder="請輸入帳號後5碼">
                </p>
                <p>
                    <label for="amount">轉帳金額:</label>
                    <input type="number" id="amount" name="amount" required 
                           min="1" max="<%= order.getTotalAmount()%>" placeholder="請輸入轉帳金額" 
                           value="<%= request.getMethod().equalsIgnoreCase("GET") ? order.getTotalAmount() : request.getParameter("amount")%>">
                </p>
                <p>
                    <label for="trans_date">轉帳日期:</label>
                    <input type="date" id="trans_date" name="transDate" required 
                           min="<%= webDateFormat.format(order.getCreatedTime())%>" max="${today}"
                           value="${not empty param.transDate?param.transDate:today}">    
                </p>
                <p>
                    <label for="trans_time">大約時間:</label>
                    <select id="trans_time" name="transTime" required>
                        <%for (int i = 0; i < 24; i++) {%>
                        <option value="<%=String.format("%02d:00", i)%>" 
                                <%=(request.getMethod().equals("GET") && i == 12 ? "selected" : (String.valueOf(i).equals(request.getParameter("transTime")) ? "selected" : ""))%>> 
                            <% out.print(String.format("%02d:00", i)); %>
                        </option>
                        <%}%>                
                    </select>
                </p>
                <input type="submit" value="確定送出">
            </form>
        </div>
        <%} else {%>
        <p>此訂單無須通知已轉帳,如有問題請聯絡<a href="">客服中心</a></p>
        <%}
            }%>     
        <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
                <a class="contactus" href="contactUs.jsp">聯絡我們</a>
                <a class="qanda" href="QandA.jsp">Q&A</a>
            </div>
        </div>
    </body>
</html>
