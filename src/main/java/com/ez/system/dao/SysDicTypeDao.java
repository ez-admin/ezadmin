/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysDicType;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysDicTypeDao extends BaseDao<SysDicType>{
	public List<SysDicType> findAll() throws DataAccessException;
	List<SysDicType> getSdBySdtCode(String code) throws DataAccessException;
    SysDicType getByName(String name) throws DataAccessException;
}
