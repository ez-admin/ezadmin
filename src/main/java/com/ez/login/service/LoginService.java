package com.ez.login.service;

import com.ez.system.entity.SysUser;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	int checkUser(SysUser sysUser);
	void setSeesionCntnt(HttpServletRequest request, SysUser sysUser);


}
