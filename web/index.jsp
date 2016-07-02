<%@page import="java.util.ArrayList"%>
<%@page import="gamebuy.gb.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="gamebuy.gb.model.ProductService"%>
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
                    <input type="search" name="search" placeholder="請輸入關鍵字"/>
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
                    <li><a href="#" id="TAB1">數位遊戲 </a></li>
                    <li><a href="#" id="TAB2">PlayStation4</a></li>
                    <li><a href="#" id="TAB3">Xbox</a></li>
                    <li><a href="#" id="TAB4">PlayStation3</a></li>
                    <li><a href="#" id="TAB5">Wii U</a></li>
                    <li><a href="#" id="TAB6">個人電腦</a></li>
                </ul>                
                <div class="BOXS" id="BOX1">
                    <%
                        ProductService service = new ProductService();
                        List<Product> list = null;
                        String search = request.getParameter("search");
                        if (search != null && search.matches("\\d+")) {
                            int id = Integer.parseInt(search);
                            Product p = service.get(id);
                            list = new ArrayList<>();
                            list.add(p);
                        } else if (search != null) {
                            list = service.getByName(search);
                        } else {
                            list = service.getPlatForm(0);
                        }
                        if (list != null && list.size() > 0) {
                    %>
                    <ul>
                        <%for (Product p : list) {%>
                        <li class="product_list">

                            <a href="product.jsp?pid=<%=p.getId()%>">
                                <img src='<%= p.getUrl()%>'>

                                <h3><%=p.getName()%></h3>
                                <p>售價:<%= p.getUnitPrice()%></p>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                    <%}%>
                </div>
                <div class="BOXS" id="BOX2"> 
                    <%
                        if (search != null && search.matches("\\d+")) {
                            int id = Integer.parseInt(search);
                            Product p = service.get(id);
                            list = new ArrayList<>();
                            list.add(p);
                        } else if (search != null) {
                            list = service.getByName(search);
                        } else {
                            list = service.getPlatForm(1);
                        }
                        if (list != null && list.size() > 0) {
                    %>
                    <ul>
                        <%for (Product p : list) {%>
                        <li class="product_list">

                            <a href="product.jsp?pid=<%=p.getId()%>">
                                <img src='<%= p.getUrl()%>'>
                            </a>
                            <h3><%=p.getName()%></h3>
                            <p>售價:<%= p.getUnitPrice()%></p>
                        </li>
                        <%}%>
                    </ul>
                    <%}%>
                </div>
                <div class="BOXS" id="BOX3"> 
                    <%
                        if (search != null && search.matches("\\d+")) {
                            int id = Integer.parseInt(search);
                            Product p = service.get(id);
                            list = new ArrayList<>();
                            list.add(p);
                        } else if (search != null) {
                            list = service.getByName(search);
                        } else {
                            list = service.getPlatForm(2);
                        }
                        if (list != null && list.size() > 0) {
                    %>
                    <ul>
                        <%for (Product p : list) {%>
                        <li class="product_list">

                            <a href="product.jsp?pid=<%=p.getId()%>">
                                <img src='<%= p.getUrl()%>'>
                            </a>
                            <h3><%=p.getName()%></h3>
                            <p>售價:<%= p.getUnitPrice()%></p>
                        </li>
                        <%}%>
                    </ul>
                    <%}%>
                </div>
                <div class="BOXS" id="BOX4"> 
                    <%
                        if (search != null && search.matches("\\d+")) {
                            int id = Integer.parseInt(search);
                            Product p = service.get(id);
                            list = new ArrayList<>();
                            list.add(p);
                        } else if (search != null) {
                            list = service.getByName(search);
                        } else {
                            list = service.getPlatForm(3);
                        }
                        if (list != null && list.size() > 0) {
                    %>
                    <ul>
                        <%for (Product p : list) {%>
                        <li class="product_list">

                            <a href="product.jsp?pid=<%=p.getId()%>">
                                <img src='<%= p.getUrl()%>'>
                            </a>
                            <h3><%=p.getName()%></h3>
                            <p>售價:<%= p.getUnitPrice()%></p>
                        </li>
                        <%}%>
                    </ul>
                    <%}%>
                </div>
                <div class="BOXS" id="BOX5"> 
                    <p>BOX5</p>
                </div>
                <div class="BOXS" id="BOX6"> 
                    <p>BOX6</p>
                </div>

            </div>
            <form id="subselect">
                <p><input type="radio" id="radio1" name="radio" />遊戲軟體</p>
                <p><input type="radio" id="radio2" name="radio" />中文化遊戲</p>
                <p><input type="radio" id="radio3" name="radio" />限制級專區</p>
            </form>

        </div>
        <div class="footer">
            <p>Copy right by Caesar wang</p>
        </div>
    </body>
</html>
