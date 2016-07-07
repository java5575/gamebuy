<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/icon.ico"/>
        <link rel="bookmark" href="images/icon.ico"/>
        <link href="css/indexandfooter.css" rel="stylesheet" type="text/css"/>
        <link href="css/contactUs.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCbgGnLDTPoLGyUu92uyqoRfLKREN6-D50"></script>
        <title>聯絡我們</title>

        <script type="text/javascript">
            var geo;
            var map;
            var mapMarker;

            window.addEventListener("load", init);
            function init()
            {
                geo=navigator.geolocation;
                geo.watchPosition(showMap, errorHandler, {timeout: 30000});
            }

            function getGeoLocation()
            {
                if (navigator.geolocation)
                {
                    return navigator.geolocation;
                } else
                {
                    return undefined;
                }
            }

            function showMap(position)
            {
                var lat = 25.052848;
                        //position.coords.latitude; 
                var lon = 121.5443515;
                        //position.coords.longitude;
                var latlng = new google.maps.LatLng(lat, lon);
                if (map) {
                    map.panTo(latlng);
                    mapMarker.setPosition(latlng)
                } else {
                    //mapTypeId: 1.ROADMAP 2.SATELLITE 3.HYBRID 4.TERRAIN
                    var mapOptions = {zoom: 15, center: latlng, mapTypeId: google.maps.MapTypeId.ROADMAP};
                    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
                    mapMarker = new google.maps.Marker({position: latlng, title: "I am here!"});
                    mapMarker.setMap(map);
                }
            }

            function errorHandler(error)
            {
                switch (error.code)
                {
                    case error.TIMEOUT:
                        alert("Geolocation Timeout!");
                        break;
                    case error.POSITION_UNAVAILABLE:
                        alert("Geolocation Position Unavailable!");
                        break;
                    case error.PERMISSION_DENIED:
                        alert("Geolocation Permission Denied!");
                        break;
                    default:
                        alert("Geolocation Unknow Error: " + error.code);
                }
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
                    <a href="${pageContext.request.contextPath}/cart.jsp"><img src="images/shoppingcar.png"/></a>
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
            <div class="mail">
                <form>
                    <table>
                        <tr>
                            <td colspan="2">如果客服中心找不到您要的答案，請利用下列表格與我們聯絡</td>
                        </tr>
                        <tr>
                            <td>會員姓名：</td>
                            <td><input type="text" id="name" name="name" placeholder="請輸入您的姓名" required></td>
                        </tr>
                        <tr>
                            <td>會員帳號：</td>
                            <td><input type="email" id="email" name="email" placeholder="請輸入您的帳號" required></td>
                        </tr>
                        <tr>
                            <td>反應內容：</td>
                            <td><textarea rows="10" cols="30" placeholder="請輸入您要反應的內容"></textarea></td>
                        </tr>
                        <tr>

                            <td colspan="2" align="center"><input type="submit" name="submit" id="submit" value="送出資料"><input type="reset" name="reset" id="reset" value="重新填寫"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div id="mapCanvas">

            </div>
            <div class="info">
                <p>總公司地址：台北市復興北路99號14樓</p>
                <p>總公司電話：(02)2514-9292</p>
            </div>
        </div>           
        <div class="footwer_outside">
            <div class="footer">
                <p>Copy right by Caesar wang</p>
            </div>
        </div>
    </body>
</html>
