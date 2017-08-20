package com.ez.commons.base.service.impl;

import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.BaseDao;
import com.ez.commons.base.service.BaseService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by chenez on 2017/4/18.
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {
    /*以下是两种方法注入dao*/
    //method one
    /*private BaseDao<T> baseDao ;
    private Class<T> clazz ;
    public BaseServiceImpl() {
        ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
        clazz = (Class<T>) type.getActualTypeArguments()[0];
    }
    @Resource //注入dao
    public void setDao(BaseDao<T> baseDao) {
        this.baseDao = baseDao;
    }*/
    //method two
    @Autowired
    protected BaseDao<T> baseDao;
    /**
     * 新增操作
     * @param t
     * @return
     */
    @SystemLogService(description = "")
    public void add(T t) {
        baseDao.add(t);
    }
    /**
     * 批量新增
     * @param t
     * @return
     */
    @SystemLogService(description = "")
    public void addAll(T t) {
        baseDao.addAll(t);
    }
    /**
     * 删除操作
     * @param id
     * @return
     */
    @SystemLogService(description = "")
    public void delete(String id) {
        baseDao.delete(id);
    }
    /**
     * 修改实体类
     * @param t
     * @return
     */
    @SystemLogService(description = "")
    public void modify(T t) {
        baseDao.modify(t);
    }
    /**
     * 根据id查找实体类
     * @param id
     * @return
     */
    @SystemLogService(description = "")
    public T getById(String id) {
        return baseDao.getById(id);
    }
    /**
     * 分页查询
     * @param page
     * @param t
     * @return List<T>
     */
    @Transactional(readOnly=true)
    @SystemLogService(description = "")
    public List<T> query(Page<T> page, T t) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
        List<T> list = baseDao.query(t);
        return list;
    }

    /**
     * 不分页查询
     * @param t
     * @return List<T>
     */
    @Transactional(readOnly=true)
    @SystemLogService(description = "")
    public List<T> queryAll(T t) {
        List<T> list = baseDao.query(t);
        return list;
    }
    /**
     * 查找所有
     * @return
     */
    @Transactional(readOnly=true)
    @SystemLogService(description = "")
    public List<T> findAll() {
        return baseDao.findAll();
    }


}
