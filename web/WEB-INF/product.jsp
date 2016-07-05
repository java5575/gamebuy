<%@page import="gamebuy.gb.domain.Product"%>
<%@page import="gamebuy.gb.model.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8" info="產品明細"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>產品明細</title>
    </head>
    <body>
        <%
            ProductService service = new ProductService();
            String pid = request.getParameter("pid");
            Product p = null;
            if (pid != null && pid.matches("\\d+")) {
                p = service.get(Integer.parseInt(pid));
            }
        %>
        <div id='product_panel'>
            <%if (p != null) {%>
            <img src='<%= p.getUrl()%>'>
            <p>商品名稱:<%= p.getName()%></p>
            <p>建議售價:<%= p.getUnitPrice()%></p>
            <p>優惠特價:<%= p.getPreferentialPrice()%></p>
            <p>紅利回饋:<%= p.getBonus()%></p>
            <p>發售日期:<%= p.getIssueDate()%></p>
            <a href="${pageContext.request.contextPath}/add_cart.do?pid=<%= p.getId()%>">
                <img src="images/shoppingcar.png" alt=""/>
            </a>
            <p>
                <%= p.getDescription()%>
            </p>
            <%}%>
        </div>         
    </body>
</html>