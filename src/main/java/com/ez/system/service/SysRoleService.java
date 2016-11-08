/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service;

import com.ez.system.entity.SysRole;
import com.ez.util.PageView;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRoleService{

	public PageView query(PageView pageView, SysRole sysRole);
	
	public List<SysRole> queryAll(SysRole sysRole);
	
	public void add(SysRole sysRole);
	
	public void addAll(SysRole sysRole);
	
	public void delete(String id);
	
	public void modify(SysRole sysRole);
	
	public SysRole getById(String id);
	
	public List<SysRole> findAll();
	
	
}
