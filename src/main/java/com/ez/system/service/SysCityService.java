/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service;
import com.ez.base.service.BaseService;
import com.ez.system.entity.*;
import com.github.pagehelper.Page;

import java.util.List;


/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysCityService extends BaseService<SysCity> {
    List<SysCity> getParentcity(Page<SysCity> page, SysCity syscity);

    List<SysCity> getChildrenCity(Page<SysCity> page, SysCity syscity);

    List<SysCity> getParentcityList(Page<SysCity> page,SysCity syscity);

    List<SysCity> queryList(Page<SysCity> page,SysCity syscity);

    List<SysCity> getChildrenCityList(Page<SysCity> page,SysCity syscity);

    void deleteSubAll(String ids);
}
