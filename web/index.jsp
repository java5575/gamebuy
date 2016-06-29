<%@page import="gamebuy.gb.domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>GameBuy首頁</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/icon.ico"/>
        <link rel="bookmark" href="images/icon.ico"/>
        <link href="css/reset.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/slide.js" type="text/javascript"></script>
        <script src="js/tab.js" type="text/javascript"></script>
        <style>

        </style>
    </head>
    <body>

        <div class="wrapper">
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
                    <input type="search" placeholder="請輸入關鍵字"/>
                    <input type="submit" value="">
                </form>
            </div>
            <div id="slide">
                <ul>
                    <li><a href="#"><img src="images/slide_1.jpg" /></a></li>
                    <li><a href="#"><img src="images/slide_2.jpg" /></a></li>
                    <li><a href="#"><img src="images/slide_3.jpg" /></a></li>
                    <li><a href="#"><img src="images/slide_4.jpg" /></a></li>
                </ul>
                <a class="prev left control" href="#">‹</a>
                <a class="next right control" href="#">›</a>
            </div>
            <div id="MAIN">
                <ul id="tabMenu">
                    <li><a href="#" id="TAB1">項目一 </a></li>
                    <li><a href="#" id="TAB2">項目二</a></li>
                    <li><a href="#" id="TAB3">項目三</a></li>
                    <li><a href="#" id="TAB4">項目四</a></li>
                    <li><a href="#" id="TAB5">項目五</a></li>
                    <li><a href="#" id="TAB6">項目六</a></li>
                </ul>
                <div class="BOXS" id="BOX1">
                    <p>本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法</p>
                </div>
                <div class="BOXS" id="BOX2"> 
                    <p>小班制，面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多次免費小班制，面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善重修喔面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多有大量的範例讓同學現場練習。上課附有老師親自寫</p>
                </div>
                <div class="BOXS" id="BOX3"> 
                    <p>目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯過本課程喔！是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔！是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔 級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔 </p>
                </div>
                <div class="BOXS" id="BOX4"> 
                    <p>除了基本操作，您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。並且除了軟體的操作技巧，課堂上還會探討色彩觀念、設計作品的配色技巧、排版觀念、網頁版面的設除了基本操作，您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用計觀念您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。並且除了軟體的操作技巧，課堂上還會探討色彩觀念、設計作品的配色技巧、排版觀念您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。可學習到許多高階的影像處理技巧及去背合成技巧。</p>
                </div>
                <div class="BOXS" id="BOX5"> 
                    <p>BOX5</p>
                </div>
                <div class="BOXS" id="BOX6"> 
                    <p>BOX6</p>
                </div>

            </div>
            <form id="subselect">
                <input type="radio" id="radio1" name="radio" />項目1
                <input type="radio" id="radio2" name="radio" />項目2
                <input type="radio" id="radio3" name="radio" />項目3
            </form>

        </div>
        <div class="footer">
            <p>Copy right by Caesar wang</p>
        </div>
    </body>
</html>
