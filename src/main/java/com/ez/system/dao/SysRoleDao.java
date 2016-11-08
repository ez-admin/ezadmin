/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysRole;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysRoleDao extends BaseDao<SysRole> {
	public List<SysRole> findAll() throws DataAccessException;


}
