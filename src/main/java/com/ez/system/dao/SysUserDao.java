/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysUser;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysUserDao extends BaseDao<SysUser> {
	SysUser getByAll(SysUser sysUser) throws DataAccessException;
	int count(SysUser user) throws DataAccessException;

	int checkpwd(SysUser sysUser) throws DataAccessException;

    List<SysUser> listByRid(String ids) throws DataAccessException;


	List<SysUser> listByDptno(String ids) throws DataAccessException;
}
