package com.ez.base.service.impl;

import com.ez.annotation.SystemLogService;
import com.ez.base.BaseDao;
import com.ez.base.service.BaseService;

import javax.annotation.Resource;

/**
 * Created by chenez on 2017/4/18.
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {
    @Resource
    protected BaseDao<T> baseDao;
    /**
     * 新增操作
     * @param t
     * @return
     */
    //@PreAuthorize("hasRole('ROLE_*')")
    @SystemLogService(description = "保存系统设置异常")
    public void add(T t) {
        baseDao.add(t);
    }

}
