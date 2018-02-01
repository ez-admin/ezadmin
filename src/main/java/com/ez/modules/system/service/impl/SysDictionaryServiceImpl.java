package com.ez.modules.system.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.modules.system.dao.SysDictionaryDao;
import com.ez.modules.system.entity.SysDictionary;
import com.ez.modules.system.service.SysDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysDictionaryService")
@ServiceImplClassDescription(description = "字典名称管理")
public class SysDictionaryServiceImpl extends BaseServiceImpl<SysDictionary> implements SysDictionaryService {
	@Autowired
	private SysDictionaryDao sysDictionaryDao;

    @Override
	@SystemLogService(description = "查询字典名称异常")
    public List<SysDictionary> findSdBySdtCode(String code) {
		List<SysDictionary> list = sysDictionaryDao.findSdBySdtCode(code);
		return list;
    }

}
