/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysDictype;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysDictypeDao extends BaseDao<SysDictype>{
	public List<SysDictype> findAll() throws DataAccessException;
	List<SysDictype> getSdBySdtCode(String code) throws DataAccessException;
    SysDictype getByName(String name) throws DataAccessException;
}
