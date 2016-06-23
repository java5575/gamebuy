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
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrator
 */
public class performanceFilter implements Filter {

    private FilterConfig filterConfig;
    private String prefix = "Performance:";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        String prefix = filterConfig.getInitParameter("prefix");
        if (prefix != null) {
            this.prefix = prefix;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        long begin = System.currentTimeMillis();

        chain.doFilter(request, response);

        long end = System.currentTimeMillis();

        long gap = end - begin;

        filterConfig.getServletContext().log(prefix + ",執行" + ((HttpServletRequest) request).getRequestURI() + "花費" + gap + "ms.");

        //((HttpServletResponse)response).setStatus(404);
    }

    @Override
    public void destroy() {

    }

}
