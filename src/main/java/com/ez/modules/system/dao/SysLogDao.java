
package com.ez.modules.system.dao;

import com.ez.commons.base.BaseDao;
import com.ez.modules.system.entity.SysLog;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysLogDao extends BaseDao<SysLog> {

    void deleteThreeMonthBefore(String threeMonthBefore);

    SysLog getByUseId(String userno);
}
