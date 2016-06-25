<%-- 
    Document   : register_ok
    Created on : 2016/6/5, 下午 03:22:08
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>註冊成功</title>
        <style type="text/css">
            *{
                margin: 0px;
                padding: 0px;
            }
            body{
                background-color: #000000;
            }
            .wrapper{
                position: relative;
                width: 1280px;
                height: 960px;
                margin: 0 auto;
                background-color: red;
            }
            .wrapper h1{
               display: block;
               position: absolute;
               z-index: 99999;
               width: 1280px;
               color: #ffffff;
               bottom: 100px;
               text-align: center;
               font-size: 40px;
        
            }
            a{
                text-decoration: none;
                color: #ff0000;
            }
            a:hover{
                color: #003eff;
            }
        </style>
    </head>
        <div class="wrapper">
            <h1>
                ${requestScope.customer.name}，恭喜您註冊成功了<a href="index.jsp">點此回到首頁</a>
            </h1>
            <img src="images/registerok.jpg">
        </div>
</html>
