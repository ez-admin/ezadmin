/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service;

import com.ez.system.entity.SysRightGl;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRightGlService{

	List<SysRightGl> query(Page<SysRightGl> page, SysRightGl sysRightGl);

	List<SysRightGl> queryAll(SysRightGl sysRightGl);

	void add(SysRightGl sysRightGl);
	
	void addAll(SysRightGl sysRightGl);
	
	void delete(String id);
	
	void modify(SysRightGl sysRightGl);
	
	SysRightGl getById(String id);
	
	List<SysRightGl> findAll();

	SysRightGl findByRid(String roleId);
}
