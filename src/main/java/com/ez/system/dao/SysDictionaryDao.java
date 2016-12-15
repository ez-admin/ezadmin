package com.ez.system.dao;


import com.ez.base.BaseDao;
import com.ez.system.entity.SysDictionary;
import java.util.List;

public interface SysDictionaryDao extends BaseDao<SysDictionary> {

	List<SysDictionary> findSdBySdtCode(String code);
	List<SysDictionary> findSdBySdtCode2(SysDictionary newDic);
	List<SysDictionary> findKeyByCodeAndValue(SysDictionary sysDictionary);
	SysDictionary findByCode(String code);
	SysDictionary findByCodeAndValue(SysDictionary sysDictionary);
}
