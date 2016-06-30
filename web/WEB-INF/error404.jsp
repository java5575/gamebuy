<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>404錯誤</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            body {
                background-image: url(${pageContext.request.contextPath}/images/ERROR404.jpg);
                background-size: cover;

            }
            p{
                font-family: Microsoft JhengHei;
                display: block;
                position: relative;
                width: 400px;
                margin: 0 auto;
                top: 550px;
              
            }
            a{
                color: #ffffff;
                font-size: 50px;
                font-weight: bold;
                text-decoration: none;
            }
            a:hover{
                color:#ff0000;
            }


        </style>
    </head>
    <body>
        <p><a href="${pageContext.request.contextPath}/index.jsp">請點此回到首頁</a></p>
    </body>
</html>