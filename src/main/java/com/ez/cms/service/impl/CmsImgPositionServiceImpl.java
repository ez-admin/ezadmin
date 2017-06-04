package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsImgPositionDao;
import com.ez.cms.entity.CmsImgPosition;
import com.ez.cms.service.CmsImgPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("cmsImgPositionService")
@ServiceImplClassDescription(description = "图片位置管理")
public class CmsImgPositionServiceImpl extends BaseServiceImpl<CmsImgPosition> implements CmsImgPositionService {
	@Autowired
	private CmsImgPositionDao cmsImgPositionDao;

	@Override
	public void modify(CmsImgPosition cmsImgPosition) {
		if (cmsImgPosition.getTag()==0){
			cmsImgPosition.setPositionType(0);
		}
		baseDao.modify(cmsImgPosition);
	}

    @Override
    public List<CmsImgPosition> getSdBySdtCode(String code) {
        return cmsImgPositionDao.getSdBySdtCode(code);
    }
}
