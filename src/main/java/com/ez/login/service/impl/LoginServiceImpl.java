package com.ez.login.service.impl;


import com.ez.login.service.LoginService;
import com.ez.system.dao.SysUserDao;
import com.ez.system.entity.SysUser;
import com.ez.util.PubConstants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource
	private SysUserDao sysUserDao;

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
				checkRslt = this.checkStaticPWD(user);
			}
		}
		return checkRslt;
	}
	
	//验证静态密码
	public int checkStaticPWD(SysUser user){
		int checkRslt;
		int count = sysUserDao.count(user);
		if(count == 0){
			//pwd not right
			checkRslt = PubConstants.LOGIN_STTCPWDERR;
		}else if(count == 1){
			//pwd right
			//验证shiro 安全框架
			checkRslt = checkShiro(user);
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
	/**
	 * 登录验证成功后向session中写入内容
	 * @param request
	 * @param sysUser
	 * @return void
	 */
	public void setSeesionCntnt(HttpServletRequest request,SysUser sysUser){
		//find user info by vpnacct
		SysUser user=sysUserDao.getByAll(sysUser);
		//then set session content
		/*Map<String, List<SysMenu>> menuMap = null;*/
		
		/*if(user.getOptype().equals(PubConstants.OPTYPE_SUPERADMIN)){
			//super admin
			menuMap = this.getSpecialMenuMap(PubConstants.OPTYPE_SUPERADMIN);
		}else if(user.getOptype().equals(PubConstants.OPTYPE_DEVELOPER)){
			//developer
			menuMap = this.getSpecialMenuMap(PubConstants.OPTYPE_DEVELOPER);
		}else if(user.getOptype().equals(PubConstants.OPTYPE_GODHAND)&&user.getRlid() ==null){
			//超级管理员
			menuMap = this.getSpecialMenuMap(PubConstants.OPTYPE_GODHAND);
		}else{
			//business operator
			//由roleid查询对应角色的权限字符组
			SysRole sysRole = sysRoleDao.getById(user.getRlid());
			String rightStr = sysRole.getRlright();
			//由权限标识获取的菜单显示图
			menuMap = this.getMenuMap(rightStr);
		}
		
		//查询操作员所属机构名称-start
		Dept dept = DeptDao.getById(user.getDptno());
		if(dept != null){
			request.getSession().setAttribute("dptname",dept.getDptname());
		}		
		//查询操作员所属机构名称-end
		
		//add by chenez  查询操作员所属公司 start
		String optype=user.getOptype();
		request.getSession().setAttribute("optype",optype);//查询操作员欢迎页面
		if("9".equals(optype)){
			String cmpnm="系统开发人员";
			request.getSession().setAttribute("cmpnm",cmpnm);
		}else if("3".equals(optype)){
			SysOrg sysorg=sysOrgDao.getNmById(user.getEmplyno());
			request.getSession().setAttribute("cmpnm",sysorg.getName());
		}else{
			Companyinfo companyinfo=companyinfoDao.getComById(user.getEmplyno());
			if(companyinfo!=null){
				request.getSession().setAttribute("cmpnm",companyinfo.getCmpnm());
				request.getSession().setAttribute("company",companyinfo);
			}
		}
		//add by chenez  查询操作员所属公司 end
		request.getSession().setAttribute("menuMap", menuMap);
		request.getSession().setAttribute("opname", user.getOpnm());
		request.getSession().setAttribute("sysuser", user);*/

		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();

		session.setAttribute(PubConstants.SESSION_SYSUSER, user);
	}
	
	/**
	 * get super admin's menuMap
	 * @return Map<String, List<SysMenu>>
	 */
	/*public Map<String, List<SysMenu>> getSpecialMenuMap(String opTyp){
		Map menuMap = new HashMap<String, List<SysMenu>>();
		
		List<SysMenu> matchMenuOne = null;
		List<SysMenu> matchMenuTwo = null;
		List<SysMenu> matchMenuThree = null;
		
		if(opTyp.equals(PubConstants.OPTYPE_SUPERADMIN)){
			matchMenuOne = this.sysMenuDao.findSuperByMnLen(1);
			matchMenuTwo = this.sysMenuDao.findSuperByMnLen(2);
			matchMenuThree = this.sysMenuDao.findSuperByMnLen(3);
		}else if(opTyp.equals(PubConstants.OPTYPE_DEVELOPER)){
			matchMenuOne = this.sysMenuDao.findDevByMnLen(1);
			matchMenuTwo = this.sysMenuDao.findDevByMnLen(2);
			matchMenuThree = this.sysMenuDao.findDevByMnLen(3);
		}else if(opTyp.equals(PubConstants.OPTYPE_GODHAND)){
			matchMenuOne = this.sysMenuDao.findGodByMnLen(1);
			matchMenuTwo = this.sysMenuDao.findGodByMnLen(2);
			matchMenuThree = this.sysMenuDao.findGodByMnLen(3);
		}
		menuMap.put("A", matchMenuOne);
		menuMap.put("B", matchMenuTwo);
		menuMap.put("C", matchMenuThree);
		
		return menuMap;
	}*/
	
	/**
	 * 由权限标识获取的菜单显示图
	 * @param opright
	 * @return Map<String, List<SysMenu>>
	 */
	/*public Map<String, List<SysMenu>> getMenuMap(String opright){
		Map menuMap = new HashMap<String, List<SysMenu>>();
		
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<opright.length(); i++){
			if(opright.charAt(i) == '1'){
				//listright.add(String.valueOf(i + 1));
				sb.append(String.valueOf(i + 1)  + ",");
			}
		}
		String listright = sb.toString();
		if(listright.length() > 0){
			listright = listright.substring(0, listright.length() - 1);
		}
        //以上获得形如(110,112,113,115)之类的字符串
		List<SysRight> rightList = sysRightDao.getMnnoByRght(listright);
		
		List<String> rightMenuNoOne = getRightMenu(rightList, 1);   //拥有权限的一级菜单
		List<String> rightMenuNoTwo = getRightMenu(rightList, 2);   //拥有权限的二级菜单
		List<String> rightMenuNoThree = getRightMenu(rightList, 3); //拥有权限的三级菜单
		
		List<SysMenu> matchMenuOne = getMatchMenu(rightMenuNoOne, 1);
		List<SysMenu> matchMenuTwo = getMatchMenu(rightMenuNoTwo, 2);
		List<SysMenu> matchMenuThree = getMatchMenu(rightMenuNoThree, 3);
		
		menuMap.put("A", matchMenuOne);
		menuMap.put("B", matchMenuTwo);
		menuMap.put("C", matchMenuThree);
		
		return menuMap;
	}*/
	
	/**
	 * 匹配每个级别的具有权限的菜单项目
	 * @param rightMenuNo
	 * @param len
	 * @return List<SysMenu>
	 */
	/*public List<SysMenu> getMatchMenu(List<String> rightMenuNo, int len){
		List<SysMenu> rightMenuList = new ArrayList<SysMenu>();
		//查询现有系统中所有菜单编号为相应长度的菜单信息
		List<SysMenu> sysMenuList = sysMenuDao.findByMnLen3(len);
		
		Iterator<String> it = rightMenuNo.iterator();
		while (it.hasNext()){
			String menuNo = (String)it.next();
			for (int i = 0; i < sysMenuList.size(); i++) {
				SysMenu menu = sysMenuList.get(i);
				if(menu.getMnno().equals(menuNo)){
					rightMenuList.add(menu);
					break;
				}
			}
		}
		return rightMenuList;
	}*/
	
	/**
	 * 由rightno的列表得出对应级别权限菜单列表
	 * @param rightList
	 * @param lvl
	 * @return List<String>
	 */
	/*public List<String> getRightMenu(List<SysRight> rightList, int lvl){
		List<String> rightMenu = new ArrayList<String>();
		HashSet<String> set = new HashSet<String>();
		for (int i = 0; i < rightList.size(); i++){
			set.add(rightList.get(i).getMnno().substring(0, lvl));
		}
		
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			rightMenu.add(it.next());
		}
		Collections.sort(rightMenu);
		return rightMenu;
	}*/
}
