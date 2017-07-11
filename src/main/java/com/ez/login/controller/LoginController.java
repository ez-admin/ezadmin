package com.ez.login.controller;


import com.alibaba.fastjson.JSON;
import com.ez.annotation.SystemLogController;
import com.ez.login.entity.MenuTitle;
import com.ez.login.service.LoginService;
import com.ez.system.entity.SysLog;
import com.ez.system.entity.SysMenu;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysLogService;
import com.ez.system.service.SysMenuService;
import com.ez.system.service.SysOptionService;
import com.ez.system.service.SysUserService;
import com.ez.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Properties;

import static com.ez.util.Common.toIpAddr;

@Controller
@RequestMapping(value="/ez/syslogin/")
public class LoginController {
	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);
	@Resource
	private LoginService loginService;
	
	@Resource
	private SysUserService sysUserService;

	@Resource
	private SysLogService syslogService;

	@Resource
	private SysMenuService sysMenuService;

	@Resource
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

	@RequestMapping(value = "/loginsession/{id}.do")
	public String login(Model model, @PathVariable Integer id) {
		String sysname= sysOptionService.getById("systemName").getOptionValue();
		model.addAttribute(PubConstants.SYSNAME,sysname);//读取系统名称
		model.addAttribute("id",id);
		return "ez/index/login";
	}
	@RequestMapping(value = "/removeSession.do", method = RequestMethod.POST)
	public String removeSession() {
		Object principal = SecurityUtils.getSubject().getPrincipal();//（如果存在，则手动销毁）
		System.out.println("进入这个removesession方法了吗？");
		if (principal != null){
			logger.info("您的账号{}正在另一客户端登录,系统强制下线！",principal.toString());
			SecurityUtils.getSubject().logout();
		}
		return null;
	}
	@RequestMapping(value="login")
    public String login(SysUser sysUser, HttpServletRequest request, HttpServletResponse response){
		String result = null;
        SysLog log = new SysLog();
		int checkRslt = loginService.checkUser(sysUser);
		log.setLogtype( PubConstants.LOGTYPE_EXCEPTION);

		if(checkRslt == PubConstants.LOGIN_SUCCESS){
			log.setLogtype( PubConstants.LOGTYPE_NORMAL);
			result="{\"status\":true,\"message\":\"登陆成功\"}";
			//登陆成功后,向session中写入内容
			SysUser user=sysUserService.getByAll(sysUser);

			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();//当前用户
			Session session = currentUser.getSession();
			//当前用户存入session
			session.setAttribute(PubConstants.SESSION_SYSUSER, user);
			session.setAttribute(PubConstants.SESSION_LOGNM,user.getLognm());

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

			//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
			String userRights = user.getOpright();
			session.setAttribute(PubConstants.SESSION_ROLE_RIGHTS, userRights);//将角色权限存入session，暂时弃用

			//一级菜单
			List<MenuTitle> menuTitleList=sysMenuService.findFisrtMenu();
			if (menuTitleList!=null && menuTitleList.size()>0) {
				for (int i = 0; i < menuTitleList.size(); i++) {
					MenuTitle menuTitle=menuTitleList.get(i);
					menuTitle.setHasMenu(RightsHelper.testRights(userRights, menuTitle.getId()));
					if (!menuTitle.isHasMenu()){
						menuTitleList.remove(i);//删除指定索引位置的元素，返回删除的元素
						i=i-1;
					}
				}
			}
            session.setAttribute(PubConstants.SESSION_FIRSTMENULIST, menuTitleList);
			//查询所有菜单
			List<SysMenu> allmenuList=sysMenuService.findAllList();
			if(null == session.getAttribute(PubConstants.SESSION_allmenuList)) {
				for (SysMenu sysMenu : allmenuList) {
					sysMenu.setHasMenu(RightsHelper.testRights(userRights, sysMenu.getMenuId()));
					//System.out.println("sysMenu = " + sysMenu.toString());
				}
				session.setAttribute(PubConstants.SESSION_allmenuList, allmenuList);
			}else {
				allmenuList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
			}
            if(user!=null){
				log.setUserno(user.getUserno());
				//add user lastlogintime
				user.setLoginip(toIpAddr(request));
				user.setLastlogin(FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss"));
				sysUserService.modify(user);
			}
		}else if(checkRslt == PubConstants.LOGIN_NOTEXIST){
			result="{\"status\":false,\"message\":\"用户名不存在!\"}";
            log.setExceptionDetail("系统登录尝试"+sysUser.getLognm() + "用户名不存在");
		}else if(checkRslt == PubConstants.LOGIN_NOTINUSE){
			result="{\"status\":false,\"message\":\"用户已被停用!\"}";
            log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "用户已被停用");
		}else if(checkRslt == PubConstants.LOGIN_STTCPWDERR){
			result="{\"status\":false,\"message\":\"密码错误!\"}";
            log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "密码错误!");
		}else if(checkRslt == PubConstants.LOGIN_MULTIUSER){
			result="{\"status\":false,\"message\":\"多名操作员拥有相同的登录名和密码!\"}";
            log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "多名用户拥有相同的登录名和密码!");
		}else if(checkRslt == PubConstants.LOGIN_ISAUTHEN){
			result="{\"status\":false,\"message\":\"用户没有登陆认证!\"}";
			log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "用户没有登陆认证!");
		}else if(checkRslt == PubConstants.LOGIN_ISLOGINED){
			result="{\"status\":false,\"message\":\"该用户已经在其他地方登录!\"}";
			log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "该用户已经在其他地方登录！");
		}else{
			result="{\"status\":false,\"message\":\"请确认登录信息是否输入正确.\"}";
            log.setExceptionDetail("请确认登录信息是否输入正确,"+sysUser.getLognm() + "其他原因导致登录异常");
		}
        //请求的IP
        //String ip = request.getRemoteAddr();
		String ip = toIpAddr(request);
        log.setMehtoddescription("登录系统");
        log.setMethod("LoginController-->login");

        log.setRequestIp(ip);
        log.setParams( sysUser.getLognm()+";"+sysUser.getLogpwd());
        log.setCreateDate(FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss"));
        syslogService.add(log);
		WebTool.writeJson(result, response);
		return null;
	}
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value = "index")
	public String index(Model model,HttpServletRequest request){
		try {
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			//系统名称
			String sysname = sysOptionService.getById("systemName").getOptionValue();
			model.addAttribute(PubConstants.SYSNAME,sysname);//读取系统名称

			//获取session里的用户
			SysUser sysuser = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
			if (sysuser != null) {
				List<SysMenu> allmenuList =(List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
				model.addAttribute("menulist",JSON.toJSONString(allmenuList));
				//获取系统顶部信息
				String sysfooter= sysOptionService.getById("systemFooter").getOptionValue();
				model.addAttribute("footerContent",sysfooter);
			}else {
				return "ez/index/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ez/index/index";
	}

	@RequestMapping(value="moremenu/{parentid}",method= RequestMethod.GET)
	@ResponseBody
	public String getByParentId(Model model, HttpServletResponse response,
							 @PathVariable("parentid")  String parentid){
		String result=sysMenuService.getByParentId(parentid);
		WebTool.writeJson(result, response);
		return null;
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
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();

		session.removeAttribute(PubConstants.SESSION_SYSUSER);
		session.removeAttribute(PubConstants.SESSION_ROLE_RIGHTS);
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
