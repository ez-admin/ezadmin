package com.ez.login.service.impl;


import com.ez.login.service.LoginService;
import com.ez.system.dao.SysUserDao;
import com.ez.system.entity.SysUser;
import com.ez.util.PubConstants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource
	private SysUserDao sysUserDao;
	@Resource
	private SessionDAO sessionDAO;

	@Override
	public int checkUser(SysUser sysUser) {
		// 首先判断用户名是否存在
		int checkRslt;
		SysUser user=sysUserDao.getByAll(sysUser);

		if(user == null){
			checkRslt = PubConstants.LOGIN_NOTEXIST;//不存在
		}else{
			if(PubConstants.CLOSE.equals(user.getIsused())){//2-停用
				checkRslt = PubConstants.LOGIN_NOTINUSE;
			}else{
				//验证静态密码
				checkRslt = this.checkStaticPWD(sysUser);
			}
		}
		return checkRslt;
	}
	
	//验证静态密码
	public int checkStaticPWD(SysUser sysUser){
		int checkRslt;
		int count = sysUserDao.checkpwd(sysUser);
		if(count == 0){
			//pwd not right
			checkRslt = PubConstants.LOGIN_STTCPWDERR;
		}else if(count == 1){
			//pwd right
			//验证shiro 安全框架
			checkRslt = checkShiro(sysUser);
		}else{
			checkRslt = PubConstants.LOGIN_MULTIUSER;
		}
		return checkRslt;
	}
	/**
	 * shiro 安全框架登陆
	 */
	public int checkShiro(SysUser user){
		int checkRslt;
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();//当前用户
		//apache shiro获取所有在线用户 实现了单用户登陆
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		Session currentUserSession=currentUser.getSession();
		for(Session session:sessions){
			String loginUsername = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));//获得session中已经登录用户的名字
			if(user.getLognm().equals(loginUsername) && !currentUserSession.getId().equals(session.getId())){  //这里的username也就是当前登录的username 并且不是在同一浏览器的
				//session.setTimeout(0);  //这里就把session清除
				sessionDAO.delete(session);//删除之前登陆过的账号（不在同一浏览器），把之前的客户挤掉线
			}
		}
		// 登录后存放进shiro token
		//获取基于用户名和密码的令牌
		//这里的token大家叫他令牌，也就相当于一张表格，你要去验证，你就得填个表，里面写
		UsernamePasswordToken token = new UsernamePasswordToken(user.getLognm(), user.getLogpwd());
		//但是，“已记住”和“已认证”是有区别的：
		//已记住的用户仅仅是非匿名用户，你可以通过subject.getPrincipals()获取用户信息。但是它并非是完全认证通过的用户，当你访问需要认证用户的功能时，你仍然需要重新提交认证信息。
		//这一区别可以参考亚马逊网站，网站会默认记住登录的用户，再次访问网站时，对于非敏感的页面
		token.setRememberMe(true);
		try {
			//这句是提交申请，验证能不能通过，也就是交给公安局同志了。这里会回调reaml里的一个方法
			// 回调doGetAuthenticationInfo，进行认证
			currentUser.login(token);
			if(null == currentUser){
				checkRslt = PubConstants.LOGIN_ISLOGINED;
				return checkRslt;
			}

		} catch (AuthenticationException e) {
			e.printStackTrace();

		}
		//验证是否通过
		if(currentUser.isAuthenticated()){
			checkRslt = PubConstants.LOGIN_SUCCESS;
		}else{
			checkRslt = PubConstants.LOGIN_ISAUTHEN;
		}

		// 登录成功后会跳转到successUrl配置的链接，不用管下面返回的链接。
		return checkRslt;
	}
}
