package com.ez.system.service;

import com.ez.system.entity.SysLog;
import com.ez.util.PageView;

import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysLogService{

	public PageView query(PageView pageView, SysLog sysLog);
	
	public List<SysLog> queryAll(SysLog sysLog);
	
	public void add(SysLog sysLog);
	
	public void addAll(SysLog sysLog);
	
	public void delete(String id);
	
	public void modify(SysLog sysLog);
	
	public SysLog getById(String id);
	
	public List<SysLog> findAll();
	
	
}
