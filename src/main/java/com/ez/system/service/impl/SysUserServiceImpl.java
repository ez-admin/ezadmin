package com.ez.system.service.impl;

import com.ez.system.dao.SysUserDao;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysUserService;
import com.ez.util.PageView;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SysUserServiceImpl implements SysUserService {
	@Resource
	private SysUserDao sysUserDao;
	
	/**
	 * 分页查询
	 * @param pageView
	 * @param sysUser
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public PageView query(PageView pageView, SysUser sysUser) {
		List<SysUser> list = sysUserDao.query(pageView, sysUser);
		pageView.setRecords(list);
		return pageView;
	}
	
	/**
	 * 不分页查询
	 * @param SysUser sysUser
	 * @return List<SysUser>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysUser> queryAll(SysUser sysUser) {
		List<SysUser> list = sysUserDao.queryAll(sysUser);
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

}
