/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service.impl;

import com.ez.system.dao.SysRoleDao;
import com.ez.system.entity.SysRole;
import com.ez.system.service.SysRoleService;
import com.ez.util.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysRoleService")
public class SysRoleServiceImpl implements SysRoleService {
	@Resource
	private SysRoleDao sysRoleDao;
	
	/**
	 * 分页查询
	 * @param pageView
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public PageView query(PageView pageView, SysRole sysRole) {
		List<SysRole> list = sysRoleDao.query(pageView, sysRole);
		pageView.setRecords(list);
		return pageView;
	}
	
	/**
	 * 不分页查询
	 * @param SysRole sysRole
	 * @return List<SysRole>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRole> queryAll(SysRole sysRole) {
		List<SysRole> list = sysRoleDao.queryAll(sysRole);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysRole sysRole) {
		sysRoleDao.add(sysRole);
	}
	
	/**
	 * 新增操作
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysRole sysRole) {
		sysRoleDao.addAll(sysRole);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysRoleDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysRole getById(String id) {
		return sysRoleDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysRole sysRole) {
		sysRoleDao.modify(sysRole);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRole> findAll() {
		return sysRoleDao.findAll();
	}
	
}
