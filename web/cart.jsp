<%-- 
    Document   : cart
    Created on : 2016/7/2, 下午 01:45:45
    Author     : Administrator
--%>


<%@page import="gamebuy.gb.domain.Product"%>
<%@page import="gamebuy.gb.domain.Customer"%>
<%@page import="gamebuy.gb.domain.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8" info="管理購物車"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理購物車</title>
    </head>
    <body>
        <div id="article">
            <form method="POST" action="update_cart.do">
                <%
                    ShoppingCart cart
                            = (ShoppingCart) request.getSession().getAttribute("cart");
                    
                    if (cart == null || cart.isEmpty()) {
                %>
                <h3>購物車是空的</h3>
                <%} else {
                        Customer user = (Customer) request.getSession().getAttribute("user");
                        if (user != null || !user.equals(cart.getUser())) {
                            cart.setUser(user);
                        }
                    }
                %>
                
                <table style="width: 80%; padding: 2px; margin: auto">
                    <thead>
                        <tr>
                            <th>編號</th>
                            <th>平台</th>
                            <th>商品名稱</th>
                            <th>單價</th>
                            <th>數量</th>
                            <th>小計</th>
                            <th>更新</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : cart.keySet()) {%>
                        <tr>
                            <th><%= p.getId()%></th>
                            <td></td>
                            <td><h4><%= p.getName()%></h4></td>
                            <td><p><%= p.getUnitPrice()%></p></td>
                            <th><input style="width: 5ex;" type="number" name="quanity_<%= p.getId()%>" min="1" value="<%= cart.getQuantity(p)%>"></th>
                            <%int q = cart.getQuantity(p);%>
                            <th><p><%= p.getUnitPrice()*q%></p></th>
                            <th><input type="submit" value="更新">
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="7" style="text-align: right">
                                您有<%= cart.getUser().getBonus()%>點紅利,本次抵用:
                                <input type="number" name="bonus">點 
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7" style="text-align: right">
                                付款金額:
                            </td>
                            <% int bonus = Integer.parseInt(request.getParameter("bonus")); %>
                            <td><%= cart.getTotalAmount()- bonus%></td>
                        </tr>
                    </tfoot>
                </table>
                        <div style="float: left">
                            <input type="button" value="繼續購物" onclick="location.href='index.jsp';">
                        </div>
                        <div style="float: right">
                            <input type="button" value="前往結帳" onclick="location.href='user/check_out.jsp';">
                        </div>
            </form>
        </div>
    </body>
</html>
