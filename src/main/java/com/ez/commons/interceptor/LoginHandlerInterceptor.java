package com.ez.commons.interceptor;

import com.ez.commons.util.WebTool;
import com.ez.modules.system.entity.SysLog;
import com.ez.modules.system.entity.SysUser;
import com.ez.commons.util.Jurisdiction;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.service.SysLogService;
import com.ez.modules.system.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysLogService syslogService;

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
				//判断是否被别人登录
				checkuser(request, response);

				path = path.substring(1, path.length());
				boolean b = Jurisdiction.hasJurisdiction(path);
				if(!b){
					response.sendRedirect(request.getContextPath() + PubConstants.LOGIN);
				}
				return b;
			}else{
				Object principal = currentUser.getPrincipal();
				if (principal != null){//该用户session销毁，当前用户仍在
					String url=request.getRequestURI();
					if(url.indexOf("/ez/syslogin/moremenu") == -1){//不包含 点击顶部菜单
						response.sendRedirect("/ez/syslogin/loginsession/3.do");
						logger.info("{}用户会话超时，请重新登录！",principal.toString());
					}
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
		//logger.info("--------------------------------afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView exception) throws Exception {
		//类似于AOP中的后置返回增强；在拦截器链执行完成后执行；进行后处理（如记录执行时间之类的）
		//logger.info("--------------------------------postHandle");
	}

	public void checkuser(HttpServletRequest request,
						  HttpServletResponse response) throws IOException, ServletException {
		//获取shiro session
		Subject subject = SecurityUtils.getSubject();
		Session session=subject.getSession();
		String loginUsername = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));//获得session中已经登录用户的名字
		//获取httpsession
		HttpSession httpSession=request.getSession();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SysUser user=sysUserService.findByUsername(loginUsername);

		//获取该用户的最新登录时间
		String dateString=syslogService.getByUseId(user.getUserno()).getCreateDate();
		//logger.info("dateString:{}",dateString);
		//获取当前用户登录的session信息
		SysLog sysLog=(SysLog)httpSession.getAttribute("sysLog") ;
		String sessionDateString = sysLog.getCreateDate();
		//logger.info("sessionDateString:{}",sessionDateString);

		if (!dateString.equals(sessionDateString)){//说明该用户被其他操作员登录
			String url=request.getRequestURI();
			if (url !=null && !"/ez/syslogin/logout.do".equals(url)){//当该用户被另一个操作员登录时，正好该用户点击退出系统时，不掉用下面的强制退出系统功能
				if(url.indexOf("/ez/syslogin/moremenu") == -1){//不包含 点击顶部菜单
					request.getRequestDispatcher("/ez/syslogin/loginsession/1.do").forward(request, response);
				}
			}
		}
	}
}
