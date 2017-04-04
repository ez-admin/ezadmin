
package com.ez.system.service;

import com.ez.system.entity.SysRight;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRightService{

	List<SysRight> query(Page<SysRight> page, SysRight sysRight);

	List<SysRight> queryAll(SysRight sysRight);

	void add(SysRight sysRight);
	
	void addAll(SysRight sysRight);
	
	void delete(String id);
	
	void modify(SysRight sysRight);
	
	SysRight getById(String id);
	
	List<SysRight> findAll();

	SysRight findByRid(String roleId);
}
