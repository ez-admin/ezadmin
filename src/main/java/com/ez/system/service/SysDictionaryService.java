package com.ez.system.service;


import com.ez.system.entity.SysDictionary;
import com.ez.util.PageView;

import java.util.List;

public interface SysDictionaryService {

	public PageView query(PageView pageView, SysDictionary sysDictionary);
	public void add(SysDictionary sysDictionary);
	public List<SysDictionary> findSdBySdtCode(String code);
	public List<SysDictionary> findSdBySdtCode2(SysDictionary newDic);
	public List<SysDictionary> findKeyByCodeAndValue(SysDictionary sysDictionary);
	//chenze--start
		public SysDictionary findByCode(String code);
		public void modify(SysDictionary sysDictionary);
		public SysDictionary findByCodeAndValue(SysDictionary sysDictionary);
	//chenze--end
}
