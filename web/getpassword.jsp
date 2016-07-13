<%-- 
    Document   : register
    Created on : 2016/6/5, 下午 01:51:11
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <link href="css/register.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="jquery-ui-1.11.4.custom/jquery-ui.css">
        <script src="jquery-ui-1.11.4.custom/jquery-1.12.4.min.js"></script>
        <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
   
        <link href="css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="images/icon.ico"/>
        <link rel="bookmark" href="images/icon.ico"/>
        <title>忘記密碼</title>

        <script>
            function refreshHandler() {
                var check_img = document.getElementById("check_code_image");
                check_img.src = "images/registercheck.jpg?get=" + new Date();
            }
            $(function () {
                $("#datepicker").datepicker({
                    dateFormat: "yy/mm/dd",
                    changeMonth: true,
                    changeYear: true
                })

            })
        </script>
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
                    <a href="#"><img src="images/shoppingcar.png"/></a>
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
            <div id="middle">
                <form method="POST" action="get_password.do">
                    <h1>忘記密碼</h1>
                    <p>
                        <label for="email">會員帳號：</label>
                        <input type="text" id="email" name="email" placeholder="請輸入你的email" value="${param.email}" required>
                    </p>
                    <p>
                        <label for="name">會員姓名：</label>
                        <input type="text" id="name" name="name" placeholder="請輸入你的姓名" value="${param.name}" required>
                    </p>
                    <p>
                        <label for="id">身分證號：</label>
                        <input type="text" id="id" name="id" placeholder="請輸入你的身分證號" required>
                    </p>
                    <input class="registerbutton" type="submit" value="確認">
                    <c:if test="${not empty requestScope.errors}">
                        <ul>
                            <c:forEach  var="msg" items="${requestScope.errors}" >
                                <li>${msg}</li> 
                                </c:forEach>
                        </ul>
                    </c:if>
                </form>
            </div>
            <div class="footer">
                <p>Copy right by Caesar wang</p>
            </div>
        </div>
    </body>
</html>
