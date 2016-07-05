<%-- 
    Document   : check_out.jsp
    Created on : 2016/7/4, 下午 03:35:30
    Author     : Administrator
--%>

<%@page import="gamebuy.gb.domain.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery.js" type="text/javascript"></script>
        <title>確認結帳</title>
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
        %>
    </head>
    <body>
        <div id='article'>
            <form method="POST" action="check_out.do">
                <%
                    ShoppingCart cart
                            = (ShoppingCart) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                %>
                <h3>購物車是空的</h3>
                <%} else {%>
                <table style='width: 80%;padding: 2px;margin: auto'>
                    <thead>
                        <tr>
                            <th>商品編號</th>
                            <th>商品名稱</th>
                            <th>商品價格</th>
                            <th>商品數量</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : cart.keySet()) {%>
                        <tr>
                            <th><%= p.getId()%></th>
                            <td><%= p.getName()%></td>
                            <td><%= p.getUnitPrice()%></td>
                            <th><%= cart.getQuantity(p)%></th>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                商品總金額:
                            </td>
                            <td><%= cart.getTotalAmount()%></td>
                        </tr>
                        <tr>
                            <td colspan="2">付款方式:
                                <select style="width: 120px" id="payment_type" name="paymentType" required onchange="changeHandler()">
                                    <option value="">請選擇...</option>
                                    <option value="0">ATM轉帳</option>
                                    <option value="1">便利商店付款</option>
                                    <option value="2">貨到付款</option>
                                    <option value="3">信用卡付款</option>

                                </select>
                            </td>
                            <td colspan="2">貨運方式:
                                <select style="width:120px" id="shipping_type" name="shippingType" required onchange="calculateAmountHandler()">
                                    <option value="">請選擇...</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                含其他費用之總金額:
                            </td>
                            <td><h3 id="total_fee"><%= cart.getTotalAmount()%></h3></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                含其他費用之總金額(扣掉使用紅利後):
                            </td>
                            <% int bouns = request.getParameter("used_bonus") != null && request.getParameter("used_bonus").matches("\\d+") ? Integer.parseInt(request.getParameter("used_bonus")) : 0;%>
                            <td><h3 id="total_fee"><%= cart.getTotalAmount() - bouns%></h3></td>
                        </tr>
                    </tfoot>
                    <body>
                </table>
                <div style="width: 50%;float: left">
                    <fieldset>
                        <legend>訂貨人</legend>
                        <label for="name">姓名:</label><input id="name" value="${sessionScope.customer.name}" disabled><br>
                        <label for="email">電郵:</label><input id="email" value="${customer.email}" disabled><br>
                        <label for="address">地址:</label><input id="address" value="${customer.address}" disabled><br>
                        <label for="phone">電話:</label><input id="phone" value="${customer.phone}" disabled><br>
                    </fieldset>
                </div>
                <div style="width: 50%;float: right">
                    <fieldset>
                        <legend>收件人 <a href="javascript:copyData()">複製訂貨人</a></legend>
                        <label for="receiver_name">姓名: </label>
                        <input id="receiver_name" name="receiver_name" value="" required><br>
                        <label for="receiver_email">電郵: </label>
                        <input id="receiver_email" name="receiver_email" value="" required><br>
                        <label for="receiver_address">地址: </label>
                        <input id="receiver_address" name="receiver_address" value="" required><br>
                        <label for="receiver_phone">電話: </label>
                        <input id="receiver_phone" name="receiver_phone" value="" required><br>
                    </fieldset>
                </div>
                <script>
                    var payment_array = [
                        {name: "ATM", description: "ATM轉帳", fee: 0, shippingArray: [0, 1]},
                        {name: "STORE", description: "便利商店付款", fee: 60, shippingArray: [0, 1]},
                        {name: "HOME", description: "貨到付款", fee: 100, shippingArray: [1]},
                        {name: "CREDITCARD", description: "信用卡付款", fee: 0, shippingArray: [0, 1]}
                    ];

                    var shipping_array = [
                        {name: "STORE", description: "便利商店取貨", fee: 60},
                        {name: "HOME", description: "宅配到府", fee: 70}
                    ];

                    function changeHandler() {
                        var pTypeIndex = $("#payment_type").val();
                        var shArray = payment_array[pTypeIndex].shippingArray;
                        $("#shipping_type").empty();
                        $("#shipping_type").append("<option value=''>請選擇...</option>");
                        for (i = 0; i < shArray.length; i++) {
                            var sTypeIndex = shArray[i];
                            var optInfo = "<option value=" + sTypeIndex + "'>"
                                    + shipping_array[sTypeIndex].description + "</option>";
                            $("#shipping_type").append(optInfo);
                        }
                    }

                    function calculateAmountHandler() {
                        var pTypeIndex = $("#payment_type").val();
                        console.log(pTypeIndex)
                        var sTypeIndex = $("#shipping_type").val();
                        if (pTypeIndex >= 0 && sTypeIndex >= 0) {
                            var pType = payment_type_array[pTypeIndex];
                            var sType = shipping_type_array[sTypeIndex];
                            $("#total_fee").text(<%= cart.getTotalAmount()%> + pType.fee + sType.fee);
                        }
                    }

                    function copyData() {
                        $("#receiver_name").val($("#name").val());
                        $("#receiver_email").val($("#email").val());
                        $("#receiver_address").val($("#address").val());
                        $("#receiver_phone").val($("#phone").val());
                    }
                </script>
        </div><br>
        <div>
            <div style="float:left">
                <input type="button" value="繼續購物" onclick="location.href = 'index.jsp';">
            </div>
            <div style="float:right">
                <input type="submit" value="確認結帳">
            </div>
        </div>
        <%}%>
    </form>
</div>
</body>
</html>
