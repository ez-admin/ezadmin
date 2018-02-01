/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.ez.commons.security;


import com.ez.commons.util.MD5;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysLogService;
import com.ez.modules.system.service.SysUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.ez.commons.util.Common.toIpAddr;

/**
 * 表单验证（包含验证码）过滤类
 * @author ThinkGem
 * @version 2014-5-19
 */
@Service
public class FormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysLogService syslogService;

	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = MD5.md5(getPassword(request));
		if (password==null){
			password = "";
		}
		boolean rememberMe = isRememberMe(request);

		return new UsernamePasswordToken(username, password,rememberMe);
	}
	@Override
	protected boolean executeLogin(ServletRequest servletRequest,
								   ServletResponse servletResponse) throws Exception {
		AuthenticationToken token = createToken(servletRequest, servletResponse);
		if (token == null) {
			String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken "
					+ "must be created in order to execute a login attempt.";
			throw new IllegalStateException(msg);
		}
		String username = (String) token.getPrincipal();
		SysUser user = sysUserService.findByUsername(username);

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		String ip = toIpAddr(request);
		try {
			Subject subject = getSubject(request, response);
			subject.login(token);

			//记录登陆日志
			syslogService.loginSuccess(ip,user);
			Session session=subject.getSession();
			//当前用户存入session
			session.setAttribute(PubConstants.SESSION_SYSUSER, user);
			session.setAttribute(PubConstants.SESSION_LOGNM,user.getLognm());

			return onLoginSuccess(token, subject, request, response);
		} catch (AuthenticationException e) {
			syslogService.loginFailure(ip,username,e);
			return onLoginFailure(token, e, request, response);
		}
	}
	
}