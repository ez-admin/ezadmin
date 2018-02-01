/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.service.impl;


import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.commons.json.Entity;
import com.ez.modules.system.dao.SysDicTypeDao;
import com.ez.modules.system.dao.SysDictionaryDao;
import com.ez.modules.system.entity.SysDicType;
import com.ez.modules.system.service.SysDicTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysDictypeService")
@ServiceImplClassDescription(description = "字典类型管理")
public class SysDictypeServiceImpl extends BaseServiceImpl<SysDicType> implements SysDicTypeService {
	@Autowired
	private SysDicTypeDao sysDictypeDao;
	@Autowired
	private SysDictionaryDao sysDictionaryDao;


	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	@Override
	@SystemLogService(description = "删除字典类型异常")
	public void delete(String id) {
		sysDictionaryDao.deleteByCode(id);
		sysDictypeDao.delete(id);
	}

	@SystemLogService(description = "查询数据字典异常")
    public List<Entity> getSdBySdtCode(String code) {
		List<Entity> entityList=sysDictypeDao.getSdBySdtCode(code);
		return entityList;

	}

	@SystemLogService(description = "查询字典类型名称异常")
	public SysDicType getByName(String name) {
		return sysDictypeDao.getByName(name);
	}

}
