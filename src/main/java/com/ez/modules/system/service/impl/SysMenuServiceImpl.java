/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.service.impl;

import com.alibaba.fastjson.JSON;
import com.ez.modules.login.entity.MenuTitle;
import com.ez.modules.system.dao.SysMenuDao;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.service.SysMenuService;
import com.ez.commons.util.PubConstants;
import com.ez.commons.util.RightsHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysMenuService")
public class SysMenuServiceImpl implements SysMenuService {
	@Resource
	private SysMenuDao sysMenuDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @param sysMenu
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<SysMenu> query(Page<SysMenu> page, SysMenu sysMenu) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysMenu> list = sysMenuDao.query(sysMenu);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysMenu
	 * @return List<SysMenu>
	 */
	@Transactional(readOnly=true)
	public List<SysMenu> queryAll(SysMenu sysMenu) {
		List<SysMenu> list = sysMenuDao.query(sysMenu);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysMenu
	 * @return
	 */
	public void add(SysMenu sysMenu) {
		sysMenuDao.add(sysMenu);
	}
	
	/**
	 * 新增操作
	 * @param sysMenu
	 * @return
	 */
	public void addAll(SysMenu sysMenu) {
		sysMenuDao.addAll(sysMenu);
	}
	
	/**
	 * 删除操作
	 * 删除自己及子菜单
	 * @param id
	 * @return
	 */
	public void delete(String id) {
		deleterecursion(id);
	}

	/**
	 *  Created by chenez on 2017/5/17 23:48
	 *  递归函数
	 * @param id
	 */
	public void deleterecursion(String id){
		List<SysMenu> sysMenuList=sysMenuDao.findAllByParentid(id);
		if (sysMenuList!=null && sysMenuList.size()>0){
			for (SysMenu sysMenu : sysMenuList) {
				deleterecursion(sysMenu.getMenuId().toString());
			}
		}
		sysMenuDao.delete(id);
	}
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public SysMenu getById(String id) {
		return sysMenuDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysMenu
	 * @return
	 */
	public void modify(SysMenu sysMenu) {
		sysMenuDao.modify(sysMenu);
	}

	/**
	 * 查找所有
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<SysMenu> findAll() {
		List<SysMenu> rl = sysMenuDao.findAll();
		for(SysMenu menu : rl){
			List<SysMenu> subList = sysMenuDao.findAllByParentid(Integer.toString(menu.getMenuId()));
			menu.setMenuList(subList);
		}
		return rl;
	}

	@Override
	public List<SysMenu> findAllList() {
		return sysMenuDao.findAllList();
	}

	@Override
	public List<MenuTitle> findFisrtMenu() {
		return sysMenuDao.findFisrtMenu();
	}

	@Override
	public String getByParentId(String parentid) {
		String result="";
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();//当前用户
		Session session = currentUser.getSession();
		String userRights=(String)session.getAttribute(PubConstants.SESSION_ROLE_RIGHTS);

		List<MenuTitle> menuTitleList= sysMenuDao.getByParentId(parentid);
		if (menuTitleList!=null && menuTitleList.size()>0){
			for (int i = 0; i < menuTitleList.size(); i++) {
				MenuTitle menuTitle=menuTitleList.get(i);
				//设置第一个菜单默认展开
                /*if (i==0){
					menuTitle.setSpread(true);
				}*/
				//via rights to judge menu
				menuTitle.setHasMenu(RightsHelper.testRights(userRights, menuTitle.getId()));//菜单权限
				if (!menuTitle.isHasMenu()){
					menuTitleList.remove(i);
					i=i-1;
				}else {
					List<MenuTitle> menuTitles= sysMenuDao.getByParentId(menuTitle.getId().toString());
					if (menuTitles!=null && menuTitles.size()>0){
						for (int j = 0; j < menuTitles.size(); j++) {
							MenuTitle menutl=menuTitles.get(j);
							menutl.setHasMenu(RightsHelper.testRights(userRights, menutl.getId()));
							if (!menutl.isHasMenu()){
								menuTitles.remove(j);
								j=j-1;
							}
						}
						menuTitle.setChildren(menuTitles);
					}
				}

			}
		}
		result=JSON.toJSONString(menuTitleList);
		//System.out.println("resultmenujson = " + result);
		return result;
	}

    @Override
    public List<SysMenu> getParentMenu(Page<SysMenu> page, SysMenu sysmenu) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysMenu> list = sysMenuDao.getParentMenu(sysmenu);
		return list;
    }

	@Override
	public List<SysMenu> getChildrenMenu(Page<SysMenu> page,SysMenu sysmenu) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysMenu> list = sysMenuDao.getChildrenMenu(sysmenu);
		return list;
	}

    @Override
    public List<SysMenu> getParentMenuAll(SysMenu sysmenu) {
		List<SysMenu> list = sysMenuDao.getParentMenu(sysmenu);
		return list;
    }

	@Override
	public List<SysMenu> getChildrenMenuAll(SysMenu sysmenu) {
		List<SysMenu> list = sysMenuDao.getChildrenMenu(sysmenu);
		return list;
	}

	/**
	 * 查询到三级菜单
	 * @return
	 */
	@Override
	public List<SysMenu> listAllMenu() {
		SysMenu sysMenu=new SysMenu();
		Session session = SecurityUtils.getSubject().getSession();
		String USERNAME = session.getAttribute(PubConstants.SESSION_LOGNM).toString();	//获取当前登录者loginname
		Boolean isAdmin = "admin".equals(USERNAME);
		if (!isAdmin){//不是超级管理员
			sysMenu.setMenuType("0");//查询MenuType不等于0的菜单
		}

		List<SysMenu> sysMenuList=sysMenuDao.getParentMenu(sysMenu);
		for (SysMenu menu: sysMenuList){
			sysMenu.setParentId(menu.getMenuId().toString());
			List<SysMenu> subList=sysMenuDao.getChildrenMenu(sysMenu);
			menu.setMenuList(subList);
			for (SysMenu submenu: subList){
				sysMenu.setParentId(submenu.getMenuId().toString());
				List<SysMenu> subsubList=sysMenuDao.getChildrenMenu(sysMenu);
				submenu.setMenuList(subsubList);
			}

		}
		return sysMenuList;
	}

	/**
	 * 查询包含四级菜单，即有按钮的的菜单
	 * @return
	 */
	@Override
	public List<SysMenu> listAllMenuButton(String rights) {
		SysMenu sysMenu=new SysMenu();
		Session session = SecurityUtils.getSubject().getSession();
		String USERNAME = session.getAttribute(PubConstants.SESSION_LOGNM).toString();	//获取当前登录者loginname
		Boolean isAdmin = "admin".equals(USERNAME);
		if (!isAdmin){//不是超级管理员
			sysMenu.setMenuType("0");//查询MenuType不等于0的菜单
		}
		List<SysMenu> sysMenuList=sysMenuDao.findAllListMenu(sysMenu);
		if(sysMenuList!=null && sysMenuList.size()>0){
			for(SysMenu menu: sysMenuList){
				menu.setHasMenu(RightsHelper.testRights(rights, menu.getMenuId()));
			}
		}

		return sysMenuList;
	}

    @Override
    public List<String> findmenuids() {
        return sysMenuDao.findmenuids();
    }

	@Override
	public List<SysMenu> findAllMenuList(String userRights) {
		List<SysMenu> menuAllList=sysMenuDao.findAllListMenu(new SysMenu());
		if(menuAllList!=null && menuAllList.size()>0){
			for(SysMenu menu: menuAllList){
				menu.setHasMenu(RightsHelper.testRights(userRights, menu.getMenuId()));
			}
		}
		return menuAllList;
	}

	@Override
	public List<SysMenu> findMenuList(String userRights, Session session) {
		List<SysMenu> sysMenuList=sysMenuDao.findAllMenuList();
		List<SysMenu> menuAllList=new ArrayList<SysMenu>();

		if (sysMenuList!=null && sysMenuList.size()>0){
			for (int i = 0; i < sysMenuList.size(); i++) {
				SysMenu sysMenu=sysMenuList.get(i);
				//via rights to judge menu
				sysMenu.setHasMenu(RightsHelper.testRights(userRights, sysMenu.getMenuId()));//菜单权限
				if (StringUtils.isBlank(sysMenu.getMenuIcon()) || !sysMenu.isHasMenu()){
					sysMenuList.remove(i);
					i=i-1;
				}
				if (sysMenu.isHasMenu()){
					menuAllList.add(sysMenu);
				}
			}
		}

		if(null == session.getAttribute(PubConstants.SESSION_allmenuList)) {
			session.setAttribute(PubConstants.SESSION_allmenuList, menuAllList);
		}else {
			menuAllList = (List<SysMenu>)session.getAttribute(PubConstants.SESSION_allmenuList);
		}
		return sysMenuList;
	}


}
