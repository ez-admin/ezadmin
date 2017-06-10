package com.ez.cms.dao;

import com.ez.base.BaseDao;
import com.ez.cms.entity.CmsNode;
import com.ez.system.entity.SysOrg;

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
