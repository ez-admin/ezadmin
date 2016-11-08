/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.service.impl;

import com.ez.system.dao.SysMenuDao;
import com.ez.system.entity.SysMenu;
import com.ez.system.service.SysMenuService;
import com.ez.util.PageView;
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
@Service("sysMenuService")
public class SysMenuServiceImpl implements SysMenuService {
	@Resource
	private SysMenuDao sysMenuDao;
	
	/**
	 * 分页查询
	 * @param pageView
	 * @param sysMenu
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public PageView query(PageView pageView, SysMenu sysMenu) {
		List<SysMenu> list = sysMenuDao.query(pageView, sysMenu);
		pageView.setRecords(list);
		return pageView;
	}
	
	/**
	 * 不分页查询
	 * @param sysMenu
	 * @return List<SysMenu>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysMenu> queryAll(SysMenu sysMenu) {
		List<SysMenu> list = sysMenuDao.queryAll(sysMenu);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysMenu
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void add(SysMenu sysMenu) {
		sysMenuDao.add(sysMenu);
	}
	
	/**
	 * 新增操作
	 * @param sysMenu
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysMenu sysMenu) {
		sysMenuDao.addAll(sysMenu);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysMenuDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysMenu getById(String id) {
		return sysMenuDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysMenu
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysMenu sysMenu) {
		sysMenuDao.modify(sysMenu);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysMenu> findAll() {
		List<SysMenu> rl = sysMenuDao.findAll();
		for(SysMenu menu : rl){
			List<SysMenu> subList = sysMenuDao.findAllByParentid(Integer.toString(menu.getMenuId()));
			menu.setMenuList(subList);
		}
		return rl;
	}

	@Override
	public List<String> findParentIdList() {
		return sysMenuDao.findParentIdList();
	}

	@Override
	public List<SysMenu> findAllList() {
		return sysMenuDao.findAllList();
	}


}
