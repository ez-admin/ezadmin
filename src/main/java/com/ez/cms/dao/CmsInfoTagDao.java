package com.ez.cms.dao;

import com.ez.base.BaseDao;
import com.ez.cms.entity.CmsInfoTag;

import java.util.List;

/**
 * @author chenez
 * @2017-06-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsInfoTagDao extends BaseDao<CmsInfoTag>{

    List<CmsInfoTag> findById(String cmsinfoId);
}
