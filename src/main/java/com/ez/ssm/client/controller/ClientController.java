package com.ez.ssm.client.controller;


import com.ez.ssm.module.user.pojo.SysUser;
import com.ez.ssm.module.user.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/ez/client/clientmng/")
public class ClientController {
	
	//private static Logger logger = Logger.getLogger(ClientController.class);
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/view/{userId}")
	public String showUser(Model model,@PathVariable("userId")Long userId) {
		SysUser user = sysUserService.getById(userId);
		model.addAttribute("user", user);
		System.out.println("user = " + user.toString());
		return "ez/client/showUser";
	}
	
	@RequestMapping("/showUserToJSONById/{userId}")
	@ResponseBody
	public SysUser showUser(@PathVariable("userId") Long userId) {
		SysUser user = sysUserService.getById(userId);
		return user;
	}
	

	
	
}
