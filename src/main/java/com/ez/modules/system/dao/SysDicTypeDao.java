/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.dao;

import com.ez.commons.base.BaseDao;
import com.ez.commons.json.Entity;
import com.ez.modules.system.entity.SysDicType;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysDicTypeDao extends BaseDao<SysDicType>{
	List<Entity> getSdBySdtCode(String code);
    SysDicType getByName(String name);
}
