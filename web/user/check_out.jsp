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
        <link rel="shortcut icon" href="../images/icon.ico"/>
        <link rel="bookmark" href="../images/icon.ico"/>
        <script src="../js/jquery.js" type="text/javascript"></script>
        <link href="../css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link href="../css/check_out.css" rel="stylesheet" type="text/css"/>
        <title>確認結帳</title>
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
        %>
        <script>
            $(function(){
//                $(".wrapper").animate({width:"850px"},1000);
            $(".wrapper").slideDown(1500);
            })
        </script>
    </head>
    <body>
        <div class ="header_outside">
            <div class="header">
                <a href="../index.jsp"><img class="logo" src="../images/logo2.png" alt=""/></a>
                <div class="memberlist">
                    <%
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
        <div class='wrapper'>
            <form method="POST" action="check_out.do">
                <%
                    ShoppingCart cart
                            = (ShoppingCart) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                %>
                <h3>購物車是空的</h3>
                <%} else {%>
                <table>
                    <thead>
                        <tr>
                            <th>商品編號</th>
                            <th>商品名稱</th>
                            <th>商品數量</th>
                            <th>商品價格</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : cart.keySet()) {%>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td><%= p.getName()%></td>
                            <td><%= cart.getQuantity(p)%></td>
                            <td><%= p.getPreferentialPrice()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: right">付款方式:
                                <select style="width: 20ex" id="payment_type" name="paymentType" required onchange="changeHandler()">
                                    <option value="">請選擇...</option>
                                    <% for (PaymentType pType : PaymentType.values()) {%>
                                    <option value="<%= pType.ordinal()%>"><%= pType.toString()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: right">貨運方式:
                                <select style="width:20ex" id="shipping_type" name="shippingType" required onchange="calculateAmountHandler()">
                                    <option value="">請選擇...</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4" style="text-align: right">
                                您有<%= customer.getBonus()%>紅利點數，本次使用
                                <input type="number" id="used_bonus" name="used_bonus"  onchange="changeAmountHandler()" min="0" value="0" required>
                                點紅利

                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                商品總金額:
                            </td>
                            <td><%= cart.getTotalAmount()%></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                付款總金額(扣除紅利後):
                            </td>
                            <% int bouns = request.getParameter("used_bonus") != null && request.getParameter("used_bonus").matches("\\d+") ? Integer.parseInt(request.getParameter("used_bonus")) : 0;%>

                            <td><h3 id="total_fee"><%= cart.getTotalAmount()%></h3></td>
                        </tr>
                    </tfoot>
                    <body>
                </table>
                <div class="shipper">
                    <fieldset>
                        <legend>訂貨人</legend>
                        <label for="name">姓名:</label><input id="name" value="${sessionScope.customer.name}" disabled><br>
                        <label for="email">電郵:</label><input id="email" value="${customer.email}" disabled><br>
                        <label for="address">地址:</label><input id="address" value="${customer.address}" disabled><br>
                        <label for="phone">電話:</label><input id="phone" value="${customer.phone}" disabled><br>
                    </fieldset>
                </div>
                <div class="receiver">
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
//                    var payment_array = [
//                        {name: "ATM", description: "ATM轉帳", fee: 0, shippingArray: [0, 1]},
//                        {name: "STORE", description: "便利商店付款", fee: 60, shippingArray: [0, 1]},
//                        {name: "HOME", description: "貨到付款", fee: 100, shippingArray: [1]},
//                        {name: "CREDITCARD", description: "信用卡付款", fee: 0, shippingArray: [0, 1]}
//                    ];
//
//                    var shipping_array = [
//                        {name: "STORE", description: "便利商店取貨", fee: 60},
//                        {name: "HOME", description: "宅配到府", fee: 70}
//                    ];
                    var payment_type_array = [
                    <% for (int i = 0; i < PaymentType.values().length; i++) {%>
                    {fee:<%= PaymentType.values()[i].getFee()%>,
                            shippingArray:[
                    <%for (int j = 0; j < PaymentType.values()[i].getShippingArray().length; j++) {%>
                    <%= PaymentType.values()[i].getShippingArray()[j].ordinal()%>
                    <%= j < PaymentType.values()[i].getShippingArray().length - 1 ? "," : ""%>
                    <%}%>
                            ]
                    }<%= i < PaymentType.values().length - 1 ? "," : ""%>
                    <%}%>
                    ];
                    var shipping_type_array = [
                    <% for (int i = 0; i < ShippingType.values().length; i++) {%>
                    {description:"<%= ShippingType.values()[i]%>", fee:<%= ShippingType.values()[i].getFee()%>}
                    <%= i < ShippingType.values().length - 1 ? "," : ""%>
                    <%}%>
                    ];
                    function changeHandler() {
                    var pTypeIndex = $("#payment_type").val();
                    var shArray = payment_type_array[pTypeIndex].shippingArray;
                    $("#shipping_type").empty();
                    $("#shipping_type").append("<option value=''>請選擇...</option>");
                    for (i = 0; i < shArray.length; i++){
                    var sTypeIndex = shArray[i];
                    var optInfo = "<option value='" + sTypeIndex + "'>"
                            + shipping_type_array[sTypeIndex].description + "</option>";
                    console.log(optInfo);
                    $("#shipping_type").append(optInfo);
                    }
                    }

                    function calculateAmountHandler(){
                    var pTypeIndex = $("#payment_type").val();
                    var sTypeIndex = $("#shipping_type").val();
                    if (pTypeIndex >= 0 && sTypeIndex >= 0){
                    var pType = payment_type_array[pTypeIndex];
                    var sType = shipping_type_array[sTypeIndex];
                    $("#total_fee").text(<%= cart.getTotalAmount()%> + pType.fee + sType.fee);
                    }
                    }

                    function changeAmountHandler(){
                    var pTypeIndex = $("#payment_type").val();
                    var sTypeIndex = $("#shipping_type").val();
                    var pType = payment_type_array[pTypeIndex];
                    var sType = shipping_type_array[sTypeIndex];
                    var usedBonus = $("#used_bonus").val();
                    if (usedBonus >= 0 && usedBonus <= <%= customer.getBonus()%>){

                    $("#total_fee").text(<%= cart.getTotalAmount()%> - usedBonus + pType.fee + sType.fee);
                    } else{
                    alert("紅利不足");
                    }
                    }

                    function copyData() {
                    $("#receiver_name").val($("#name").val());
                    $("#receiver_email").val($("#email").val());
                    $("#receiver_address").val($("#address").val());
                    $("#receiver_phone").val($("#phone").val());
                    }
                </script>

                <div>
                    <div>
                        <input type="button" class="continu" value="繼續購物" onclick="location.href = 'index.jsp';">
                        <input type="submit" class="check_ok" value="確認結帳">

                    </div>
                </div>
                <%}%>
            </form>
        </div>

        <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
                <a class="contactus" href="../contactUs.jsp">聯絡我們</a>
                <a class="qanda" href="../QandA.jsp">Q&A</a>
            </div>
        </div>
        <a href="#" class="go-top">TOP</a>   

    </body>
</html>
