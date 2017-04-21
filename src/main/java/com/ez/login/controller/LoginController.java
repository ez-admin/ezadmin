package com.ez.login.controller;


import com.alibaba.fastjson.JSON;
import com.ez.annotation.SystemLogController;
import com.ez.login.entity.MenuTitle;
import com.ez.login.service.LoginService;
import com.ez.system.entity.*;
import com.ez.system.service.*;
import com.ez.util.FormatDateUtil;
import com.ez.util.PubConstants;
import com.ez.util.RightsHelper;
import com.ez.util.WebTool;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ez.util.Common.toIpAddr;

@Controller
@RequestMapping(value="/ez/syslogin/")
public class LoginController {

	@Resource
	private LoginService loginService;
	
	@Resource
	private SysUserService sysUserService;

	@Resource
	private SysRoleService sysRoleService;

	@Resource
	private SysRightService sysRightService;

	@Resource
	private SysLogService syslogService;

	@Resource
	private SysMenuService sysMenuService;

	@Resource
	private SysRightGlService sysRightGlService;
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="login_toLogin")
	public String toLogin(Model model){
		model.addAttribute("SYSNAME",PubConstants.SYSNAME);//读取系统名称
		return "ez/index/login";
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
			//loginService.setSeesionCntnt(request, sysUser);
			SysUser user=sysUserService.getByAll(sysUser);

			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();//当前用户
			Session session = currentUser.getSession();
			session.setAttribute(PubConstants.SESSION_SYSUSER, user);
			session.setAttribute(PubConstants.SESSION_LOGNM,user.getLognm());

			SysRole sysrole = sysRoleService.getById(user.getRlid());
			String roleRights = sysrole!=null ? sysrole.getRights() : "";
			//System.out.println("roleRights = " + roleRights);
			//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
			session.setAttribute(PubConstants.SESSION_ROLE_RIGHTS, roleRights);//将角色权限存入session，暂时弃用

			//一级菜单
			List<MenuTitle> menuTitleList=sysMenuService.findFisrtMenu();
			if (null != sysrole && menuTitleList!=null && menuTitleList.size()>0) {
				for (int i = 0; i < menuTitleList.size(); i++) {
					MenuTitle menuTitle=menuTitleList.get(i);
					menuTitle.setHasMenu(RightsHelper.testRights(roleRights, menuTitle.getId()));
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
				if (null != sysrole) {
					for (SysMenu sysMenu : allmenuList) {
						sysMenu.setHasMenu(RightsHelper.testRights(roleRights, sysMenu.getMenuId()));
						//System.out.println("sysMenu = " + sysMenu.toString());
					}
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
				WebTool.writeJson(result, response);
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
			result="{\"status\":false,\"message\":\"该用户已经登录！!\"}";
			log.setExceptionDetail("系统登录尝试,"+sysUser.getLognm() + "该用户已经登录!");
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

		return null;
	}
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value = "index")
	public String index(Model model,HttpServletRequest request){
		try {
			model.addAttribute("SYSNAME",PubConstants.SYSNAME);//读取系统名称

			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();

			SysUser sysuser = (SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
			if (sysuser != null) {
				List<SysMenu> allmenuList =(List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
				model.addAttribute("menulist",JSON.toJSONString(allmenuList));
				if(null == session.getAttribute(PubConstants.SESSION_QX)){
					session.setAttribute(PubConstants.SESSION_QX, this.getUQX(session));	//按钮权限放到session中
				}
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
	public String deleteById(Model model, HttpServletResponse response,
							 @PathVariable("parentid")  String parentid){
		String result=sysMenuService.getByParentId(parentid);
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 获取用户权限
	 */
	public Map<String, String> getUQX(Session session){
		Map<String, String> map = new HashMap<String, String>();
		try {
			SysUser sysUser = (SysUser) session.getAttribute(PubConstants.SESSION_SYSUSER);
			String ROLE_ID=sysUser.getRlid();

			SysRole sysRole=sysRoleService.getById(ROLE_ID);
			SysRightGl sysRightGl=sysRightGlService.findByRid(ROLE_ID);


			if(null != sysRightGl){
				map.put("FX_QX", sysRightGl.getFxQx().toString());
				map.put("FW_QX", sysRightGl.getFwQx().toString());
				map.put("QX1", sysRightGl.getQx1().toString());
				map.put("QX2", sysRightGl.getQx2().toString());
				map.put("QX3", sysRightGl.getQx3().toString());
				map.put("QX4", sysRightGl.getQx4().toString());


				SysRight sysRight=sysRightService.findByRid(ROLE_ID);

				map.put("C1", sysRight.getC1().toString());
				map.put("C2", sysRight.getC2().toString());
				map.put("C3", sysRight.getC3().toString());
				map.put("C4", sysRight.getC4().toString());
				map.put("Q1", sysRight.getQ1().toString());
				map.put("Q2", sysRight.getQ2().toString());
				map.put("Q3", sysRight.getQ3().toString());
				map.put("Q4", sysRight.getQ4().toString());
			}

			map.put("adds",sysRole.getAddQx());
			map.put("dels",sysRole.getDelQx());
			map.put("edits",sysRole.getEditQx());
			map.put("chas",sysRole.getChaQx());

			//System.out.println("map======="+map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 进入首页后的默认tab页面
	 * @return
	 */
	@RequestMapping(value="tab")
	public String tab(Model model){
		model.addAttribute("SYSNAME",PubConstants.SYSNAME);//读取系统名称
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
		session.removeAttribute(PubConstants.SESSION_menuList);
		session.removeAttribute(PubConstants.SESSION_QX);
		session.removeAttribute(PubConstants.SESSION_LOGNM);
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject();
		subject.logout();

		model.addAttribute("SYSNAME",PubConstants.SYSNAME);//读取系统名称
		return "ez/index/login";
	}
	
}
