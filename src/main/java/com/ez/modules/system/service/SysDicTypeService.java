/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.service;

import com.ez.modules.system.entity.SysDicType;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysDicTypeService {

	List<SysDicType> query(Page<SysDicType> page, SysDicType sysDictype);

	List<SysDicType> queryAll(SysDicType sysDictype);

	void add(SysDicType sysDictype);
	
	void addAll(SysDicType sysDictype);
	
	void delete(String id);
	
	void modify(SysDicType sysDictype);
	
	SysDicType getById(String id);
	
	List<SysDicType> findAll();

	List<SysDicType> getSdBySdtCode(String code);

	SysDicType getByName(String name);
}
