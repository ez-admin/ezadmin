
package com.ez.modules.system.service.impl;

import com.ez.commons.util.FormatDateUtil;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.dao.SysLogDao;
import com.ez.modules.system.dao.SysUserDao;
import com.ez.modules.system.entity.SysLog;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysLogService;
import com.ez.modules.system.service.SysUserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

import static com.ez.commons.util.Common.toIpAddr;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysLogService")
public class SysLogServiceImpl implements SysLogService {
	@Resource
	private SysLogDao sysLogDao;
	@Autowired
	private SysUserDao sysUserDao;
	/**
	 * 分页查询
	 * @param page
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> query(Page<SysLog> page, SysLog sysLog) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysLog> list = sysLogDao.query(sysLog);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysLog
	 * @return List<SysLog>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> queryAll(SysLog sysLog) {
		List<SysLog> list = sysLogDao.query(sysLog);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(propagation= Propagation.NOT_SUPPORTED)
	public void add(SysLog sysLog) {
		 sysLogDao.add(sysLog);
	}
	
	/**
	 * 新增操作
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void addAll(SysLog sysLog) {
		sysLogDao.addAll(sysLog);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void delete(String id) {
		sysLogDao.delete(id);
	}
	
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public SysLog getById(String id) {
		return sysLogDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysLog
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	public void modify(SysLog sysLog) {
		sysLogDao.modify(sysLog);
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	public List<SysLog> findAll() {
		return sysLogDao.findAll();
	}

    @Override
    public void deleteThreeMonthBefore(String threeMonthBefore) {
		sysLogDao.deleteThreeMonthBefore(threeMonthBefore);
    }

    @Override
    public SysLog getByUseId(String userno) {
        return sysLogDao.getByUseId(userno);
    }

    @Override
    public SysLog loginSuccess(String ip, SysUser user) {
		String nowDate=FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss");
		//保存最近一次登陆时间
		user.setLoginip(ip);
		user.setLastlogin(nowDate);
		sysUserDao.modify(user);
		//保存日志
		SysLog sysLog=new SysLog();
		sysLog.setLogtype(PubConstants.LOGTYPE_NORMAL);
		sysLog.setRequestIp(ip);
		sysLog.setMehtoddescription("登陆成功");
		sysLog.setMethod("LoginController-->login");
		sysLog.setParams( user.getLognm());
		sysLog.setCreateDate(nowDate);
		sysLogDao.add(sysLog);
		return sysLog;
    }

	@Override
	public SysLog loginFailure(String ip,String username,AuthenticationException e) {
		String exceptionDetail="";
		if (e instanceof UnknownAccountException){
			exceptionDetail="用户名不存在";
		}else if (e instanceof IncorrectCredentialsException){
			exceptionDetail="密码不正确";
		}else if (e instanceof LockedAccountException){
			exceptionDetail="用户被锁定";
		}else {
			exceptionDetail="系统异常";
		}

		String nowDate=FormatDateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss");
		SysLog sysLog=new SysLog();
		sysLog.setLogtype(PubConstants.LOGTYPE_NORMAL);
		sysLog.setRequestIp(ip);
		sysLog.setMehtoddescription("登陆异常");
		sysLog.setExceptionDetail(exceptionDetail);
		sysLog.setMethod("LoginController-->login");
		sysLog.setParams( username );
		sysLog.setCreateDate(nowDate);
		sysLogDao.add(sysLog);
		return sysLog;
	}

}
