package com.ez.client.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/ez/client/clientmng/")
public class ClientController {
	
/*	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/view/{userId}.html")
	public String showUser(Model model,@PathVariable("userId") Long userId) {
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
	}*/
	

	
	
}
