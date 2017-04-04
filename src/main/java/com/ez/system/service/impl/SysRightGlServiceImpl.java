
package com.ez.system.service.impl;

import com.ez.system.dao.SysRightGlDao;
import com.ez.system.entity.SysRightGl;
import com.ez.system.service.SysRightGlService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysRightGlService")
public class SysRightGlServiceImpl implements SysRightGlService {
	@Resource
	private SysRightGlDao sysRightGlDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @param sysRightGl
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRightGl> query(Page<SysRightGl> page, SysRightGl sysRightGl) {
		PageHelper.startPage(page);
		List<SysRightGl> list = sysRightGlDao.query(sysRightGl);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysRightGl
	 * @return List<SysRightGl>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRightGl> queryAll(SysRightGl sysRightGl) {
		List<SysRightGl> list = sysRightGlDao.query(sysRightGl);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysRightGl
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysRightGl sysRightGl) {
		sysRightGlDao.add(sysRightGl);
	}
	
	/**
	 * 新增操作
	 * @param sysRightGl
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysRightGl sysRightGl) {
		sysRightGlDao.addAll(sysRightGl);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysRightGlDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysRightGl getById(String id) {
		return sysRightGlDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysRightGl
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysRightGl sysRightGl) {
		sysRightGlDao.modify(sysRightGl);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRightGl> findAll() {
		return sysRightGlDao.findAll();
	}

	@Override
	public SysRightGl findByRid(String roleId) {
		return sysRightGlDao.findByRid(roleId);
	}

}
