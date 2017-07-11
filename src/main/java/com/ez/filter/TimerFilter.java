package com.ez.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * 计时器。用于记录请求执行时间。
 * 
 * @author liufang
 * 
 */
public class TimerFilter implements Filter {
	private static final Logger logger = LoggerFactory
			.getLogger(TimerFilter.class);
	public static final String TIMER_BEGIN = "_timerBegin";
	public static final NumberFormat FORMAT = new DecimalFormat("0.000");

	public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
		long begin = System.currentTimeMillis();
		request.setAttribute(TIMER_BEGIN, begin);
		chain.doFilter(request, response);
		if (logger.isDebugEnabled()) {
			long end = System.currentTimeMillis();
			BigDecimal processed = new BigDecimal(end - begin)
					.divide(new BigDecimal(1000));
			String uri = ((HttpServletRequest) request).getRequestURI();
			logger.debug("Processed in {} second(s). URI={}",
					FORMAT.format(processed), uri);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

	public void destroy() {
	}

}
