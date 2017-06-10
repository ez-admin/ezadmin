package com.ez.cms.dao;

import com.ez.base.BaseDao;
import com.ez.cms.entity.CmsTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chenez
 * @2017-06-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsTagDao extends BaseDao<CmsTag>{

    List<CmsTag> findSdBySdtCode(@Param("id") String id);
}
