package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysCity;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysCityDao extends BaseDao<SysCity>{

    List<SysCity> getParentcity(SysCity syscity);

    List<SysCity> getChildrenCity(SysCity syscity);

    List<SysCity> getChildrenCityById(@Param("id") String id);

    void deleteAll();
}
