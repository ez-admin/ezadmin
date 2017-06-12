package com.ez.cms.service.impl;

import com.ez.annotation.ServiceImplClassDescription;
import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.cms.dao.CmsInfoDao;
import com.ez.cms.dao.CmsInfoTagDao;
import com.ez.cms.dao.CmsTagDao;
import com.ez.cms.entity.CmsInfo;
import com.ez.cms.entity.CmsInfoTag;
import com.ez.cms.entity.CmsTag;
import com.ez.cms.service.CmsInfoService;
import com.ez.system.entity.SysUser;
import com.ez.util.DateUtil;
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
    @Autowired
    private CmsTagDao cmsTagDao;

    @Override
    public void addinfo(CmsInfo cmsinfo, HttpServletRequest request) {
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getSession().getAttribute(PubConstants.SESSION_SYSUSER);
        cmsinfo.setAuthor(sysUser.getUserno());
        cmsInfoDao.add(cmsinfo);
        addCmsInfoTags(cmsinfo, request);
    }

    @Override
    public List<CmsTag> getCmsInfoTags(String cmsinfoId) {
        List<CmsTag> cmsTags=cmsTagDao.findAll();
        List<CmsInfoTag> cmsInfoTags=cmsInfoTagDao.findById(cmsinfoId);

        if (null != cmsInfoTags && cmsInfoTags.size()>0){
            for (int i = 0; i <cmsInfoTags.size(); i++) {
                for (int j = 0; j < cmsTags.size(); j++) {
                    CmsTag cmsTag=cmsTags.get(j);
                    if (cmsInfoTags.get(i).getCmsTagId() == cmsTags.get(j).getCmsTagId()){
                        cmsTag.setTag(true);
                    }
                }
            }
        }
        return cmsTags;
    }

    @Override
    public void modifyInfo(CmsInfo cmsinfo, HttpServletRequest request) {
        cmsinfo.setCmsInfoInserttime(DateUtil.getNowDate());
        SysUser sysUser = (SysUser)SecurityUtils.getSubject().getSession().getAttribute(PubConstants.SESSION_SYSUSER);
        cmsinfo.setAuthor(sysUser.getUserno());
        cmsInfoDao.modify(cmsinfo);
        cmsInfoTagDao.delete(cmsinfo.getCmsInfoId().toString());
        addCmsInfoTags(cmsinfo, request);
    }

    /**
     * @auther chenez
     * @description 对每个文章添加标签
     * @date 2017/6/12  23:22
     * @param cmsinfo
     * @param request
     */
    public void addCmsInfoTags(CmsInfo cmsinfo, HttpServletRequest request){
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
}
