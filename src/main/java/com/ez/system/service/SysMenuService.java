
package com.ez.system.service;

import com.ez.system.entity.SysMenu;
import com.ez.util.PageView;

import java.util.List;
/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysMenuService{

	public PageView query(PageView pageView, SysMenu sysMenu);
	
	public List<SysMenu> queryAll(SysMenu sysMenu);
	
	public void add(SysMenu sysMenu);
	
	public void addAll(SysMenu sysMenu);
	
	public void delete(String id);
	
	public void modify(SysMenu sysMenu);
	
	public SysMenu getById(String id);
	
	public List<SysMenu> findAll();

	List<String> findParentIdList();

	List<SysMenu> findAllList();
}
