/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service;

import com.ez.system.entity.SysRightGl;
import com.ez.util.PageView;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRightGlService{

	public PageView query(PageView pageView, SysRightGl sysRightGl);
	
	public List<SysRightGl> queryAll(SysRightGl sysRightGl);
	
	public void add(SysRightGl sysRightGl);
	
	public void addAll(SysRightGl sysRightGl);
	
	public void delete(String id);
	
	public void modify(SysRightGl sysRightGl);
	
	public SysRightGl getById(String id);
	
	public List<SysRightGl> findAll();


	SysRightGl findByRid(String roleId);
}
