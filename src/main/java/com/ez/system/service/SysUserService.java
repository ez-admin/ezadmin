package com.ez.system.service;

import com.ez.system.entity.SysUser;
import com.ez.util.PageView;

import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysUserService{

	public PageView query(PageView pageView, SysUser sysUser);
	
	public List<SysUser> queryAll(SysUser sysUser);
	
	public void add(SysUser sysUser);
	
	public void addAll(SysUser sysUser);
	
	public void delete(String id);
	
	public void modify(SysUser sysUser);
	
	public SysUser getById(String id);
	
	public List<SysUser> findAll();


	SysUser getByAll(SysUser sysUser);
}
