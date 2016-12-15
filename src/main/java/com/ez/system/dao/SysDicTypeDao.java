package com.ez.system.dao;


import com.ez.base.BaseDao;
import com.ez.system.entity.SysDicType;

import java.util.List;

public interface SysDicTypeDao extends BaseDao<SysDicType> {
	SysDicType findByCode(String code);
	List findAll();
}
