/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.commons.util.PubConstants;
import com.ez.commons.util.RightsHelper;
import com.ez.modules.system.dao.SysMenuDao;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.service.SysMenuService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
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
@ServiceImplClassDescription(description = "菜单管理")
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenu> implements SysMenuService {
	@Resource
	private SysMenuDao sysMenuDao;

	/**
	 * 删除操作
	 * 删除自己及子菜单
	 * @param id
	 * @return
	 */
	@Override
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
		if (StringUtils.isNotEmpty(rights)){//判断该方法是否传参rights
			if(sysMenuList!=null && sysMenuList.size()>0){
				for(SysMenu menu: sysMenuList){
					menu.setHasMenu(RightsHelper.testRights(rights, menu.getMenuId()));
				}
			}
		}
		return sysMenuList;
	}

    @Override
    public List<String> findmenuids() {
        return sysMenuDao.findmenuids();
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
