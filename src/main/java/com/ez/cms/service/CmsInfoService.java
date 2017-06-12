package com.ez.cms.service;
import com.ez.base.service.BaseService;
import com.ez.cms.entity.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsInfoService extends BaseService<CmsInfo> {

    void addinfo(CmsInfo cmsinfo, HttpServletRequest request);

    List<CmsTag> getCmsInfoTags(String cmsinfoId);

    void modifyInfo(CmsInfo cmsinfo, HttpServletRequest request);
}
