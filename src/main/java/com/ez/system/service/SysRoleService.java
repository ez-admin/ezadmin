/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service;

import com.ez.system.entity.SysRole;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRoleService{

	List<SysRole> query(Page<SysRole> page, SysRole sysRole);

	List<SysRole> queryAll(SysRole sysRole);

	void add(SysRole sysRole);
	
	void addAll(SysRole sysRole);
	
	void delete(String id);
	
	void modify(SysRole sysRole);
	
	SysRole getById(String id);
	
	List<SysRole> findAll();

}
