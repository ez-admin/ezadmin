package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.annotation.SystemLogService;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsNodeDao;
import com.ez.cms.entity.CmsNode;
import com.ez.cms.service.CmsNodeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("cmsNodeService")
@ServiceImplClassDescription(description = "栏目管理")
public class CmsNodeServiceImpl extends BaseServiceImpl<CmsNode> implements CmsNodeService {
	@Autowired
	private CmsNodeDao cmsNodeDao;


    @Override
    @SystemLogService(description = "不分页查询一级栏目管理异常")
    public List<CmsNode> getParentcityList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.getParentcity(cmsNode);
        return list;
    }

    @Override
    @SystemLogService(description = "不分页查询全部栏目管理异常")
    public List<CmsNode> queryList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.query(cmsNode);
        return list;
    }

    @Override
    @SystemLogService(description = "不分页查询下级栏目管理异常")
    public List<CmsNode> getChildrenCityList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.getChildrenCityList(cmsNode);
        return list;
    }
}
