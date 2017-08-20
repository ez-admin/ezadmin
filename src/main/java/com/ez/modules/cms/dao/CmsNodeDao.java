package com.ez.modules.cms.dao;

import com.ez.commons.base.BaseDao;
import com.ez.modules.cms.entity.CmsNode;

import java.util.List;

/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsNodeDao extends BaseDao<CmsNode>{

    List<CmsNode> getParentcity(CmsNode cmsNode);

    List<CmsNode> getChildrenCityList(CmsNode cmsNode);

    List<CmsNode> findAllCmsNode();
}
