package com.ez.modules.system.dao;

import com.ez.commons.base.BaseDao;
import com.ez.modules.system.entity.SysCity;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;


/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysCityDao extends BaseDao<SysCity>{

    List<SysCity> getParentcity(SysCity syscity) throws DataAccessException;

    List<SysCity> getChildrenCity(SysCity syscity) throws DataAccessException;

    List<SysCity> getChildrenCityById(@Param("id") String id) throws DataAccessException;

    void deleteAll() throws DataAccessException;

}
