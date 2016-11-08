package com.ez.head.controller;


import com.ez.system.entity.SysUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by chenez on 2016/10/27 9:18.
 */
@Controller
@RequestMapping(value="/head/")
public class HeadController{
	
	/**
	 * 获取头部信息
	 */
	@RequestMapping(value="getUname")
	@ResponseBody
	public Map<String,Object> getUname(Model model, HttpServletRequest request) {
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysuser");
		String ez="My name is ChenEz";
		//model.addAttribute("sysUser",sysUser);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("sysUser",sysUser);
		map.put("ez",ez);
		return map;
	}

}
