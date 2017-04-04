package com.ez.system.service.impl;

import com.ez.annotation.SystemLogService;
import com.ez.system.dao.SysDictionaryDao;
import com.ez.system.entity.SysDictionary;
import com.ez.system.service.SysDictionaryService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysDictionaryService")
public class SysDictionaryServiceImpl implements SysDictionaryService {
	@Resource
	private SysDictionaryDao sysDictionaryDao;
	
	/**
	 * 分页查询
	 * @param page
	 * @param sysDictionary
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "分页查询字典名称异常")
	public List<SysDictionary> query(Page<SysDictionary> page, SysDictionary sysDictionary) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysDictionary> list = sysDictionaryDao.query(sysDictionary);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysDictionary
	 * @return List<SysDictionary>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "不分页查询字典名称异常")
	public List<SysDictionary> queryAll(SysDictionary sysDictionary) {
		List<SysDictionary> list = sysDictionaryDao.query(sysDictionary);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysDictionary
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "保存字典名称异常")
	public void add(SysDictionary sysDictionary) {
		sysDictionaryDao.add(sysDictionary);
	}
	
	/**
	 * 新增操作
	 * @param sysDictionary
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "新增字典名称异常")
	public void addAll(SysDictionary sysDictionary) {
		sysDictionaryDao.addAll(sysDictionary);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "删除字典名称异常")
	public void delete(String id) {
		sysDictionaryDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "根据id查找字典名称异常")
	public SysDictionary getById(String id) {
		return sysDictionaryDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysDictionary
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "修改字典名称异常")
	public void modify(SysDictionary sysDictionary) {
		sysDictionaryDao.modify(sysDictionary);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "查找所有字典名称异常")
	public List<SysDictionary> findAll() {
		return sysDictionaryDao.findAll();
	}

    @Override
	@SystemLogService(description = "查询数据字典异常")
    public List<SysDictionary> findSdBySdtCode(String code) {
		List<SysDictionary> list = sysDictionaryDao.findSdBySdtCode(code);
		return list;
    }

}
