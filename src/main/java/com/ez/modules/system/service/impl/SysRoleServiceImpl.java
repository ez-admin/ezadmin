/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.modules.system.dao.SysMenuDao;
import com.ez.modules.system.dao.SysRoleDao;
import com.ez.modules.system.dao.SysUserDao;
import com.ez.modules.system.dao.SysUserRoleDao;
import com.ez.modules.system.entity.*;
import com.ez.modules.system.service.SysRoleService;
import com.ez.commons.util.Common;
import com.ez.commons.util.PubConstants;
import com.ez.commons.util.RightsHelper;
import com.ez.commons.util.UuidUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysRoleService")
@ServiceImplClassDescription(description = "角色管理")
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements SysRoleService {
	@Resource
	private SysRoleDao sysRoleDao;
	@Resource
	private SysUserDao sysUserDao;
	@Resource
	private SysUserRoleDao sysUserRoleDao;
	@Resource
	private SysMenuDao sysMenuDao;

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
			//sysRole.setRoleType("0");//查询roleType不等于0的角色
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
			//sysRole.setRoleType("0");//查询roleType不等于0的角色
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
	/*public void add(SysRole sysRole) {
		String uuid= UuidUtil.get32UUID();
		//sysRole.setRoleId(uuid);
		*//*sysRole.setQxId(uuid);
		sysRole.setAddQx("1");
		sysRole.setDelQx("1");
		sysRole.setEditQx("1");
		sysRole.setChaQx("1");
		sysRole.setRights("1");*//*
		sysRoleDao.add(sysRole);


	}*/
	
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
	 * 更改角色的权限rights时，由于用户设置了多角色，但每个用户设置了多个角色合并的rights；
	 * 因此，在更改角色rights时，应当一并更改该角色下的用户的rights
	 * @param sysRole
	 * @return
	 */
	/**
	 * Created by chenez on 2017/5/13 20:26
	 */
	public void modify(SysRole sysRole) {
		sysRoleDao.modify(sysRole);
		//查询拥有该角色的用户列表
		List<SysUserRole> sysUserRoleList=sysUserRoleDao.findByRoleid(sysRole.getRoleId().toString());
		if (null!=sysUserRoleList && sysUserRoleList.size()>0){
			for (int i = 0; i < sysUserRoleList.size(); i++) {
				List<SysMenu> allmenuList=new ArrayList<SysMenu>();
				//查询每个用户列表下的角色rights
				SysUserRole sysUserRole=sysUserRoleList.get(i);
				List<SysUserRole> sysUserRoles=sysUserRoleDao.findById(sysUserRole.getUserno());
				if (null!=sysUserRoles && sysUserRoles.size()>0){
					allmenuList=sysMenuDao.findAllList();
					for (int j = 0; j < sysUserRoles.size(); j++) {
						//获取每个角色rights
						String roleRights=sysRoleDao.getById(sysUserRoles.get(j).getRoleId()).getRights();
						for (SysMenu sysMenu : allmenuList) {
							Boolean ishasmenu= RightsHelper.testRights(roleRights, sysMenu.getMenuId());
							if (!sysMenu.isHasMenu()){
								sysMenu.setHasMenu(ishasmenu);
							}
						}
					}
				}
				String rights= Common.listMenutoRight(allmenuList);
				SysUser sysuser=new SysUser();
				sysuser.setUserno(sysUserRole.getUserno());
				sysuser.setOpright(rights);
				sysUserDao.modify(sysuser);
			}
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
