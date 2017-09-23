
package com.ez.modules.system.service;

import com.ez.modules.login.entity.MenuTitle;
import com.ez.modules.system.entity.SysMenu;
import com.github.pagehelper.Page;
import org.apache.shiro.session.Session;

import java.util.List;
/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysMenuService{

	List<SysMenu> query(Page<SysMenu> page, SysMenu sysMenu);

	List<SysMenu> queryAll(SysMenu sysMenu);

	void add(SysMenu sysMenu);
	
	void addAll(SysMenu sysMenu);
	
	void delete(String id);
	
	void modify(SysMenu sysMenu);
	
	SysMenu getById(String id);
	
	List<SysMenu> findAll();

	List<SysMenu> findAllList();

    List<MenuTitle> findFisrtMenu();

    String getByParentId(String parentid);

    List<SysMenu> getParentMenu(Page<SysMenu> page, SysMenu sysmenu);

	List<SysMenu> getChildrenMenu(Page<SysMenu> page,SysMenu sysmenu);

    List<SysMenu> getParentMenuAll(SysMenu sysmenu);

	List<SysMenu> getChildrenMenuAll(SysMenu sysmenu);

	List<SysMenu> listAllMenu();

	List<SysMenu> listAllMenuButton(String rights);

    List<String> findmenuids();

	List<SysMenu> findAllMenuList(String userRights);

	List<SysMenu> findMenuList(String userRights, Session session);
}
