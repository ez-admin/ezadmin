
package com.ez.system.service.impl;

import com.ez.system.dao.SysRightDao;
import com.ez.system.entity.SysRight;
import com.ez.system.service.SysRightService;
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
@Service("sysRightService")
public class SysRightServiceImpl implements SysRightService {
	@Resource
	private SysRightDao sysRightDao;
	
	/**
	 * 分页查询
	 * @param pageView
	 * @param sysRight
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public PageView query(PageView pageView, SysRight sysRight) {
		List<SysRight> list = sysRightDao.query(pageView, sysRight);
		pageView.setRecords(list);
		return pageView;
	}
	
	/**
	 * 不分页查询
	 * @param SysRight sysRight
	 * @return List<SysRight>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRight> queryAll(SysRight sysRight) {
		List<SysRight> list = sysRightDao.queryAll(sysRight);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysRight
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysRight sysRight) {
		sysRightDao.add(sysRight);
	}
	
	/**
	 * 新增操作
	 * @param sysRight
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysRight sysRight) {
		sysRightDao.addAll(sysRight);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysRightDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysRight getById(String id) {
		return sysRightDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysRight
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysRight sysRight) {
		sysRightDao.modify(sysRight);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysRight> findAll() {
		return sysRightDao.findAll();
	}

	@Override
	public SysRight findByRid(String roleId) {
		return sysRightDao.findByRid(roleId);
	}

}
