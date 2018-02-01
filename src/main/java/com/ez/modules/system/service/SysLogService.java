package com.ez.modules.system.service;

import com.ez.commons.base.service.BaseService;
import com.ez.modules.system.entity.SysLog;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.entity.SysUser;
import com.github.pagehelper.Page;
import org.apache.shiro.authc.AuthenticationException;

import java.util.Date;
import java.util.List;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysLogService extends BaseService<SysLog> {

    void deleteThreeMonthBefore(String threeMonthBefore);

    SysLog loginSuccess(String ip, SysUser user);

	SysLog loginFailure(String ip,String username,AuthenticationException e);

}
