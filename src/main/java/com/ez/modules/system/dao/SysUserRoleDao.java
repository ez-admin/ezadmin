/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.dao;

import com.ez.commons.base.BaseDao;
import com.ez.modules.system.entity.SysUserRole;

import java.util.List;

/**
 * @author chenez
 * @2017-04-29
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysUserRoleDao extends BaseDao<SysUserRole>{

    List<SysUserRole> findById(String userno);

    List<SysUserRole> findByRoleid(String ids);
}
