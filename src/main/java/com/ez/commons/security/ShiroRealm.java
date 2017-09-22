package com.ez.commons.security;


import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysUserRoleService;
import com.ez.modules.system.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author fh
 *  2015-3-6
 */
@Service
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	/*
	 * 登录信息和用户验证信息验证(non-Javadoc)
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		String username = (String)authcToken.getPrincipal();  				//得到用户名
		//String password = new String((char[])authcToken.getCredentials()); 	//得到密码

		//UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		//String username=token.getUsername();//也能得到用户名
		SysUser user=sysUserService.findByUsername(username);//也能得到用户名
		if (user != null) {
			if(PubConstants.CLOSE.equals(user.getIsused())){//锁定
				throw new LockedAccountException();
			}
			return new SimpleAuthenticationInfo(user.getLognm(), user.getLogpwd(), getName());
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
		List<SysMenu> sysMenuList= (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
		for (SysMenu menu : sysMenuList){
			if (StringUtils.isNotBlank(menu.getMenuUrl())){
				// 添加基于Permission的权限信息
				info.addStringPermission(menu.getMenuUrl().trim());
			}
		}
//		SysUser sysuser = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
//		List<SysUserRole> sysUserRoleList=sysUserRoleService.findById(sysuser.getUserno());
//		for (SysUserRole role : sysUserRoleList){
//			info.addRole(role.getRoleId());
//		}

		return info;
	}

}
