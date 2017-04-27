/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service;

import com.ez.json.TreeNode;
import com.ez.system.entity.SysOrg;
import com.github.pagehelper.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @author chenez
 * @2017-03-21
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysOrgService{

	List<SysOrg> query(Page<SysOrg> page, SysOrg sysOrg);

	List<SysOrg> queryAll(SysOrg sysOrg);
	
	void add(SysOrg sysOrg);
	
	void addAll(SysOrg sysOrg);
	
	void delete(String id);
	
	void modify(SysOrg sysOrg);
	
	SysOrg getById(String id);
	
	List<SysOrg> findAll();
	//组装TreeNode
	TreeNode convert(SysOrg sysOrg, HttpServletRequest request, int type);


	String findAllCompany(String selected);
	String findAllDpt(String selected);
}
