/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.service.impl;


import com.ez.commons.annotation.SystemLogService;
import com.ez.modules.system.dao.SysDictionaryDao;
import com.ez.modules.system.dao.SysDicTypeDao;
import com.ez.modules.system.entity.SysDicType;
import com.ez.modules.system.service.SysDicTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysDictypeService")
public class SysDictypeServiceImpl implements SysDicTypeService {
	@Resource
	private SysDicTypeDao sysDictypeDao;
	@Resource
	private SysDictionaryDao sysDictionaryDao;
	/**
	 * 分页查询
	 * @param page
	 * @param sysDictype
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "分页查询字典类型异常")
	public List<SysDicType> query(Page<SysDicType> page, SysDicType sysDictype) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysDicType> list = sysDictypeDao.query(sysDictype);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param  sysDictype
	 * @return List<SysDictype>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "不分页查询字典类型异常")
	public List<SysDicType> queryAll(SysDicType sysDictype) {
		List<SysDicType> list = sysDictypeDao.query(sysDictype);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysDictype
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "新增字典类型异常")
	public void add(SysDicType sysDictype) {
		sysDictypeDao.add(sysDictype);
	}
	
	/**
	 * 新增操作
	 * @param sysDictype
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "新增所有字典类型异常")
	public void addAll(SysDicType sysDictype) {
		sysDictypeDao.addAll(sysDictype);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		/*String code=id;
		List<SysDictionary> sysDictionaryList=sysDictionaryDao.findSdBySdtCode(code);
		if (sysDictionaryList!=null && sysDictionaryList.size()>0){*/
		sysDictionaryDao.deleteByCode(id);
		sysDictypeDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysDicType getById(String id) {
		return sysDictypeDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysDictype
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysDicType sysDictype) {
		sysDictypeDao.modify(sysDictype);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysDicType> findAll() {
		return sysDictypeDao.findAll();
	}

    @Override
    public List<SysDicType> getSdBySdtCode(String code) {
        return sysDictypeDao.getSdBySdtCode(code);
    }

	@Override
	public SysDicType getByName(String name) {
		return sysDictypeDao.getByName(name);
	}

}
