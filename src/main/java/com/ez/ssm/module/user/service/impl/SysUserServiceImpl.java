package com.ez.ssm.module.user.service.impl;


import com.ez.ssm.module.user.dao.SysUserDao;
import com.ez.ssm.module.user.pojo.SysUser;
import com.ez.ssm.module.user.service.SysUserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Service
public class SysUserServiceImpl implements SysUserService {
	
	@Resource
	private SysUserDao sysUserDao;
	
	
	@Override
	public SysUser saveAndUpdateSysUser(SysUser sysUser) {
		return sysUserDao.save(sysUser);
	}
	
	@Override
	public SysUser saveAndUpdateSysUserToTransactionalTest(SysUser sysUser) {
		SysUser save = sysUserDao.save(sysUser);
		if (save != null) {
			//如果插入成功，则模拟抛异常，异常的抛弃必须在 service 类中才有效果，不然不会回滚的
			throw new RuntimeException("抛出个运行时异常");
		}
		return null;
	}
	
	
	@Override
	public void deleteBySysUserId(Long sysUserId) {
		sysUserDao.deleteBySysUserId(sysUserId);
	}
	
	@Override
	public List<SysUser> findIsNotDeleteUserListToTestEhCache(String sysUserIsDelete) {
		return sysUserDao.findIsNotDeleteUserListToTestEhCache(sysUserIsDelete);
	}
	
	@Override
	public SysUser getById(Long id) {
		return sysUserDao.findOne(id);
	}
	
	@Override
	public SysUser findBySysUserId(Long sysUserId) {
		return sysUserDao.findBySysUserId(sysUserId);
	}
	
	@Override
	public SysUser findBySysUserLoginName(String sysUserLoginName) {
		return sysUserDao.findBySysUserLoginName(sysUserLoginName);
	}
	
	@Override
	public List<SysUser> findDistinctSysUserBySysUserLoginNameOrSysUserId(String sysUserLoginName, Long sysUserId) {
		return sysUserDao.findDistinctSysUserBySysUserLoginNameOrSysUserId(sysUserLoginName, sysUserId);
	}
	
	@Override
	public List<SysUser> findSysUserBySysUserLoginNameAndSysUserId(String SysUserLoginName, Long sysUserId) {
		return sysUserDao.findSysUserBySysUserLoginNameAndSysUserId(SysUserLoginName, sysUserId);
	}
	
	@Override
	public List<SysUser> findBySysUserIsDeleteOrderBySysUserIdAsc(String sysUserIsDelete) {
		return sysUserDao.findBySysUserIsDeleteOrderBySysUserIdAsc(sysUserIsDelete);
	}
	
	@Override
	public List<SysUser> findBySysUserIsDeleteOrderBySysUserIdDesc(String sysUserIsDelete) {
		return sysUserDao.findBySysUserIsDeleteOrderBySysUserIdDesc(sysUserIsDelete);
	}
	
	@Override
	public SysUser findTopBySysUserIsDeleteOrderBySysUserIdDesc(String sysUserIsDelete) {
		return sysUserDao.findTopBySysUserIsDeleteOrderBySysUserIdDesc(sysUserIsDelete);
	}
	
	@Override
	public Page<SysUser> findBySysUserIsDeleteOrderBySysUserIdDesc(String sysUserIsDelete, Pageable pageable) {
		return sysUserDao.findBySysUserIsDeleteOrderBySysUserIdDesc(sysUserIsDelete, pageable);
	}
	
	@Override
	public List<SysUser> findBySysUserIsDelete(String sysUserIsDelete, Pageable pageable) {
		return sysUserDao.findBySysUserIsDelete(sysUserIsDelete, pageable);
	}
	
	@Override
	public List<SysUser> findBySysUserIsDelete(String sysUserIsDelete, Sort sort) {
		return sysUserDao.findBySysUserIsDelete(sysUserIsDelete, sort);
	}
	
	@Override
	public List<SysUser> findTop2BySysUserIsDelete(String sysUserIsDelete, Sort sort) {
		return sysUserDao.findTop2BySysUserIsDelete(sysUserIsDelete, sort);
	}
	
	public void deleteInBatch(List<SysUser> sysUserList) {
		sysUserDao.deleteInBatch(sysUserList);
	}
	

}
