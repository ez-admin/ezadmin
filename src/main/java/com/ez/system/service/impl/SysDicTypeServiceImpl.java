package com.ez.system.service.impl;


import com.ez.system.dao.SysDicTypeDao;
import com.ez.system.entity.SysDicType;
import com.ez.system.service.SysDicTypeService;
import com.ez.util.PageView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sysDicTypeService")
public class SysDicTypeServiceImpl implements SysDicTypeService {
	
	@Autowired
	private SysDicTypeDao sysDicTypeDao;

	@Override
	public PageView query(PageView pageView, SysDicType sysDicType) {
		List list = sysDicTypeDao.query(pageView, sysDicType);
		pageView.setRecords(list);
		return pageView;
	}

	@Override
	public void add(SysDicType sysDicType) {
		sysDicTypeDao.add(sysDicType);
	}

	@Override
	public SysDicType findByCode(String code) {
		SysDicType sysDicType = sysDicTypeDao.findByCode(code);
		return sysDicType;
	}

	@Override
	public void modify(SysDicType sysDicType) {
		sysDicTypeDao.modify(sysDicType);
	}
	//chenze--start
	@Override
	public List<SysDicType> findAll(){
		List list=sysDicTypeDao.findAll();
		return list;
	}
	//chenze--end
}
