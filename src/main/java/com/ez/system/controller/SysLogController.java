/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */


package com.ez.system.controller;

import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysLog;
import com.ez.system.service.SysLogService;
import com.ez.util.PubConstants;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
public class SysLogController {

	String menuUrl = "/ez/system/syslog/list.do"; //菜单地址(权限用)
	@Resource
	private SysLogService sysLogService;


	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到系统日志列表页面")
	public String list(Model model){
		model.addAttribute(PubConstants.SESSION_QX,WebTool.getSessionQx());
		return "ez/system/syslog/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		return "ez/system/syslog/add";
	}
	
	/**
	 * 保存新增
	 * @param model
	 * @param syslog
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysLog syslog,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";;
		try {
			sysLogService.add(syslog);
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" + WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * 保存新增--for 即时编辑
	 * @param model
	 * @return
	 */
	@RequestMapping(value="addnull")
	public String addnull(Model model,HttpServletResponse response,HttpServletRequest request){
		String result="";
		try {
			SysLog syslog = new SysLog();
			sysLogService.addAll(syslog);
			result="{\"id\":" + syslog.getId() + ",\"message\":\"新增成功！\"}";
		} catch (Exception e) {
			result="{\"id\":\"0\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * 分页查询跳转
	 * @param model
	 * @param syslog
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model, SysLog syslog, String pageNow, String pageSize){
		return "ez/system/syslog/list_list";
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
	
	/**
	 * 根据id删除
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result=null;
		try{
			sysLogService.delete(ids);
		    result="{\"status\":1,\"message\":\"删除成功！\"}";
		}catch(Exception e){
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param syslogId
	 * @param type
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String syslogId,int typeKey){
		SysLog syslog = sysLogService.getById(syslogId);
		model.addAttribute("syslog", syslog);
		if(typeKey == 1){
			return "ez/system/syslog/edit";
		}else if(typeKey == 2){
			return "ez/system/syslog/view";
		}else{
			return "ez/system/syslog/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param syslog
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysLog(Model model,SysLog syslog,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";;
		try {			
			sysLogService.modify(syslog);
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;		
		
	}
	
	
	/**
	 * 批量删除数据
	 * 
	 * @param model
	 * @param String
	 *            [] ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String[] ids, Model model, HttpServletResponse response) {
		String result = null;
		try {
			for (String id : ids) {
				sysLogService.delete(id);
			}
			result = "{\"status\":1,\"message\":\"删除成功！\"}";
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	
}

