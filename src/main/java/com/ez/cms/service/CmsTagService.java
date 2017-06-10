package com.ez.cms.service;
import com.ez.base.service.BaseService;
import com.ez.cms.entity.*;

import java.util.List;


/**
 * @author chenez
 * @2017-06-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface CmsTagService extends BaseService<CmsTag> {
    List<CmsTag> findSdBySdtCode(String id);
}
