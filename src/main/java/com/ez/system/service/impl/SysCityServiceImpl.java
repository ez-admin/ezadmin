package com.ez.system.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.system.entity.*;
import com.ez.system.dao.*;
import com.ez.system.service.*;

import java.util.List;

/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysCityService")
@ServiceImplClassDescription(description = "城市区域")
public class SysCityServiceImpl extends BaseServiceImpl<SysCity> implements SysCityService {
	@Autowired
	private SysCityDao sysCityDao;


	@Override
	public List<SysCity> getParentcity(Page<SysCity> page, SysCity syscity) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysCity> list=sysCityDao.getParentcity(syscity);
		return list;
	}

	@Override
	public List<SysCity> getChildrenCity(Page<SysCity> page, SysCity syscity) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysCity> list=sysCityDao.getChildrenCity(syscity);
		return list;
	}

	@Override
	public List<SysCity> getParentcityList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.getParentcity(syscity);
		return list;
	}

	@Override
	public List<SysCity> queryList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.query(syscity);
		return list;
	}

	@Override
	public List<SysCity> getChildrenCityList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.getChildrenCity(syscity);
		return list;
	}
}
