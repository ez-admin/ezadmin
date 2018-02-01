package com.ez.modules.system.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.modules.system.dao.SysUserDao;
import com.ez.modules.system.dao.SysUserRoleDao;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysUserService;
import com.ez.commons.util.PubConstants;
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
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysUserService")
@ServiceImplClassDescription(description = "用户管理")
public class SysUserServiceImpl implements SysUserService {
	@Resource
	private SysUserDao sysUserDao;
	@Resource
	private SysUserRoleDao sysUserRoleDao;
	/**
	 * 分页查询
	 * @param page
	 * @param sysUser
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysUser> query(Page<SysUser> page, SysUser sysUser) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		Session session = SecurityUtils.getSubject().getSession();
		String USERNAME = session.getAttribute(PubConstants.SESSION_LOGNM).toString();	//获取当前登录者loginname
		Boolean isAdmin = "admin".equals(USERNAME);
		if (!isAdmin){//不是超级管理员
			sysUser.setRlid("1");//查询1开发者角色不等于0的角色
		}
		List<SysUser> list;
		if ("0".equals(sysUser.getDptno())){
			list = sysUserDao.findAll();
		}else {
			list = sysUserDao.query(sysUser);
		}
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysUser
	 * @return List<SysUser>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysUser> queryAll(SysUser sysUser) {
		List<SysUser> list = sysUserDao.query(sysUser);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysUser
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysUser sysUser) {
		sysUserDao.add(sysUser);
	}
	
	/**
	 * 新增操作
	 * @param sysUser
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysUser sysUser) {
		sysUserDao.addAll(sysUser);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysUserDao.delete(id);
		sysUserRoleDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysUser getById(String id) {
		return sysUserDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysUser
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysUser sysUser) {
		sysUserDao.modify(sysUser);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysUser> findAll() {
		return sysUserDao.findAll();
	}

	@Override
	public SysUser getByAll(SysUser sysUser) {
		return sysUserDao.getByAll(sysUser);
	}

    @Override
    public List<SysUser> listByRid(String ids) {
        return sysUserDao.listByRid(ids);
    }

    @Override
    public List<SysUser> listByDptno(String ids) {
        return sysUserDao.listByDptno(ids);
    }

    @Override
    public SysUser findByUsername(String lognm) {
        return sysUserDao.findByUsername(lognm);
    }


}
