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
        <title>會員註冊</title>

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
                <form method="POST" action="register.do">
                    <h1>會員註冊</h1>
                    <p>
                        <label for="email">會員帳號：</label>
                        <input type="text" id="email" name="email" placeholder="請輸入你的email" value="${param.email}" required>
                    </p>
                    <p>
                        <label for="password1">會員密碼：</label>
                        <input type="password" id="password1" name="password1" placeholder="請輸入你的密碼" required>
                    </p>
                    <p>
                        <label for="password2">確認密碼：</label>
                        <input type="password" id="password2" name="password2" placeholder="請再次輸入你的密碼" required>
                    </p>
                    <p>
                        <label for="name">會員姓名：</label>
                        <input type="text" id="name" name="name" placeholder="請輸入你的姓名" value="${param.name}" required>
                    </p>
                    <p>
                        <label for="id">身分證號：</label>
                        <input type="text" id="id" name="id" placeholder="請輸入你的身分證號" required>
                    </p>
                    <p>
                        <label for="address">居住地址：</label>
                        <input type="text" id="address" name="address" placeholder="請輸入你的居住地址" value="${param.address}" required>
                    </p>
                    <p>
                        <label for="phone">電話號碼：</label>
                        <input type="text" id="phone" name="phone" placeholder="請輸入你的電話號碼" value="${param.phone}" required>
                    </p>
                    <p>
                        <label for="birthday">出生日期：</label>
                        <input type="text" id="datepicker" name="birthday" placeholder="請輸入你得出生日期" value="${param.birthday}" required>
                    </p>
                    <p>
                        <img src="images/registercheck.jpg" id="check_code_image"><img class="changimg" src="images/changimg.png" onclick="refreshHandler()">
                        <input type="text" id="check_code" name="checkcode" placeholder="請輸入驗證碼" value="${param.checkcode}" required>
                    </p>
                    <input class="registerbutton" type="submit" value="註冊">
                    <c:if test="${not empty requestScope.errors}">
                        <ul>
                            <c:forEach  var="msg" items="${requestScope.errors}" >
                                <li>${msg}</li> 
                                </c:forEach>
                        </ul>
                    </c:if>
                </form>
            </div>
        </div>
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
