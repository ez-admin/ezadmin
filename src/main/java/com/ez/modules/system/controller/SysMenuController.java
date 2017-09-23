package com.ez.modules.system.controller;

import com.alibaba.fastjson.JSON;
import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.service.SysMenuService;
import com.ez.commons.util.Common;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysmenu/")
public class SysMenuController extends BaseController {

	@Autowired
	private SysMenuService sysMenuService;

	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到菜单管理列表页面")
	public String list(){
		return "ez/system/sysMenu/list";
	}
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到菜单管理新增页面")
	public String addUI(Model model){
		return "ez/system/sysMenu/add";
	}
    /**
     * 跳到新增子菜单页面
     * @return
     */
    @RequestMapping(value="addSub")
	@SystemLogController(description = "跳到菜单管理新增子菜单页面")
	public String addSub(Model model,String parentId){
		SysMenu sysMenu=sysMenuService.getById(parentId);
		model.addAttribute("sysMenu",sysMenu);
		return "ez/system/sysMenu/addSub";
    }
	/**
	 * 保存新增
	 * @param model
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="add")
	@SystemLogController(description = "保存菜单管理新增信息")
	public String add(Model model,SysMenu sysmenu,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		sysMenuService.add(sysmenu);
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * post方式分页查询
	 * @param pagemap
	 * @param sysmenu
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "获取分页查询菜单管理信息")
	public Map<String, Object> showlist(SysMenu sysmenu,
										@RequestBody Map pagemap){
		String direction=(String)pagemap.get("order");
		String sort=(String)pagemap.get("ordername");
		//设置分页参数
		Page<SysMenu> page = new Page<SysMenu>((Integer)pagemap.get("offset")/(Integer)pagemap.get("limit")+1, (Integer)pagemap.get("limit"));
		page.setOrderBy(sort + " " + direction);
		//设置查询条件

		List<SysMenu> list = sysMenuService.query(page, sysmenu);
		PageInfo<SysMenu> pageInfo = new PageInfo<SysMenu>(list);

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
	@SystemLogController(description = "删除菜单管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1}";
		sysMenuService.delete(ids);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysmenuId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "查询&修改单条菜单管理记录")
	public String getById(Model model,String sysmenuId,int typeKey){
		SysMenu sysMenu = sysMenuService.getById(sysmenuId);
		model.addAttribute("sysMenu", sysMenu);
		if(typeKey == 1){
			return "ez/system/sysMenu/edit";
		}else if(typeKey == 2){
			return "ez/system/sysMenu/view";
		}else{
			return "ez/system/sysMenu/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改的菜单管理信息")
	public String updateSysMenu(Model model,SysMenu sysmenu,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";
		sysMenuService.modify(sysmenu);
		 WebTool.writeJson(result, response);
		 return null;		
		
	}
	
	
	/**
	 * 批量删除数据
	 * 
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	@SystemLogController(description = "批量删除菜单管理信息")
	public String deleteAll(String[] ids, Model model, HttpServletResponse response) {
		String result = "{\"status\":1}";
		for (String id : ids) {
			sysMenuService.delete(id);
		}
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 不分页查询一级菜单可设置排序
	 * @param sysmenu
	 * @param page
	 * @return
	 */
	@RequestMapping(value="getParentMenu",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询一级菜单信息")
	public Map<String, Object> getParentMenu(Page<SysMenu> page,SysMenu sysmenu){
		List<SysMenu> list = sysMenuService.getParentMenu(page, sysmenu);
		if (!Common.isEmpty(sysmenu.getMenuName()) || null !=sysmenu.getMenuId()){
			list = sysMenuService.query(page, sysmenu);
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 不分页查询子菜单可设置排序
	 * @param sysmenu
	 * @param page
	 * @return
	 */
	@RequestMapping(value="getChildrenMenu",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询子菜单信息")
	public Map<String, Object> getChildrenMenu(Page<SysMenu> page,SysMenu sysmenu){
		List<SysMenu> list = sysMenuService.getChildrenMenu(page, sysmenu);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 不分页查询一级菜单
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="getParentMenuAll",method=RequestMethod.POST)
	@ResponseBody
	public Object getParentMenuAll(SysMenu sysmenu){
		List<SysMenu> list = sysMenuService.getParentMenuAll(sysmenu);
		return JSON.toJSON(list);
	}
	/**
	 * 不分页查询子菜单
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="getChildrenMenuAll",method=RequestMethod.POST)
	@ResponseBody
	public Object getChildrenMenuAll(SysMenu sysmenu){
		List<SysMenu> list = sysMenuService.getChildrenMenuAll(sysmenu);
		return JSON.toJSON(list);
	}

}

