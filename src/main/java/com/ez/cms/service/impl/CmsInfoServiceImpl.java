package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsInfoDao;
import com.ez.cms.entity.CmsInfo;
import com.ez.cms.service.CmsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("cmsInfoService")
@ServiceImplClassDescription(description = "文章管理")
public class CmsInfoServiceImpl extends BaseServiceImpl<CmsInfo> implements CmsInfoService {
	@Autowired
	private CmsInfoDao cmsInfoDao;


}
