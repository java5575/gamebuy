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
        <title>管理購物車</title>
    </head>
    <body>
        <div id="article">
            <form method="POST" action="update_cart.do">
                <%
                    ShoppingCart cart
                            = (ShoppingCart) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                %>
                <h3>購物車是空的</h3>
                <%} else {
                        Customer customer = (Customer) session.getAttribute("customer");
                         if(customer == null){
                            response.sendRedirect(request.getContextPath()+"/login.jsp");
                            return;
                          }else if(customer != null && !customer.equals(cart.getUser())){
                            cart.setUser(customer); 
                        }
                %>
                
                <table style="width: 80%; padding: 2px; margin: auto">
                    <thead>
                        <tr>
                            <th>商品編號</th>
                            <th>平台</th>
                            <th>商品名稱</th>
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
                            <th><%= p.getId()%></th>
                            <td><%= p.getPlatForm().getChName()%></td>
                            <td><h4><%= p.getName()%></h4></td>
                            <td><p><%= p.getUnitPrice()%></p></td>
                            <th><input style="width: 5ex;" type="number" name="quantity_<%= p.getId()%>" min="1" value="<%= cart.getQuantity(p)%>"></th>
                            <th><p><%= p.getUnitPrice()*cart.getQuantity(p)%></p></th>
                            <th><input type="submit" value="更新" name="">
                            <th><input type="submit" value="刪除" name="delete_<%= p.getId()%>"></th>
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
                           <%-- int bonus = Integer.parseInt(request.getParameter("bonus")); --%>
                            <td><%= cart.getTotalAmount()%></td>
                        </tr>
                    </tfoot>
                </table>
                        <div style="float: left">
                            <input type="button" value="繼續購物" onclick="location.href='index.jsp';">
                        </div>
                        <div style="float: right">
                            <input type="button" value="前往結帳" onclick="location.href='user/check_out.jsp';">
                        </div>
                        <%}%>
            </form>
        </div>
    </body>
</html>
