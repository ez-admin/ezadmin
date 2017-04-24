/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service.impl;

import com.ez.system.dao.SysRoleDao;
import com.ez.system.dao.SysUserDao;
import com.ez.system.entity.SysRole;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysRoleService;
import com.ez.util.PubConstants;
import com.ez.util.Tools;
import com.ez.util.UuidUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
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
	@Resource
	private SysUserDao sysUserDao;

	/**
	 * 分页查询
	 * @param page
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRole> query(Page<SysRole> page, SysRole sysRole) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		Session session = SecurityUtils.getSubject().getSession();
		String USERNAME = session.getAttribute(PubConstants.SESSION_LOGNM).toString();	//获取当前登录者loginname
		Boolean isAdmin = "admin".equals(USERNAME);
		if (!isAdmin){//不是超级管理员
			sysRole.setRoleType("0");//查询roleType不等于0的角色
		}
		List<SysRole> list = sysRoleDao.query(sysRole);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysRole
	 * @return List<SysRole>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRole> queryAll(SysRole sysRole) {
		Session session = SecurityUtils.getSubject().getSession();
		String USERNAME = session.getAttribute(PubConstants.SESSION_LOGNM).toString();	//获取当前登录者loginname
		Boolean isAdmin = "admin".equals(USERNAME);
		if (!isAdmin){//不是超级管理员
			sysRole.setRoleType("0");//查询roleType不等于0的角色
		}
		List<SysRole> list = sysRoleDao.query(sysRole);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysRole
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysRole sysRole) {
		String uuid= UuidUtil.get32UUID();
		sysRole.setRoleId(uuid);
		/*sysRole.setQxId(uuid);
		sysRole.setAddQx("1");
		sysRole.setDelQx("1");
		sysRole.setEditQx("1");
		sysRole.setChaQx("1");
		sysRole.setRights("1");*/
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
		if (Tools.notEmpty(sysRole.getRoleName())){
			SysUser sysUser=new SysUser();
			sysUser.setRlid(sysRole.getRoleId());
			sysUser.setRlnm(sysRole.getRoleName());
			sysUserDao.modifyRole(sysUser);
		}
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
