package com.ez.modules.cms.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.modules.cms.dao.CmsTagDao;
import com.ez.modules.cms.entity.CmsTag;
import com.ez.modules.cms.service.CmsTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("cmsTagService")
@ServiceImplClassDescription(description = "标签表")
public class CmsTagServiceImpl extends BaseServiceImpl<CmsTag> implements CmsTagService {
	@Autowired
	private CmsTagDao cmsTagDao;


    @Override
    @SystemLogService(description = "标签数据字典异常")
    public List<CmsTag> findSdBySdtCode(String id) {
        return cmsTagDao.findSdBySdtCode(id);
    }
}
