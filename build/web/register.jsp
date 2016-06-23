<%-- 
    Document   : register
    Created on : 2016/6/5, 下午 01:51:11
    Author     : Administrator
--%>

<%@page import="java.util.List"%>
<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="jquery-ui-1.11.4.custom/jquery-ui.css">
        <script src="jquery-ui-1.11.4.custom/jquery-1.12.4.min.js"></script>
        <script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
        <title>會員註冊</title>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }
            #wrapper{
                width: 400px;
                position: relative;
                margin:0 auto;
            }

            #logo{
                width: 10%;
            }
            #middle{
                top:200px;
                /*                position: relative;*/
                border:1px solid;
                border-radius: 50px;
                width: 400px;
                /*                margin: 0px auto;      */
                text-align: center;
                padding: 20px 0px;
                box-shadow:10px 10px 10px rgba(20%,20%,40%,0.5);
                /*                animation: example 2s 1 cubic-bezier(0.680, -0.550, 0.265, 1.550) alternate;*/

            }
            h1{
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
                width: 400px;
                height: 40px;
                background-color: black;
                color: white;
                margin-bottom: 40px;

            }


            /*            @keyframes example{
                            from{top:-500px;}
                            to{top:200px}
                        }*/
            label{
                color: blue;
            }
            p{
                margin-bottom: 20px;
            }
            .button{
                border: none;
                text-indent: -99999px;
                width: 116px;
                height: 39px;
                background: url(images/login.png);
                /*                box-shadow:2px 2px 3px rgba(20%,20%,40%,0.5);*/
            }
            p input{
                border: 1px black solid;
            }
        </style>
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

    <div id="wrapper">
        <div id="header">
            <a href="index.jsp"><img id="logo" src="images/LOGO.png" alt=""/></a>
                <%Customer customer = (Customer) session.getAttribute("customer");
                    if (customer == null) {

                %>
            <a href="${pageContext.request.contextPath}/login.jsp">登入</a>
            <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>
            <%} else {%>
            <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>
            <a href="${pageContext.request.contextPath}/logout.do">登出</a>
            <%}%>
            <span><%= customer != null ? customer.getName() + "你好" : ""%></span>

        </div>
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
                    <img src="images/registercheck.jpg" id="check_code_image"><input type="button" onclick="refreshHandler()" value="更新圖片">
                    <input type="text" id="check_code" name="checkcode" placeholder="請輸入驗證碼" value="${param.checkcode}" required>
                </p>
                <input type="submit" value="註冊">
                <%
                    List<String> errors = (List<String>) request.getAttribute("errors");
                    if (errors != null && errors.size() > 0) {%>
                <ul id="errorMsg">
                    <%for (String msg : errors) {%>
                    <li><%=msg%></li>
                        <%}%>
                </ul>
                <%}%>
            </form>
        </div>
    </div>
</body>
</html>
