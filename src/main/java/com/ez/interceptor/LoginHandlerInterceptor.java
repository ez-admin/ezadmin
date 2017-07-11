package com.ez.interceptor;

import com.ez.system.entity.SysUser;
import com.ez.util.Jurisdiction;
import com.ez.util.PubConstants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
* 类名称：LoginHandlerInterceptor.java
* 类描述： 
* @author FH
* 作者单位： 
* 联系方式：
* 创建时间：2015年1月1日
* @version 1.6
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory
			.getLogger(LoginHandlerInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	//类似于AOP中的前置增强；在拦截器链执行之前执行；如果返回true则继续拦截器链；否则中断后续的拦截器链的执行直接返回；进行预处理（如基于表单的身份验证、授权）
		String path = request.getServletPath();
		if(path.matches(PubConstants.NO_INTERCEPTOR_PATH)) {
			return true;
		}else{
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			SysUser user = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
			if(user != null){
				path = path.substring(1, path.length());
				boolean b = Jurisdiction.hasJurisdiction(path);
				if(!b){
					response.sendRedirect(request.getContextPath() + PubConstants.LOGIN);
				}
				return b;
			}else{
				Object principal = currentUser.getPrincipal();
				if (principal != null){//该用户session销毁，当前用户仍在
					response.sendRedirect("/ez/syslogin/loginsession/1.do");
					logger.info("您的账号{}正在另一客户端登录！",principal.toString());
				}else {//用户没有登录直接访问地址，则跳转到登录页面
					//登陆过滤
					response.sendRedirect(request.getContextPath() + PubConstants.LOGIN);
				}
				return false;
			}
		}
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {
		//类似于AOP中的后置最终增强；即不管有没有异常都会执行；可以进行清理资源（如接触Subject与线程的绑定之类的）
		System.out.println("--------------------------------afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView exception) throws Exception {
		//类似于AOP中的后置返回增强；在拦截器链执行完成后执行；进行后处理（如记录执行时间之类的）
		System.out.println("--------------------------------postHandle");
	}
}
