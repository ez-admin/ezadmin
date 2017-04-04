package com.ez.system.service;

import com.ez.system.entity.SysDictionary;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysDictionaryService{

	List<SysDictionary> query(Page<SysDictionary> page, SysDictionary sysDictionary);

	List<SysDictionary> queryAll(SysDictionary sysDictionary);

	void add(SysDictionary sysDictionary) ;
	
	void addAll(SysDictionary sysDictionary);
	
	void delete(String id);
	
	void modify(SysDictionary sysDictionary);
	
	SysDictionary getById(String id);
	
	List<SysDictionary> findAll();

    List<SysDictionary> findSdBySdtCode(String code);
}
