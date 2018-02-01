package com.ez.modules.system.service;

import com.ez.commons.base.service.BaseService;
import com.ez.modules.system.entity.SysDictionary;

import java.util.List;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysDictionaryService extends BaseService<SysDictionary> {

    List<SysDictionary> findSdBySdtCode(String code);
}
