
package com.ez.system.service;

import com.ez.system.entity.SysRight;
import com.ez.util.PageView;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysRightService{

	public PageView query(PageView pageView, SysRight sysRight);
	
	public List<SysRight> queryAll(SysRight sysRight);
	
	public void add(SysRight sysRight);
	
	public void addAll(SysRight sysRight);
	
	public void delete(String id);
	
	public void modify(SysRight sysRight);
	
	public SysRight getById(String id);
	
	public List<SysRight> findAll();


	SysRight findByRid(String roleId);
}
