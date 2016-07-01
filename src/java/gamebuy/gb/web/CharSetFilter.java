/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gamebuy.gb.web;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
@WebFilter(filterName = "CharSetFilter", urlPatterns = {"*.do", "*.jsp", "*.php", "*.view"}, initParams = {
    @WebInitParam(name = "charset", value = "UTF-8")}, dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.ERROR})
public class CharSetFilter implements Filter {

    private FilterConfig filterconfig;
    private String charset = "UTF-8";
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterconfig = filterConfig;
        String charset = filterConfig.getInitParameter("charset");
        if (charset != null) {
            this.charset = charset;
        }
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (((HttpServletRequest) request).getMethod().equalsIgnoreCase("GET")) {
            request.setCharacterEncoding("UTF-8");
        } else {
            request.setCharacterEncoding(charset);
        }
        request.getParameterNames();//鎖住設定，讓之後的其他編碼設定無效
        response.setCharacterEncoding(charset);
        
       response.getWriter();
       chain.doFilter(request, response);//沒有chain.dofilter就沒辦法將需求轉給要執行的檔案
               
    }
    
    @Override
    public void destroy() {
        
    }
    
}
