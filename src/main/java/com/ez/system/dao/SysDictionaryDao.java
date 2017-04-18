
package com.ez.system.dao;

import com.ez.base.BaseDao;
import com.ez.system.entity.SysDictionary;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysDictionaryDao extends BaseDao<SysDictionary> {

    List<SysDictionary> findSdBySdtCode(String code) throws DataAccessException;

    void deleteByCode(String id) throws DataAccessException;
}
