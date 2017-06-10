package com.ez.cms.service;
import com.ez.base.service.BaseService;
import com.ez.cms.entity.*;
import com.github.pagehelper.Page;

import java.util.List;


/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsNodeService extends BaseService<CmsNode> {
    List<CmsNode> getParentcityList(Page<CmsNode> page, CmsNode cmsNode);

    List<CmsNode> queryList(Page<CmsNode> page, CmsNode cmsNode);

    List<CmsNode> getChildrenCityList(Page<CmsNode> page, CmsNode cmsNode);

    String findAllCmsNode(String selected);
}
