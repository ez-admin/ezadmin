package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsImgInfoDao;
import com.ez.cms.entity.CmsImgInfo;
import com.ez.cms.service.CmsImgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("cmsImgInfoService")
@ServiceImplClassDescription(description = "图片管理")
public class CmsImgInfoServiceImpl extends BaseServiceImpl<CmsImgInfo> implements CmsImgInfoService {
	@Autowired
	private CmsImgInfoDao cmsImgInfoDao;


}
