/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.modules.system.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysOption;
import com.ez.modules.system.entity.SysOptionList;
import com.ez.modules.system.service.SysOptionService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
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
	@RequiresPermissions("sysoption_add")
	@RequestMapping(value="add")
	@SystemLogController(description = "保存系统设置新增信息")
	@ResponseBody
	public Map<String, Object> add(SysOption sysoption,HttpServletResponse response){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", PubConstants.TRUE);
		sysOptionService.add(sysoption);
		return map;
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
	 * @param ids
	 * @return
	 */
	@RequiresPermissions("sysoption_delete")
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除系统设置信息")
	@ResponseBody
	public Map<String, Object> deleteById(String ids){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		sysOptionService.delete(ids);
		return map;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysoptionId
	 * @param typeKey
	 * @return
	 */
	@RequiresPermissions(value={"sysoption_view","sysoption_modify"},logical= Logical.OR)
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
	 * @param sysoption
	 * @return
	 */
	@RequiresPermissions("sysoption_modify")
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改系统设置的信息")
	@ResponseBody
	public Map<String, Object> updateSysOption(SysOption sysoption){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		sysOptionService.modify(sysoption);
		return map;
	}
	/**
	 * 更新修改的信息
	 * @param sysOptionList
	 * @return
	 */
	@RequiresPermissions("option_listmodify")
	@RequestMapping(value="updateList",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改系统设置列表的信息")
	@ResponseBody
	public Map<String, Object> updateList(SysOptionList sysOptionList){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		List<SysOption> optionList=sysOptionList.getSysOptionList();
		if (null != optionList && optionList.size()>0){
			for (SysOption sysOption :optionList){
				sysOptionService.modify(sysOption);
			}
		}
		return map;
	}
	/**
	 * 批量删除数据
	 * @param ids
	 * @return
	 */
	@RequiresPermissions("option_deleteall")
	@RequestMapping(value = "deleteAll")
	@SystemLogController(description = "批量删除系统设置信息")
	public Map<String, Object> deleteAll(String[] ids) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		for (String id : ids) {
			sysOptionService.delete(id);
		}
		return map;
	}
	
}

