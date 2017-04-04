
package com.ez.system.service.impl;

import com.ez.system.dao.SysLogDao;
import com.ez.system.entity.SysLog;
import com.ez.system.service.SysLogService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
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
@Service("sysLogService")
public class SysLogServiceImpl implements SysLogService {
	@Resource
	private SysLogDao sysLogDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> query(Page<SysLog> page, SysLog sysLog) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysLog> list = sysLogDao.query(sysLog);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysLog
	 * @return List<SysLog>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> queryAll(SysLog sysLog) {
		List<SysLog> list = sysLogDao.query(sysLog);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(propagation= Propagation.NOT_SUPPORTED)
	public void add(SysLog sysLog) {
		sysLogDao.add(sysLog);
	}
	
	/**
	 * 新增操作
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysLog sysLog) {
		sysLogDao.addAll(sysLog);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysLogDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysLog getById(String id) {
		return sysLogDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysLog sysLog) {
		sysLogDao.modify(sysLog);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> findAll() {
		return sysLogDao.findAll();
	}
	
}
