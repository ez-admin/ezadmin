/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */


package com.ez.modules.system.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.modules.system.entity.SysLog;
import com.ez.modules.system.service.SysLogService;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/syslog/")
public class SysLogController extends BaseController {

	@Autowired
	private SysLogService sysLogService;


	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到系统日志列表页面")
	public String list(){
		return "ez/system/syslog/list";
	}

	
	/**
	 * post方式分页查询
	 * @param syslog
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> showlist(SysLog syslog,Page<SysLog> page,HttpServletRequest request){
		List<SysLog> list = sysLogService.query(page, syslog);
		PageInfo<SysLog> pageInfo = new PageInfo<SysLog>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	
}

