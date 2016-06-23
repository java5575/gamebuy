package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>GameBuy首頁</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link href=\"css/reset.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/index.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"js/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/slide.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"js/tab.js\" type=\"text/javascript\"></script>\n");
      out.write("        <style>\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div class=\"header\">\n");
      out.write("                <a href=\"index.jsp\"><img class=\"logo\" src=\"images/logo2.png\" alt=\"\"/></a>\n");
      out.write("                <div class=\"memberlist\">\n");
      out.write("                    ");
Customer customer = (Customer) session.getAttribute("customer");
                        if (customer == null) {

                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/login.jsp\">登入</a>|\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/register.jsp\">註冊</a>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <a href=\"#\"><img src=\"images/shoppingcar.png\"/></a>\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/user/update.jsp\">修改會員資料</a>|\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/logout.do\">登出</a>\n");
      out.write("                     <span>");
      out.print( customer != null ? customer.getName() + "你好" : "");
      out.write("</span>\n");
      out.write("                     \n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("                <form>\n");
      out.write("                    <input type=\"search\" placeholder=\"請輸入關鍵字\"/>\n");
      out.write("                    <input type=\"submit\" value=\"\">\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"slide\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_1.jpg\" /></a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_2.jpg\" /></a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_3.jpg\" /></a></li>\n");
      out.write("                    <li><a href=\"#\"><img src=\"images/slide_4.jpg\" /></a></li>\n");
      out.write("                </ul>\n");
      out.write("                <a class=\"prev left control\" href=\"#\">‹</a>\n");
      out.write("                <a class=\"next right control\" href=\"#\">›</a>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"MAIN\">\n");
      out.write("                <ul id=\"tabMenu\">\n");
      out.write("                    <li><a href=\"#\" id=\"TAB1\">項目一 </a></li>\n");
      out.write("                    <li><a href=\"#\" id=\"TAB2\">項目二</a></li>\n");
      out.write("                    <li><a href=\"#\" id=\"TAB3\">項目三</a></li>\n");
      out.write("                    <li><a href=\"#\" id=\"TAB4\">項目四</a></li>\n");
      out.write("                    <li><a href=\"#\" id=\"TAB5\">項目五</a></li>\n");
      out.write("                    <li><a href=\"#\" id=\"TAB6\">項目六</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX1\">\n");
      out.write("                    <p>本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外，更著重於實務應用，規劃以完全範例導向為主，讓學生在課堂上紮紮實實製作出一系列本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體各式各樣的網頁本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法一一解說之外工具操作方法一一解說之外本課程是最基礎的網頁設計入門，使用目前業界網頁設計最專業且最普及的軟體課堂上除了對這個軟體的工具操作方法</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX2\"> \n");
      out.write("                    <p>小班制，面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多次免費小班制，面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善重修喔面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多面對面教學品質有保障~ 口碑看得見~教室電腦及網路設備完善，一人一機，有大量的範例讓同學現場練習。上課附有老師親自寫的講義及範例原始檔~ 上完一次課程後可申請多有大量的範例讓同學現場練習。上課附有老師親自寫</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX3\"> \n");
      out.write("                    <p>目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯過本課程喔！是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔！是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔 級的影像處理技巧以及影像合成技巧嗎? 您不能錯是目前設計界最重要的軟體，想學習職業等級的影像處理技巧以及影像合成技巧嗎過本課程喔 </p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX4\"> \n");
      out.write("                    <p>除了基本操作，您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。並且除了軟體的操作技巧，課堂上還會探討色彩觀念、設計作品的配色技巧、排版觀念、網頁版面的設除了基本操作，您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用計觀念您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。並且除了軟體的操作技巧，課堂上還會探討色彩觀念、設計作品的配色技巧、排版觀念您將可學習到許多高階的影像處理技巧及去背合成技巧，例如：遮色片應用、色版應用、混色模式 ...等。可學習到許多高階的影像處理技巧及去背合成技巧。</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX5\"> \n");
      out.write("                    <p>BOX5</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"BOXS\" id=\"BOX6\"> \n");
      out.write("                    <p>BOX6</p>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("                   <form id=\"subselect\">\n");
      out.write("                       <input type=\"radio\" id=\"radio1\" name=\"radio\" />項目1\n");
      out.write("                    <input type=\"radio\" id=\"radio2\" name=\"radio\" />項目2\n");
      out.write("                    <input type=\"radio\" id=\"radio3\" name=\"radio\" />項目3\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("     <div class=\"footer\">\n");
      out.write("            <p>Copy right by Caesar wang</p>\n");
      out.write("        </div>\n");
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
