package com.ez.system.service;


import com.ez.system.entity.SysDicType;
import com.ez.util.PageView;

import java.util.List;

public interface SysDicTypeService {

	public PageView query(PageView pageView, SysDicType sysDicType);
	public void add(SysDicType sysDicType);
	public SysDicType findByCode(String code);
	public void modify(SysDicType sysDicType);
	//chenze--start
	public List<SysDicType> findAll();
	//chenze--end
}
