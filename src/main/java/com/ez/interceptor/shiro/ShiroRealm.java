package com.ez.interceptor.shiro;


import com.ez.system.entity.SysMenu;
import com.ez.util.PubConstants;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import java.util.List;


/**
 * @author fh
 *  2015-3-6
 */
public class ShiroRealm extends AuthorizingRealm {

	/*
	 * 登录信息和用户验证信息验证(non-Javadoc)
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		String username = (String)token.getPrincipal();  				//得到用户名
		String password = new String((char[])token.getCredentials()); 	//得到密码
		if (!StringUtils.isBlank(username)) {
			if(null != username && null != password){
				return new SimpleAuthenticationInfo(username, password, getName());
			}else{
				return null;
			}
		}else{
			return null;
		}

	     
	}
	
	/*
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法(non-Javadoc)
	 * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
		Subject currentUser = SecurityUtils.getSubject();//当前用户
		//apache shiro获取所有在线用户 实现了单用户登陆
		Session session=currentUser.getSession();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<SysMenu> allmenuListbutton = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
		for (SysMenu menu : allmenuListbutton){
			if(menu.isHasMenu()){
				if (StringUtils.isNotBlank(menu.getMenuUrl())){
					// 添加基于Permission的权限信息
					info.addStringPermission(menu.getMenuUrl().trim());
					/*for (String permission : StringUtils.split(menu.getMenuUrl(),",")){
						info.addStringPermission(permission);
					}*/
				}
			}
		}

		System.out.println("========2");

		return info;
	}

}
