package com.ez.modules.system.service;

import com.ez.modules.system.entity.SysUser;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysUserService{

	List<SysUser> query(Page<SysUser> page, SysUser sysUser);

	List<SysUser> queryAll(SysUser sysUser);

	void add(SysUser sysUser);
	
	void addAll(SysUser sysUser);
	
	void delete(String id);
	
	void modify(SysUser sysUser);
	
	SysUser getById(String id);
	
	List<SysUser> findAll();

	SysUser getByAll(SysUser sysUser);

    List<SysUser> listByRid(String ids);

    List<SysUser> listByDptno(String ids);

	SysUser findByUsername(String lognm);

}
