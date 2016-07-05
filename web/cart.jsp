<%-- 
    Document   : cart
    Created on : 2016/7/2, 下午 01:45:45
    Author     : Administrator
--%>


<%@page import="gamebuy.gb.domain.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" info="管理購物車"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
        <title>管理購物車</title>
        
    </head>
    <body>
        <div class ="header_outside">
            <div class="header">
                <a href="index.jsp"><img class="logo" src="images/logo2.png" alt=""/></a>
                <div class="memberlist">
                    <%Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {

                    %>

                    <a href="${pageContext.request.contextPath}/login.jsp">登入</a>|
                    <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>
                    <%} else {%>
                    <a href="${pageContext.request.contextPath}/cart.jsp"><img src="images/shoppingcar.png"/></a>
                    <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>|
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
        <div class="wrapper">
            <form method="POST" action="update_cart.do">
                <%
                    ShoppingCart cart
                            = (ShoppingCart) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                %>
                <h3>購物車是空的</h3>
                <%} else {

                    if (customer == null) {
                        response.sendRedirect(request.getContextPath() + "/login.jsp");
                        return;
                    } else if (customer != null && !customer.equals(cart.getUser())) {
                        cart.setUser(customer);
                    }
                %>

                <table style="width: 80%; padding: 2px; margin: auto">
                    <thead>
                        <tr>
                            <th>編號</th>
                            <th>平台</th>
                            <th>名稱</th>
                            <th>單價</th>
                            <th>數量</th>
                            <th>小計</th>
                            <th>更新</th>
                            <th>刪除</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : cart.keySet()) {%>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%= p.getPlatForm().getChName()%></td>
                            <td><h4><%= p.getName()%></h4></td>
                            <td><p><%= p.getUnitPrice()%></p></td>
                            <td><input type="number" class="quantity" name="quantity_<%= p.getId()%>" min="1" value="<%= cart.getQuantity(p)%>"></td>
                            <td><p><%= p.getUnitPrice() * cart.getQuantity(p)%></p></td>
                <td><input type="submit" value="更新" name=""></td>
                            <td><input type="submit" value="刪除" name="delete_<%= p.getId()%>"></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        
                        <tr>
                            <td colspan="7" style="text-align: right">
                                付款金額:
                          </td>

                          </td>

                            <td><%= cart.getTotalAmount()%></td>
                        </tr>
                        <tr>
                            <td><input type="button" value="繼續購物" onclick="location.href = 'index.jsp';"></td>
                            <td><input type="button" value="前往結帳" onclick="location.href = 'user/check_out.jsp';"></td>
                        </tr>
                    </tfoot>
                </table>
                <%}%>
            </form>
        </div>
        <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
            </div>
        </div>
    </body>
</html>
