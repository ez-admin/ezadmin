package com.ez.modules.system.service;

import com.ez.modules.system.entity.SysLog;
import com.ez.modules.system.entity.SysUser;
import com.github.pagehelper.Page;
import org.apache.shiro.authc.AuthenticationException;

import java.util.Date;
import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysLogService{

	List<SysLog> query(Page<SysLog> page, SysLog sysLog);

	List<SysLog> queryAll(SysLog sysLog);

	void add(SysLog sysLog);
	
	void addAll(SysLog sysLog);
	
	void delete(String id);
	
	void modify(SysLog sysLog);
	
	SysLog getById(String id);
	
	List<SysLog> findAll();

    void deleteThreeMonthBefore(String threeMonthBefore);

	SysLog getByUseId(String userno);

    SysLog loginSuccess(String ip, SysUser user);

	SysLog loginFailure(String ip,String username,AuthenticationException e);
}
