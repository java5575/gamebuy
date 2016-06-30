<%@page import="gamebuy.gb.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>會員修改</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="../images/icon.ico"/>
        <link rel="bookmark" href="../images/icon.ico"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-ui.css">
        <script src="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
        <link href="../css/update.css" rel="stylesheet" type="text/css"/>
        <script>

            $(function () {
                $("#datepicker").datepicker({
                    dateFormat: "yy/mm/dd",
                    changeMonth: true,
                    changeYear: true
                })

            })
            function refreshHandler() {
                var check_img = document.getElementById("check_code_image");
                check_img.src = "../images/registercheck.jpg?get=" + new Date();
            }
        </script>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <a href="index.jsp"><img class="logo" src="../images/logo2.png" alt=""/></a>
                <div class="memberlist">
                    <%
                        if (customer == null) {

                    %>

                    <a href="${pageContext.request.contextPath}/login.jsp">登入</a>|
                    <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>
                    <%} else {%>
                    <a href="#"><img src="../images/shoppingcar.png"/></a>
                    <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>|
                    <a href="${pageContext.request.contextPath}/logout.do">登出</a>
                    <span><%= customer != null ? customer.getName() + "你好" : ""%></span>
                    <%}%>
                </div>
            </div>

            <div id="middle">
                <form method="POST" action="update.do">

                    <h1>會員修改</h1>
                    <p>
                        <label for="email">會員帳號：</label>
                        <input type="text" id="email" name="email" placeholder="請輸入帳號" value="${not empty param.email?param.email:sessionScope.customer.email}" required readonly>
                    </p>
                    <p>
                        <label for="pwd">會員密碼：</label>
                        <input type="password" id="pwd" name="pwd" placeholder="請輸入密碼" required>
                    </p>

                    <p>
                        <label for="pwd2">確認密碼：</label>
                        <input type="password" id="pwd2" name="pwd2" placeholder="請輸入密碼" required>
                    </p>
                    <p>
                        <label for="name">會員姓名：</label>
                        <input type="text" id="name" name="name" placeholder="請輸入姓名" value="${not empty param.name?param.name:sessionScope.customer.name}" required>
                    </p>
                    <p>
                        <label for="id">身分證號：</label>
                        <input type="text" id="id" name="id" placeholder="請輸入你的身分證號" value="${not empty param.id?param.id:sessionScope.customer.id}" required readonly>
                    </p>

                    <p>
                        <label for="address">居住地址：</label>
                        <input type="text" id="address" name="address" placeholder="請輸入地址" value="${not empty param.address?param.address:sessionScope.customer.address}" required>
                    </p>
                    <p>
                        <label for="phone">連絡電話：</label>
                        <input type="tel" id="phone" name="phone" placeholder="請輸入手機號碼" value="${not empty param.phone?param.phone:sessionScope.customer.phone}" required>
                    </p>
                    <p>
                        <label for="datepicker">出生日期：</label>
                        <input type="text" id="datepicker" name="birthday" value="${not empty param.birthday?param.birthday:customer.birthdayWebString}" placeholder="請輸入生日">
                    </p>
                    <p>
                        <img src="../images/registercheck.jpg" id="check_code_image"><img class="changimg" src="../images/changimg.png" onclick="refreshHandler()">
                        <input type="text" id="check_code" name="checkcode" placeholder="請輸入驗證碼" value="${param.checkcode}" required>
                    </p>

                    <input class="registerbutton" type="submit" value="修改">
                </form>
                <c:if test="${not empty requestScope.errors}">
                    <ul>
                        <c:forEach  var="msg" items="${requestScope.errors}" >
                            <li>${msg}</li> 
                            </c:forEach>
                    </ul>
                </c:if>
            </div>
            <div class="footer">
                <p>Copy right by Caesar wang</p>
            </div>
        </div>
    </body>
</html>
