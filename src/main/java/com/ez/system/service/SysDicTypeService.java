/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service;

import com.ez.system.entity.SysDictype;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysDictypeService{

	List<SysDictype> query(Page<SysDictype> page, SysDictype sysDictype);

	List<SysDictype> queryAll(SysDictype sysDictype);

	void add(SysDictype sysDictype);
	
	void addAll(SysDictype sysDictype);
	
	void delete(String id);
	
	void modify(SysDictype sysDictype);
	
	SysDictype getById(String id);
	
	List<SysDictype> findAll();

	List<SysDictype> getSdBySdtCode(String code);

	SysDictype getByName(String name);
}
