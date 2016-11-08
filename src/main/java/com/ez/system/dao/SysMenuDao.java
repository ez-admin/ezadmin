/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysMenu;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysMenuDao extends BaseDao<SysMenu> {
	public List<SysMenu> findAll() throws DataAccessException;

	List<SysMenu> findAllByParentid(String parentId) throws DataAccessException;

	List<String> findParentIdList() throws DataAccessException;

	List<SysMenu> findAllList() throws DataAccessException;
}
