package com.ez.ssm.module.user.controller;


import com.ez.ssm.module.user.pojo.SysUser;
import com.ez.ssm.module.user.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sysUserController")
public class SysUserController {
	
	private static final Logger LOG = LoggerFactory.getLogger(SysUserController.class);
	
	@Resource
	private SysUserService sysUserService;
	
	@RequestMapping("/showUserToJspById/{userId}")
	public String showUser(Model model, @PathVariable("userId") Long userId) {
		SysUser user = sysUserService.getById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	
	@RequestMapping("/showUserToJSONById/{userId}")
	@ResponseBody
	public SysUser showUser(@PathVariable("userId") Long userId) {
		SysUser user = sysUserService.getById(userId);
		return user;
	}
	
	
	@RequestMapping("/test-logback")
	@ResponseBody
	public Date testLogback() {
		LOG.trace("-----------------------------------trace");
		LOG.debug("-----------------------------------debug");
		LOG.info("-----------------------------------info");
		LOG.warn("-----------------------------------warn");
		LOG.error("-----------------------------------error");
		return new Date();
	}
	
	@RequestMapping(value = "/save-user", method = RequestMethod.POST)
	@ResponseBody
	public SysUser saveUser(SysUser sysUser) {
		if (sysUser != null) {
			sysUser.setSysUserRegisterDatetime(new Date());
			return sysUserService.saveAndUpdateSysUser(sysUser);
		}
		return null;
	}
	
	@RequestMapping("/test-ehcache")
	@ResponseBody
	public List<SysUser> findEhcache() {
		//使用缓存之后，调用这个方法，第一次调用的时候控制台有输出 sql 语句，后面都没有了
		return sysUserService.findIsNotDeleteUserListToTestEhCache("N");
	}
	
	@RequestMapping("/test-no-ehcache/{userId}")
	@ResponseBody
	public SysUser findNoEhcache(@PathVariable("userId") Long userId) {
		//没有使用缓存，无论何时调用这个方法，控制台都会输出 sql 语句
		SysUser user = sysUserService.findBySysUserId(userId);
		return user;
	}
	
	
}
