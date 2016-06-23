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
    </head>
        <div>
            <h1>
                ${requestScope.customer.name}，恭喜您註冊成功了<a href="index.jsp">點此回到首頁</a>
            </h1>
        </div>
</html>
