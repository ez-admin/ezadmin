package com.ez.cms.dao;

import com.ez.base.BaseDao;
import com.ez.cms.entity.CmsImgPosition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author chenez
 * @2017-06-03
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsImgPositionDao extends BaseDao<CmsImgPosition>{

    List<CmsImgPosition> getSdBySdtCode(@Param("positionId") String positionId);
}
