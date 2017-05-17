/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.system.controller;

import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysCity;
import com.ez.system.service.SysCityService;
import com.ez.util.Common;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/syscity/")
public class SysCityController {

	@Autowired
	private SysCityService sysCityService;


	/** binder用于bean属性的设置 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	/**
	 * 跳到列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到城市区域列表页面")
	public String list(Model model){
		return "/ez/system/syscity/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到城市区域新增页面")
	public String addUI(){
		return "/ez/system/syscity/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param syscity
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("syscity_add")
	@SystemLogController(description = "保存城市区域新增信息")
	public String add(SysCity syscity,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			sysCityService.add(syscity);
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询城市区域信息")
	public Map<String, Object> showlist(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.query(page, syscity);
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getParentcity",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到分页查询一级城市区域信息")
	public Map<String, Object> getParentcity(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getParentcity(page, syscity);
		if (!Common.isEmpty(syscity.getName())){
			list = sysCityService.query(page, syscity);
		}
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	/**
	 * post方式不分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getParentcityList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询一级城市区域信息")
	public Map<String, Object> getParentcityList(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getParentcityList(page,syscity);
		if (!Common.isEmpty(syscity.getName())){
			list = sysCityService.queryList(page,syscity);
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getChildrencity",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到分页查询下级城市区域信息")
	public Map<String, Object> getChildrencity(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getChildrenCity(page, syscity);
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	/**
	 * post方式不分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getChildrencityList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询下级城市区域信息")
	public Map<String, Object> getChildrencityList(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getChildrenCityList(page,syscity);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 根据id删除
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除城市区域信息")
	@RequiresPermissions("syscity_delete")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			sysCityService.deleteSubAll(ids);
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
	 * @param syscityId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改城市区域单条记录页面")
	public String getById(Model model,String syscityId,int typeKey){
		SysCity syscity = sysCityService.getById(syscityId);
		model.addAttribute("syscity", syscity);
		if(typeKey == 1){
			return "/ez/system/syscity/edit";
		}else if(typeKey == 2){
			return "/ez/system/syscity/addsub";
		}else{
			return "/ez/system/syscity/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param syscity
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("syscity_modify")
	@SystemLogController(description = "更新修改城市区域的信息")
	public String updateSysCity(Model model,SysCity syscity,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			sysCityService.modify(syscity);
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;		
	}

	/**
	 * 批量删除数据
	 * @param response
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	@RequiresPermissions("syscity_deleteall")
	@SystemLogController(description = "批量删除城市区域信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				sysCityService.delete(id);
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}

}

