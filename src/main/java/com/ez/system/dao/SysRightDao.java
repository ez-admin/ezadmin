package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysRight;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysRightDao extends BaseDao<SysRight> {
	SysRight findByRid(String roleId) throws DataAccessException;
}
