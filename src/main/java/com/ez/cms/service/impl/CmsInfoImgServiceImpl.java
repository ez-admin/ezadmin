package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsInfoImgDao;
import com.ez.cms.entity.CmsInfoImg;
import com.ez.cms.service.CmsInfoImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("cmsImgInfoService")
@ServiceImplClassDescription(description = "图片管理")
public class CmsInfoImgServiceImpl extends BaseServiceImpl<CmsInfoImg> implements CmsInfoImgService {
	@Autowired
	private CmsInfoImgDao cmsIInfoImgDao;


}
