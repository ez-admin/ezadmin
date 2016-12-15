package com.ez.system.service.impl;


import com.ez.system.dao.SysDictionaryDao;
import com.ez.system.entity.SysDictionary;
import com.ez.system.service.SysDictionaryService;
import com.ez.util.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sysDictionaryService")
public class SysDictionaryServiceImpl implements SysDictionaryService {
	
	@Autowired
	private SysDictionaryDao sysDictionaryDao;

	@Override
	public PageView query(PageView pageView, SysDictionary sysDictionary) {
		List<SysDictionary> list = sysDictionaryDao.query(pageView, sysDictionary);
		pageView.setRecords(list);
		return pageView;
	}

	@Override
	public void add(SysDictionary sysDictionary) {
		sysDictionaryDao.add(sysDictionary);
	}

	@Override
	public List<SysDictionary> findSdBySdtCode(String code) {
		List<SysDictionary> list = sysDictionaryDao.findSdBySdtCode(code);
		return list;
	}

	@Override
	public List<SysDictionary> findSdBySdtCode2(SysDictionary newDic) {
		List<SysDictionary> list = sysDictionaryDao.findSdBySdtCode2(newDic);
		return list;
	}
	
	@Override
	public List<SysDictionary> findKeyByCodeAndValue(SysDictionary sysDictionary) {
		List<SysDictionary> list = sysDictionaryDao.findKeyByCodeAndValue(sysDictionary);
		return list;
	}
	//chenze--start
		@Override
		public SysDictionary findByCode(String code) {
			SysDictionary sysDictionary = sysDictionaryDao.findByCode(code);
			return sysDictionary;
		}
	
		@Override
		public void modify(SysDictionary sysDictionary) {
			sysDictionaryDao.modify(sysDictionary);
		}

		@Override
		public SysDictionary findByCodeAndValue(SysDictionary sysDictionary) {
			//访问数据库查询code和value
			return sysDictionaryDao.findByCodeAndValue(sysDictionary);
		}
	//chenze--end
		
}
