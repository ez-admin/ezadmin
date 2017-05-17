package com.ez.system.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.annotation.SystemLogService;
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
	@SystemLogService(description = "分页查询城市区域一级区域异常")
	public List<SysCity> getParentcity(Page<SysCity> page, SysCity syscity) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysCity> list=sysCityDao.getParentcity(syscity);
		return list;
	}

	@Override
	@SystemLogService(description = "分页查询城市区域子区域异常")
	public List<SysCity> getChildrenCity(Page<SysCity> page, SysCity syscity) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysCity> list=sysCityDao.getChildrenCity(syscity);
		return list;
	}

	@Override
	@SystemLogService(description = "不分页查询城市区域一级区域异常")
	public List<SysCity> getParentcityList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.getParentcity(syscity);
		return list;
	}

	@Override
	@SystemLogService(description = "不分页查询城市区域异常")
	public List<SysCity> queryList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.query(syscity);
		return list;
	}

	@Override
	@SystemLogService(description = "不分页查询城市区域子区域异常")
	public List<SysCity> getChildrenCityList(Page<SysCity> page,SysCity syscity) {
		PageHelper.orderBy(page.getOrderBy());
		List<SysCity> list=sysCityDao.getChildrenCity(syscity);
		return list;
	}

	@Override
	@SystemLogService(description = "删除城市区域所有子区域异常")
	public void deleteSubAll(String ids) {
		deleterecursion(ids);
	}

	public void deleterecursion(String id){
		List<SysCity> sysCityList=sysCityDao.getChildrenCityById(id);
		if (sysCityList!=null && sysCityList.size()>0){
			for (SysCity sysCity : sysCityList) {
				deleterecursion(sysCity.getId().toString());
			}
		}
		sysCityDao.delete(id);
	}
}
