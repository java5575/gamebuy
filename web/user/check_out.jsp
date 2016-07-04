<%-- 
    Document   : check_out.jsp
    Created on : 2016/7/4, 下午 03:35:30
    Author     : Administrator
--%>

<%@page import="gamebuy.gb.domain.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>確認結帳</title>
    </head>
    <body>
        <div id='article'>
            <form method="POST" action="check_out.do">
                <%
                    ShoppingCart cart = 
                            (ShoppingCart) session.getAttribute("cart");
                    if(cart == null || cart.isEmpty()){
                %>
                <h3>購物車是空的</h3>
                <%}else{
                %>
                <table style='width: 80%;padding: 2px;margin: auto'>
                    <thead>
                        <tr>
                            <th>商品編號</th>
                            <th>商品名稱</th>
                            <th>商品價格</th>
                            <th>商品數量</th>
                        </tr>
                    </thead>
                    <body>
                </table>
            </form>
        </div>
    </body>
</html>
