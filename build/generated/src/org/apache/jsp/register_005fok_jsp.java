package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>註冊成功</title>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            *{\n");
      out.write("                margin: 0px;\n");
      out.write("                padding: 0px;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                background-color: #000000;\n");
      out.write("            }\n");
      out.write("            .wrapper{\n");
      out.write("                position: relative;\n");
      out.write("                width: 1280px;\n");
      out.write("                height: 960px;\n");
      out.write("                margin: 0 auto;\n");
      out.write("      \n");
      out.write("            }\n");
      out.write("            .wrapper h1{\n");
      out.write("               display: block;\n");
      out.write("               position: absolute;\n");
      out.write("               z-index: 99999;\n");
      out.write("               width: 1280px;\n");
      out.write("               color: #ffffff;\n");
      out.write("               bottom: 200px;\n");
      out.write("               text-align: center;\n");
      out.write("               font-size: 40px;\n");
      out.write("        \n");
      out.write("            }\n");
      out.write("            a{\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #ff0000;\n");
      out.write("            }\n");
      out.write("            a:hover{\n");
      out.write("                color: #003eff;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <h1>\n");
      out.write("                ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.customer.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("，恭喜您註冊成功了<a href=\"index.jsp\">點此回到首頁</a>\n");
      out.write("            </h1>\n");
      out.write("            <img src=\"images/registerok.jpg\">\n");
      out.write("        </div>\n");
      out.write("            <audio src=\"audio/1428.mp3\" autoplay>\n");
      out.write("            </audio>\n");
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
