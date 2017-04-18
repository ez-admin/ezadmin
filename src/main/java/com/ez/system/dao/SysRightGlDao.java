
package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysRightGl;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysRightGlDao extends BaseDao<SysRightGl>{
	SysRightGl findByRid(String roleId) throws DataAccessException;
}
