/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.system.controller;

import com.ez.annotation.SystemLogController;
import com.ez.base.BaseController;
import com.ez.system.entity.SysOption;
import com.ez.system.entity.SysOptionList;
import com.ez.system.service.SysOptionService;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenez
 * @2017-04-18
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysoption/")
public class SysOptionController extends BaseController {

	@Autowired
	private SysOptionService sysOptionService;

	/**
	 * 跳到列表页面
	 * @param
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到系统设置列表页面")
	public String list(){
		return "/ez/system/sysoption/list";
	}

	/**
	 * 跳到列表页面
	 * @param
	 * @return
	 */
	@RequestMapping(value="listedit")
	@SystemLogController(description = "跳到系统设置修改列表页面")
	public String listedit(Model model){
		List<SysOption> optionList=sysOptionService.findAll();
		model.addAttribute("optionList",optionList);
		return "/ez/system/sysoption/listedit";
	}
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到系统设置新增页面")
	public String addUI(){
		return "/ez/system/sysoption/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param sysoption
	 * @return
	 */
	@RequestMapping(value="add")
	@SystemLogController(description = "保存系统设置新增信息")
	public String add(SysOption sysoption,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		sysOptionService.add(sysoption);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * post方式分页查询
	 * @param page
	 * @param sysoption
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询系统设置信息")
	public Map<String, Object> showlist(Page<SysOption> page,SysOption sysoption){
		List<SysOption> list = sysOptionService.query(page, sysoption);
		PageInfo<SysOption> pageInfo = new PageInfo<SysOption>(list);
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
	@SystemLogController(description = "删除系统设置信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1}";
		sysOptionService.delete(ids);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysoptionId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改系统设置单条记录页面")
	public String getById(Model model,String sysoptionId,Integer typeKey){
		SysOption sysoption = sysOptionService.getById(sysoptionId);
		model.addAttribute("sysoption", sysoption);
		if(typeKey == 1){
			return "/ez/system/sysoption/edit";
		}else if(typeKey == 2){
			return "/ez/system/sysoption/view";
		}else{
			return "/ez/system/sysoption/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysoption
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改系统设置的信息")
	public String updateSysOption(Model model,SysOption sysoption,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		sysOptionService.modify(sysoption);
		 WebTool.writeJson(result, response);
		 return null;		
	}
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysOptionList
	 * @return
	 */
	@RequestMapping(value="updateList",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改系统设置列表的信息")
	public String updateList(Model model, SysOptionList sysOptionList, HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		List<SysOption> optionList=sysOptionList.getSysOptionList();
		if (null != optionList && optionList.size()>0){
			for (SysOption sysOption :optionList){
				sysOptionService.modify(sysOption);
			}
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
	@SystemLogController(description = "批量删除系统设置信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1}";
		for (String id : ids) {
			sysOptionService.delete(id);
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
}

