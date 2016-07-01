package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import gamebuy.gb.domain.Product;
import java.util.List;
import gamebuy.gb.model.ProductService;
import gamebuy.gb.domain.Customer;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--\r\n");
      out.write("To change this license header, choose License Headers in Project Properties.\r\n");
      out.write("To change this template file, choose Tools | Templates\r\n");
      out.write("and open the template in the editor.\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>GameBuy首頁</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/icon.ico\"/>\r\n");
      out.write("        <link rel=\"bookmark\" href=\"images/icon.ico\"/>\r\n");
      out.write("        <link href=\"css/reset.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <link href=\"css/index.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <script src=\"js/jquery.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"js/slide.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"js/tab.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"wrapper\">\r\n");
      out.write("            <div class=\"header\">\r\n");
      out.write("                <a href=\"index.jsp\"><img class=\"logo\" src=\"images/logo2.png\" alt=\"\"/></a>\r\n");
      out.write("                <div class=\"memberlist\">\r\n");
      out.write("                    ");
Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {

                    
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/login.jsp\">登入</a>|\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/register.jsp\">註冊</a>\r\n");
      out.write("                    ");
} else {
      out.write("\r\n");
      out.write("                    <a href=\"#\"><img src=\"images/shoppingcar.png\"/></a>\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/user/update.jsp\">修改會員資料</a>|\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/logout.do\">登出</a>\r\n");
      out.write("                    <span>");
      out.print( customer != null ? customer.getName() + "你好" : "");
      out.write("</span>\r\n");
      out.write("\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <form>\r\n");
      out.write("                    <input type=\"search\" name=\"search\" placeholder=\"請輸入關鍵字\"/>\r\n");
      out.write("                    <input type=\"submit\" value=\"\">\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"slide\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_1.jpg\" /></a></li>\r\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_2.jpg\" /></a></li>\r\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_3.jpg\" /></a></li>\r\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_4.jpg\" /></a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <a class=\"prev left control\" href=\"#\">‹</a>\r\n");
      out.write("                <a class=\"next right control\" href=\"#\">›</a>\r\n");
      out.write("            </div>            \r\n");
      out.write("            <div id=\"MAIN\">\r\n");
      out.write("                <ul id=\"tabMenu\">\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB1\">數位遊戲 </a></li>\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB2\">PlayStation4</a></li>\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB3\">Xbox</a></li>\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB4\">PlayStation3</a></li>\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB5\">Wii U</a></li>\r\n");
      out.write("                    <li><a href=\"#\" id=\"TAB6\">個人電腦</a></li>\r\n");
      out.write("                </ul>                \r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX1\">\r\n");
      out.write("                    ");

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
                    
      out.write("\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        ");
for (Product p : list) {
      out.write("\r\n");
      out.write("                        <li \r\n");
      out.write("                            style='display: inline-block;width:250px;height:250px;overflow:auto;background-color: powderblue;box-shadow: 1px 1px 2px gray;padding: 2px;margin: 5px'>\r\n");
      out.write("                            \r\n");
      out.write("                            <a href=\"product.jsp?pid=");
      out.print(p.getId());
      out.write("\">\r\n");
      out.write("                                <img style='width: 150px' src='");
      out.print( p.getUrl());
      out.write("'>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <h3>");
      out.print(p.getName());
      out.write("</h3>\r\n");
      out.write("                            <p>售價:");
      out.print( p.getUnitPrice());
      out.write("</p>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX2\"> \r\n");
      out.write("                    ");

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
                    
      out.write("\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        ");
for (Product p : list) {
      out.write("\r\n");
      out.write("                        <li \r\n");
      out.write("                            style='display: inline-block;width:250px;height:250px;overflow:auto;background-color: powderblue;box-shadow: 1px 1px 2px gray;padding: 2px;margin: 5px'>\r\n");
      out.write("                            \r\n");
      out.write("                            <a href=\"product.jsp?pid=");
      out.print(p.getId());
      out.write("\">\r\n");
      out.write("                                <img style='width: 150px' src='");
      out.print( p.getUrl());
      out.write("'>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <h3>");
      out.print(p.getName());
      out.write("</h3>\r\n");
      out.write("                            <p>售價:");
      out.print( p.getUnitPrice());
      out.write("</p>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX3\"> \r\n");
      out.write("                    ");

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
                    
      out.write("\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        ");
for (Product p : list) {
      out.write("\r\n");
      out.write("                        <li \r\n");
      out.write("                            style='display: inline-block;width:250px;height:250px;overflow:auto;background-color: powderblue;box-shadow: 1px 1px 2px gray;padding: 2px;margin: 5px'>\r\n");
      out.write("                            \r\n");
      out.write("                            <a href=\"product.jsp?pid=");
      out.print(p.getId());
      out.write("\">\r\n");
      out.write("                                <img style='width: 150px' src='");
      out.print( p.getUrl());
      out.write("'>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <h3>");
      out.print(p.getName());
      out.write("</h3>\r\n");
      out.write("                            <p>售價:");
      out.print( p.getUnitPrice());
      out.write("</p>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX4\"> \r\n");
      out.write("                    ");

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
                    
      out.write("\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        ");
for (Product p : list) {
      out.write("\r\n");
      out.write("                        <li \r\n");
      out.write("                            style='display: inline-block;width:250px;height:250px;overflow:auto;background-color: powderblue;box-shadow: 1px 1px 2px gray;padding: 2px;margin: 5px'>\r\n");
      out.write("                            \r\n");
      out.write("                            <a href=\"product.jsp?pid=");
      out.print(p.getId());
      out.write("\">\r\n");
      out.write("                                <img style='width: 150px' src='");
      out.print( p.getUrl());
      out.write("'>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <h3>");
      out.print(p.getName());
      out.write("</h3>\r\n");
      out.write("                            <p>售價:");
      out.print( p.getUnitPrice());
      out.write("</p>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        ");
}
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX5\"> \r\n");
      out.write("                    <p>BOX5</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"BOXS\" id=\"BOX6\"> \r\n");
      out.write("                    <p>BOX6</p>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <form id=\"subselect\">\r\n");
      out.write("                <p><input type=\"radio\" id=\"radio1\" name=\"radio\" />遊戲軟體</p>\r\n");
      out.write("               <p><input type=\"radio\" id=\"radio2\" name=\"radio\" />中文化遊戲</p>\r\n");
      out.write("                <p><input type=\"radio\" id=\"radio3\" name=\"radio\" />限制級專區</p>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <p>Copy right by Caesar wang</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
