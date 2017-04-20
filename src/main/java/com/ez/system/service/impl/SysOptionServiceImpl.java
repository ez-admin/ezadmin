/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.system.dao.SysOptionDao;
import com.ez.system.entity.SysOption;
import com.ez.system.service.SysOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.zip.DataFormatException;

/**
 * @author chenez
 * @2017-04-18
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysOptionService")
@ServiceImplClassDescription(description = "系统设置")
public class SysOptionServiceImpl extends BaseServiceImpl<SysOption> implements SysOptionService{
   //method one
   /* @Resource(name="sysOptionDao")
    public void setDao(BaseDao<SysOption> dao) {
        super.setDao(dao);
    }
    */
   //method two
    @Autowired
    private SysOptionDao sysOptionDao;


    @Override
    public void test() throws DataFormatException {
        //sysOptionDao.test();
    }
}
