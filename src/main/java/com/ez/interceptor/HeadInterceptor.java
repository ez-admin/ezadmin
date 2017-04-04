package com.ez.interceptor;

import com.ez.util.PubConstants;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class HeadInterceptor implements Filter {
	
	
	private String loginPage;
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
						 FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest=(HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		   HttpSession session = httpServletRequest.getSession();
		   //判断用户session是否过期或是否登录
		   String url=httpServletRequest.getServletPath();


		   if(url.indexOf("login_toLogin.html")>=0|url.indexOf("login1.jsp")>=0) {
		    chain.doFilter(request, response);
		   } else {
			   if (url.indexOf("getTitle.html") >= 0) {
				   chain.doFilter(request, response);
			   } else {

				   if (session != null && session.getAttribute(PubConstants.SESSION_SYSUSER) != null) {
					   chain.doFilter(request, response);
				   } else {

					   String name = httpServletRequest.getContextPath();
					   String path = httpServletRequest.getRequestURL().toString();
					   String port = httpServletRequest.getLocalPort() + "";
					   String paths = path.substring(0, path.lastIndexOf(":") + 1);
					   HttpServletResponse httpresponse = (HttpServletResponse) response;
					   httpresponse.sendRedirect(paths + port + name + loginPage );

					   chain.doFilter(request, response);
				   }
			   }
		   }
	}

	@Override
	 public void init(FilterConfig filterConfig) throws ServletException
	 {
	  this.loginPage=filterConfig.getInitParameter("loginPage");
	 }

	
}
