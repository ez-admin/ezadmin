package com.ez.modules.login.controller;


import com.alibaba.fastjson.JSON;
import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.util.Common;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysLogService;
import com.ez.modules.system.service.SysMenuService;
import com.ez.modules.system.service.SysOptionService;
import com.ez.modules.system.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Properties;

@Controller
@RequestMapping(value="/ez/syslogin/")
public class LoginController extends BaseController{
	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);
	
	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysLogService syslogService;

	@Autowired
	private SysMenuService sysMenuService;

	@Autowired
	private SysOptionService sysOptionService;
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="login_toLogin")
	public String toLogin(Model model){
		String sysname= sysOptionService.getById("systemName").getOptionValue();
		model.addAttribute(PubConstants.SYSNAME,sysname);//读取系统名称
		return "ez/index/login";
	}

	@RequestMapping(value="login",method = RequestMethod.POST)
	public String login(Model model,HttpServletRequest request){
		String loginmessage = "";
		//shiro 登陆失败后throw 异常信息，通过request域里shiroLoginFailure来获取（备注：直接在jsp页面里也可获取）
		String errorClassName = (String) request.getAttribute("shiroLoginFailure");
		if (UnknownAccountException.class.getName().equals(errorClassName)){
			loginmessage="用户名不存在，请重新输入!";
		} else if (IncorrectCredentialsException.class.getName().equals(errorClassName)){
			loginmessage="密码不正确，请重新输入！";
		} else if (LockedAccountException.class.getName().equals(errorClassName)){
			loginmessage="该用户已被锁定,请解除锁定再试！";
		}else {
			loginmessage="系统异常,请稍后再试！";
		}
		model.addAttribute("loginmessage",loginmessage);
		return "ez/index/login";
	}

	/**
	 * 访问系统首页
	 */
	@RequestMapping(value = "index")
	@SystemLogController(description = "访问系统首页")
	public String index(Model model,HttpServletRequest request){
		Subject currentUser=SecurityUtils.getSubject();
		if (currentUser.isAuthenticated()){
			Session session=currentUser.getSession();
			//获取系统顶部信息
			String sysfooter= sysOptionService.getById("systemFooter").getOptionValue();
			model.addAttribute("footerContent",sysfooter);
			//系统分页每页显示数
			String systemBackPageSize=sysOptionService.getById(PubConstants.SESSION_SYSTEMBACKPAGESIZE).getOptionValue();
			if(null == session.getAttribute(PubConstants.SESSION_SYSTEMBACKPAGESIZE)) {
				if (Common.isEmpty(systemBackPageSize)){
					systemBackPageSize="10";//默认10
				}
				session.setAttribute(PubConstants.SESSION_SYSTEMBACKPAGESIZE, systemBackPageSize);
			}else {
				systemBackPageSize=(String) session.getAttribute(PubConstants.SESSION_SYSTEMBACKPAGESIZE);
			}

			SysUser user = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
			if (user != null) {

				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				String userRights = user.getOpright();
				session.setAttribute(PubConstants.SESSION_ROLE_RIGHTS, userRights);//将角色权限存入session

				// session存入用户的权限菜单
				/*List<SysMenu> menuList=sysMenuService.findMenuList(userRights);
				if(null == session.getAttribute(PubConstants.SESSION_MENULIST)) {
					session.setAttribute(PubConstants.SESSION_MENULIST, menuList);
				}else {
					menuList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_MENULIST);
				}

				//session存入用户的权限菜单和权限按钮
				List<SysMenu> menuALLList=sysMenuService.findAllMenuList(userRights);
				if(null == session.getAttribute(PubConstants.SESSION_allmenuList)) {
					session.setAttribute(PubConstants.SESSION_allmenuList, menuALLList);
				}else {
					menuALLList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
				}*/

				List<SysMenu> menuList=sysMenuService.findMenuList(userRights,session);


				//首页左侧菜单
				model.addAttribute("myMenuList",JSON.toJSONString(menuList));
			}
			return "ez/index/index";
		}else {
			return "ez/index/login";
		}

	}

	/**
	 * 进入首页后的默认tab页面
	 * @return
	 */
	@RequestMapping(value="tab")
	public String tab(Model model){
		Properties props=System.getProperties(); //获得系统属性集
		String osName = props.getProperty("os.name"); //操作系统名称
		String osArch = props.getProperty("os.arch"); //操作系统构架
		String osVersion = props.getProperty("os.version"); //操作系统版本
		String javaVersion = props.getProperty("java.version"); //Java 运行时环境版本
		String javaHome = props.getProperty("java.home"); //Java 供应商的 URL
		model.addAttribute("osName",osName);
		model.addAttribute("osArch",osArch);
		model.addAttribute("osVersion",osVersion);
		model.addAttribute("javaVersion",javaVersion);
		model.addAttribute("javaHome",javaHome);
		return "ez/index/main";
	}

	 /**
	 * @param model
	 * @param request
	 * @return
	 * 退出系统
	 */
	@RequestMapping(value="logout")
	@SystemLogController(description = "用户退出系统")
    public String login_classic(Model model,HttpServletRequest request){
		//shiro管理的session
		//HttpSession session = request.getSession();
		Session session=SecurityUtils.getSubject().getSession();
		session.removeAttribute(PubConstants.SESSION_SYSUSER);
		session.removeAttribute(PubConstants.SESSION_ROLE_RIGHTS);
		//session.removeAttribute(PubConstants.SESSION_MENULIST);
		session.removeAttribute(PubConstants.SESSION_allmenuList);
		session.removeAttribute(PubConstants.SESSION_LOGNM);
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		//系统名称
		String sysname = sysOptionService.getById("systemName").getOptionValue();
		model.addAttribute(PubConstants.SYSNAME,sysname);//读取系统名称
		return "ez/index/login";
	}
	
}
