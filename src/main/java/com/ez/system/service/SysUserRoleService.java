/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service;

import com.ez.base.service.BaseService;
import com.ez.system.entity.SysUserRole;

import java.util.List;


/**
 * @author chenez
 * @2017-04-29
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysUserRoleService extends BaseService<SysUserRole> {
    List<SysUserRole> findById(String userno);

    void assignrole(String[] roleIds, SysUserRole sysUserRole);

    List<SysUserRole> findByRoleid(String ids);
}
