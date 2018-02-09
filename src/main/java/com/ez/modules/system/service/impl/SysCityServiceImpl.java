package com.ez.modules.system.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.modules.system.entity.SysCity;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import jxl.Sheet;
import jxl.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ez.modules.system.*;
import com.ez.modules.system.dao.*;
import com.ez.modules.system.service.*;

import java.io.FileInputStream;
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

    @Override
	@SystemLogService(description = "新增上传数据异常")
	public void uploadadd(String filepath) {
		this.uploadpublic(filepath);
    }

	@Override
	@SystemLogService(description = "更新上传数据异常")
	public void uploadmodify(String filepath) {
		sysCityDao.deleteAll();
		this.uploadpublic(filepath);
	}

    @Override
    public List<SysCity> findSdBySdtCode(String parentId) {
        return sysCityDao.getChildrenCityById(parentId);
    }

    @SystemLogService(description = "保存上传数据异常")
    public void uploadpublic(String filepath){
		try {
			//导入已存在的Excel文件，获得只读的工作薄对象
			FileInputStream fileInputStream=new FileInputStream(filepath);
			Workbook workbook=Workbook.getWorkbook(fileInputStream);
			//获取第一张Sheet表
			Sheet sheet=workbook.getSheet(0);
			//获取总行数
			int rowNum=sheet.getRows();
			//从数据行开始迭代每一行
			for(int i=1;i<rowNum;i++){
				SysCity sysCity=new SysCity();
				//getCell(column,row)，表示取得指定列指定行的单元格（Cell）
				//getContents()获取单元格的内容，返回字符串数据。适用于字符型数据的单元格
				//使用实体类封装单元格数据
				sysCity.setId(Integer.parseInt(sheet.getCell(0, i).getContents()));
				sysCity.setName(sheet.getCell(1, i).getContents());
				sysCity.setParentId(Integer.parseInt(sheet.getCell(2, i).getContents()));
				sysCityDao.add(sysCity);
			}
			fileInputStream.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
