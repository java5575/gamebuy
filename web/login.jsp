<%@page import="java.util.List"%>
<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" href="images/icon.ico"/>
        <link rel="bookmark" href="images/icon.ico"/>
        <title>會員登入</title>
        <script>
            function refreshHandler() {
                var check_img = document.getElementById("check_code_image");
                check_img.src = "images/check.jpg?get=" + new Date();
            }
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
        <div class="wrapper">
            <div id="middle">
                <form method="POST" action="login.do">
                    <h1>會員登入</h1>

                    <p>
                        <label>會員帳號：</label>
                        <input type="text" id="email" name="email" placeholder="請輸入你的email" value="${param.id}" required>
                    </p>
                    <p>
                        <label>會員密碼：</label>
                        <input type="password" id="password" name="password" placeholder="請輸入你的密碼" required>
                    </p>
                    <p>
                        <img src="images/check.jpg" id="check_code_image"><img class="changimg" src="images/changimg.png" onclick="refreshHandler()">
                        <input type="text" id="check_code" name="checkcode" placeholder="請輸入驗證碼" value="<%= request.getMethod().equalsIgnoreCase("POST") ? request.getParameter("checkcode") : ""%>" required>
                    </p>
                    <input class="loginbutton" type="submit" value="登入">
                    <a href="${pageContext.request.contextPath}/getpassword.jsp"><input class="loginbutton"  value="忘記密碼"></a>
                    
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
