<%@page import="gamebuy.gb.domain.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>會員註冊</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-ui.css">
        <script src="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }

            #wrapper{
                top:50px;
                position: relative;
                border:1px solid;
                border-radius: 50px;
                width: 400px;
                margin: 0px auto;      
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
                from{top:-800px;}
                to{top:50px}
            }*/

            p{
                margin-bottom: 20px;

            }
            .button{
                
                
                width: 100px;
                height: 32px;
/*                background: url(../images/register.png);*/

            }
            p input{
                border: 1px black solid;

            }


        </style>
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
        <p><a href="${pageContext.request.contextPath}">首頁</a>| 
               <%
                    if (customer == null) {

                %>
            <a href="${pageContext.request.contextPath}/login.jsp">登入</a>| 
            <a href="${pageContext.request.contextPath}/register.jsp">註冊</a>|
            <%} else {%>
            <a href="${pageContext.request.contextPath}/logout.do">登出</a>
            <a href="${pageContext.request.contextPath}/user/update.jsp">修改會員資料</a>
             <%}%>
             <span><%= customer != null ? customer.getName() + "你好" : ""%></span>
        </p>
        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && errors.size() > 0) {%>
        <ul>
            <%for (String msg : errors) {%>
            <li><%=msg%></li>
                <%}%>
        </ul>   

        <%}%>

        <div id="wrapper">

            <form method="POST" action="update.do">

                <h1>會員註冊</h1>
                <p>
                    <label for="email">會員帳號：</label>
                    <input type="text" id="email" name="email" placeholder="請輸入帳號" value="${not empty param.email?param.email:sessionScope.customer.email}" required>
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
                    <input type="text" id="id" name="id" placeholder="請輸入你的身分證號" value="${not empty param.id?param.id:sessionScope.customer.id}" required>
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
                    <input type="text" id="datepicker" name="birthday" value="${not empty param.birthday?param.birthday:sessionScope.customer.birthday}" placeholder="請輸入生日">
                </p>
                <p>
                    <img src="../images/registercheck.jpg" id="check_code_image"><input type="button" onclick="refreshHandler()" value="更新圖片">
                    <!--                    <label>驗證碼：</label>-->
                    <br>
                    <input type="text" id="check_code" name="checkcode" placeholder="請輸入驗證碼" value="${param.checkcode}" required>
                </p>

                <input type="submit" class="button" value="修改">
            </form>



        </div>

    </body>
</html>
