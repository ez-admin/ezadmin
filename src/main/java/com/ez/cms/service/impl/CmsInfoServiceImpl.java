package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsInfoDao;
import com.ez.cms.dao.CmsInfoTagDao;
import com.ez.cms.entity.CmsInfo;
import com.ez.cms.entity.CmsInfoTag;
import com.ez.cms.entity.CmsTag;
import com.ez.cms.service.CmsInfoService;
import com.ez.system.entity.SysUser;
import com.ez.util.PubConstants;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Transactional
@Service("cmsInfoService")
@ServiceImplClassDescription(description = "文章管理")
public class CmsInfoServiceImpl extends BaseServiceImpl<CmsInfo> implements CmsInfoService {
	@Autowired
	private CmsInfoDao cmsInfoDao;
    @Autowired
    private CmsInfoTagDao cmsInfoTagDao;

    @Override
    public void addinfo(CmsInfo cmsinfo, HttpServletRequest request) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getSession().getAttribute(PubConstants.SESSION_SYSUSER);
        cmsinfo.setAuthor(sysUser.getUserno());
        cmsInfoDao.add(cmsinfo);
        String[] tagids=request.getParameterValues("cmstag");
        if (null !=tagids){
            for(String tagid:tagids){
                CmsInfoTag cmsInfoTag=new CmsInfoTag();
                cmsInfoTag.setCmsInfoId(cmsinfo.getCmsInfoId());
                cmsInfoTag.setCmsTagId(Integer.valueOf(tagid));
                cmsInfoTagDao.addAll(cmsInfoTag);
            }
        }
    }

    @Override
    public List<CmsInfoTag> getCmsInfoTags(String cmsinfoId) {
        List<CmsInfoTag> cmsInfoTags=cmsInfoTagDao.findAll();
        //todo 对应已经选择的标签如何展示 20170610
        return null;
    }
}
