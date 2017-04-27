/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysOrg;

import java.util.List;

/**
 * @author chenez
 * @2017-03-21
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysOrgDao extends BaseDao<SysOrg>{

    List<SysOrg> findAllCompany();
}
