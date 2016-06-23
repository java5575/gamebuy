package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import gamebuy.gb.domain.Customer;
import java.util.List;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>會員註冊</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/jquery-ui-1.11.4.custom/jquery-ui.css\">\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/jquery-ui-1.11.4.custom/jquery-1.12.4.min.js\"></script>\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/jquery-ui-1.11.4.custom/jquery-ui.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                margin: 0px;\n");
      out.write("                padding: 0px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #wrapper{\n");
      out.write("                top:50px;\n");
      out.write("                position: relative;\n");
      out.write("                border:1px solid;\n");
      out.write("                border-radius: 50px;\n");
      out.write("                width: 400px;\n");
      out.write("                margin: 0px auto;      \n");
      out.write("                text-align: center;\n");
      out.write("                padding: 20px 0px;\n");
      out.write("                box-shadow:10px 10px 10px rgba(20%,20%,40%,0.5);\n");
      out.write("/*                animation: example 2s 1 cubic-bezier(0.680, -0.550, 0.265, 1.550) alternate;*/\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            h1{\n");
      out.write("                border-top-left-radius: 20px;\n");
      out.write("                border-top-right-radius: 20px;\n");
      out.write("                width: 400px;\n");
      out.write("                height: 40px;\n");
      out.write("                background-color: black;\n");
      out.write("                color: white;\n");
      out.write("                margin-bottom: 40px;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("/*            @keyframes example{\n");
      out.write("                from{top:-800px;}\n");
      out.write("                to{top:50px}\n");
      out.write("            }*/\n");
      out.write("\n");
      out.write("            p{\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .button{\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                width: 100px;\n");
      out.write("                height: 32px;\n");
      out.write("/*                background: url(../images/register.png);*/\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            p input{\n");
      out.write("                border: 1px black solid;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <script>\n");
      out.write("            $(function () {\n");
      out.write("                $(\"#datepicker\").datepicker({\n");
      out.write("                    dateFormat: \"yy/mm/dd\",\n");
      out.write("                    changeMonth: true,\n");
      out.write("                    changeYear: true\n");
      out.write("                })\n");
      out.write("\n");
      out.write("            })\n");
      out.write("            function refreshHandler() {\n");
      out.write("                var check_img = document.getElementById(\"check_code_image\");\n");
      out.write("                check_img.src = \"../images/registercheck.jpg?get=\" + new Date();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <p><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">首頁</a>| \n");
      out.write("               ");

                    if (customer == null) {

                
      out.write("\n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/login.jsp\">登入</a>| \n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/register.jsp\">註冊</a>|\n");
      out.write("            ");
} else {
      out.write("\n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/logout.do\">登出</a>\n");
      out.write("            <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/user/update.jsp\">修改會員資料</a>\n");
      out.write("             ");
}
      out.write("\n");
      out.write("             <span>");
      out.print( customer != null ? customer.getName() + "你好" : "");
      out.write("</span>\n");
      out.write("        </p>\n");
      out.write("        ");

            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && errors.size() > 0) {
      out.write("\n");
      out.write("        <ul>\n");
      out.write("            ");
for (String msg : errors) {
      out.write("\n");
      out.write("            <li>");
      out.print(msg);
      out.write("</li>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("        </ul>   \n");
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("            <form method=\"POST\" action=\"update.do\">\n");
      out.write("\n");
      out.write("                <h1>會員註冊</h1>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"email\">會員帳號：</label>\n");
      out.write("                    <input type=\"text\" id=\"email\" name=\"email\" placeholder=\"請輸入帳號\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.email?param.email:sessionScope.customer.email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"pwd\">會員密碼：</label>\n");
      out.write("                    <input type=\"password\" id=\"pwd\" name=\"pwd\" placeholder=\"請輸入密碼\" required>\n");
      out.write("                </p>\n");
      out.write("\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"pwd2\">確認密碼：</label>\n");
      out.write("                    <input type=\"password\" id=\"pwd2\" name=\"pwd2\" placeholder=\"請輸入密碼\" required>\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"name\">會員姓名：</label>\n");
      out.write("                    <input type=\"text\" id=\"name\" name=\"name\" placeholder=\"請輸入姓名\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.name?param.name:sessionScope.customer.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"id\">身分證號：</label>\n");
      out.write("                    <input type=\"text\" id=\"id\" name=\"id\" placeholder=\"請輸入你的身分證號\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.id?param.id:sessionScope.customer.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"address\">居住地址：</label>\n");
      out.write("                    <input type=\"text\" id=\"address\" name=\"address\" placeholder=\"請輸入地址\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.address?param.address:sessionScope.customer.address}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"phone\">連絡電話：</label>\n");
      out.write("                    <input type=\"tel\" id=\"phone\" name=\"phone\" placeholder=\"請輸入手機號碼\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.phone?param.phone:sessionScope.customer.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <label for=\"datepicker\">出生日期：</label>\n");
      out.write("                    <input type=\"text\" id=\"datepicker\" name=\"birthday\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty param.birthday?param.birthday:sessionScope.customer.birthday}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" placeholder=\"請輸入生日\">\n");
      out.write("                </p>\n");
      out.write("                <p>\n");
      out.write("                    <img src=\"../images/registercheck.jpg\" id=\"check_code_image\"><input type=\"button\" onclick=\"refreshHandler()\" value=\"更新圖片\">\n");
      out.write("                    <!--                    <label>驗證碼：</label>-->\n");
      out.write("                    <br>\n");
      out.write("                    <input type=\"text\" id=\"check_code\" name=\"checkcode\" placeholder=\"請輸入驗證碼\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.checkcode}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required>\n");
      out.write("                </p>\n");
      out.write("\n");
      out.write("                <input type=\"submit\" class=\"button\" value=\"修改\">\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
