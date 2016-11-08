package com.ez.login.controller;


import com.alibaba.fastjson.JSON;
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
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		if(checkRslt == PubConstants.LOGIN_SUCCESS){
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
			List<SysMenu> allmenuList=sysMenuService.findAllList();
			if(null == session.getAttribute(PubConstants.SESSION_allmenuList)) {
				if (null != sysrole) {
					for (SysMenu sysMenu : allmenuList) {
						sysMenu.setHasMenu(RightsHelper.testRights(roleRights, sysMenu.getMenuId()));
					}
				}
				session.setAttribute(PubConstants.SESSION_allmenuList, allmenuList);
			}else {
				allmenuList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_menuList);
			}



			if(user!=null){
				log.setCmpno(user.getCmpno());
				log.setUserno(user.getUserno());
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

		}else{
			result="{\"status\":false,\"message\":\"请确认登录信息是否输入正确.\"}";
            log.setExceptionDetail("请确认登录信息是否输入正确,"+sysUser.getLognm() + "其他原因导致登录异常");
		}
        //请求的IP
        String ip = request.getRemoteAddr();
        log.setMehtoddescription("用户登录");
        log.setMethod("LoginController-->login");
        log.setLogtype("0");
        log.setRequestIp(ip);
        log.setParams( sysUser.getLognm()+","+sysUser.getLogpwd());
        log.setCreateDate(FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss"));
        syslogService.add(log);
		System.out.println("result = " + result);
		WebTool.writeJson(result, response);
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

				/*SysRole sysrole = sysRoleService.getById(sysuser.getRlid());
				String roleRights = sysrole!=null ? sysrole.getRights() : "";
				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(PubConstants.SESSION_ROLE_RIGHTS, roleRights); 		//将角色权限存入session

				List<SysMenu> allmenuList = new ArrayList<SysMenu>();
				if(null == session.getAttribute(PubConstants.SESSION_allmenuList)) {
					allmenuList=sysMenuService.findAll();
					if (null != sysrole) {
						for (SysMenu sysMenu : allmenuList) {
							sysMenu.setHasMenu(RightsHelper.testRights(roleRights, sysMenu.getMenuId()));
							if (sysMenu.isHasMenu()) {
								List<SysMenu> subMenuList = sysMenu.getMenuList();
								for (SysMenu sub : subMenuList) {
									sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getMenuId()));
								}
							}

						}
					}
					session.setAttribute(PubConstants.SESSION_allmenuList, allmenuList);
				}else{
					allmenuList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
				}
				//切换菜单=====
				List<SysMenu> menuList = new ArrayList<SysMenu>();
				//if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(pd.getString("changeMenu")))){
				if(null == session.getAttribute(PubConstants.SESSION_menuList)){
					List<SysMenu> menuList1 = new ArrayList<SysMenu>();
					List<SysMenu> menuList2 = new ArrayList<SysMenu>();

					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						SysMenu menu = allmenuList.get(i);
						if("1".equals(menu.getMenuType())){
							menuList1.add(menu);
						}else{
							menuList2.add(menu);
						}
					}

					session.removeAttribute(PubConstants.SESSION_menuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(PubConstants.SESSION_menuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(PubConstants.SESSION_menuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_menuList);
				}*/
				//切换菜单=====

				/*if(null == session.getAttribute(PubConstants.SESSION_QX)){
					session.setAttribute(PubConstants.SESSION_QX, this.getUQX(session));	//按钮权限放到session中
				}*/
				/*model.addAttribute("sysuser",sysuser);
				model.addAttribute(PubConstants.SESSION_menuList,menuList);
				System.out.println("menuList = " + menuList.toString());
				System.out.println("sysuser = " + sysuser.toString());*/
			}else {
				return "ez/index/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ez/index/index";
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

			//System.out.println(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="tab")
	public String tab(){
		return "ez/index/tab";
	}

	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="login_default")
	public String defaultPage(){
		return "ez/index/default";
	}
	 /**
	 * @param model
	 * @param request
	 * @return
	 * 退出系统
	 */
	@RequestMapping(value="logout")
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
