/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service.impl;

import com.ez.annotation.SystemLogService;
import com.ez.system.dao.SysOptionDao;
import com.ez.system.entity.SysOption;
import com.ez.system.service.SysOptionService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author chenez
 * @2017-04-18
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysOptionService")
public class SysOptionServiceImpl implements SysOptionService {
	@Resource
	private SysOptionDao sysOptionDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @param sysOption
	 * @return List<SysOption>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "分页查询系统设置异常")
	public List<SysOption> query(Page<SysOption> page, SysOption sysOption) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysOption> list = sysOptionDao.query(sysOption);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysOption
	 * @return List<SysOption>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "不分页查询系统设置异常")
	public List<SysOption> queryAll(SysOption sysOption) {
		List<SysOption> list = sysOptionDao.query(sysOption);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysOption
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "保存系统设置异常")
	public void add(SysOption sysOption) {
		sysOptionDao.add(sysOption);
	}
	
	/**
	 * 新增操作
	 * @param sysOption
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "保存系统设置异常")
	public void addAll(SysOption sysOption) {
		sysOptionDao.addAll(sysOption);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "删除系统设置异常")
	public void delete(String id) {
		sysOptionDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "根据id查找系统设置异常")
	public SysOption getById(String id) {
		return sysOptionDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysOption
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*
	@SystemLogService(description = "修改系统设置异常")
	public void modify(SysOption sysOption) {
		sysOptionDao.modify(sysOption);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "查找所有系统设置异常")
	public List<SysOption> findAll() {
		return sysOptionDao.findAll();
	}

}
