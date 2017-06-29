package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsInfoVideoDao;
import com.ez.cms.entity.CmsInfoVideo;
import com.ez.cms.service.CmsInfoVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("cmsInfoVideoService")
@ServiceImplClassDescription(description = "视频管理")
public class CmsInfoVideoServiceImpl extends BaseServiceImpl<CmsInfoVideo> implements CmsInfoVideoService {
	@Autowired
	private CmsInfoVideoDao cmsInfoVideoDao;


}
