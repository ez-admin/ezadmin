/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */


package com.ez.system.controller;

import com.alibaba.fastjson.JSON;
import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysMenu;
import com.ez.system.entity.SysRole;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysMenuService;
import com.ez.system.service.SysRoleService;
import com.ez.system.service.SysUserService;
import com.ez.util.*;
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
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysrole/")
public class SysRoleController {

	String menuUrl = "/ez/system/sysrole/list.do"; //菜单地址(权限用)
	@Resource
	private SysRoleService sysRoleService;

	@Resource
	private SysMenuService sysMenuService;

	@Resource
	private SysUserService sysUserService;
	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "获取角色管理列表页面")
	public String list(Model model){
		model.addAttribute(PubConstants.SESSION_QX,WebTool.getSessionQx());
		return "/ez/system/sysrole/list";
	}
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		return "ez/system/sysrole/add";
	}
	
	/**
	 * 保存新增
	 * @param model
	 * @param sysRole
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysRole sysRole,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
				sysRoleService.add(sysRole);
			}else {
				result="{\"msg\":\"fail\",\"message\":\"您无增加权限！\"}";
			}
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" + WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}

	/**
	 * post方式分页查询
	 * @param page
	 * @param sysrole
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "获取分页查询角色信息")
	public Map<String, Object> showlist(SysRole sysrole,Page<SysRole> page){
		List<SysRole> list = sysRoleService.query(page, sysrole);
		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	/**
	 * post方式不分页查询
	 * @param sysrole
	 * @return map
	 */
	@RequestMapping(value="showlisAll",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "获取不分页查询角色信息")
	public Map<String, Object> showlisAll(SysRole sysrole){
		List<SysRole> list = sysRoleService.queryAll(sysrole);
		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(list);
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
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			if(Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
				List<SysUser> sysUserList=sysUserService.listByRid(ids);
				if (sysUserList!=null && sysUserList.size()>0){
					result="{\"status\":0,\"message\":\"该角色下仍有用户！\"}";
				}else {
					sysRoleService.delete(ids);
				}
			}else {
				result="{\"status\":0,\"message\":\"您无删除权限！\"}";
			}
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
	 * @param sysroleId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String sysroleId,int typeKey){
		SysRole sysrole = sysRoleService.getById(sysroleId);
		model.addAttribute("sysrole", sysrole);
		if(typeKey == 1){
			return "ez/system/sysrole/edit";
		}else if(typeKey == 2){
			return "ez/system/sysrole/view";
		}else{
			return "ez/system/sysrole/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysrole
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysRole(Model model,SysRole sysrole,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
				sysRoleService.modify(sysrole);
			}else {
				result="{\"msg\":\"fail\",\"message\":\"您无修改权限！\"}";
			}
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
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String[] ids, Model model, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
				for (String id : ids) {
					List<SysUser> sysUserList=sysUserService.listByRid(id);
					if (sysUserList!=null && sysUserList.size()>0){
						result="{\"status\":0,\"message\":\"该角色下仍有用户，请将用户删除再来删除该角色！\"}";
					}else {
						sysRoleService.delete(id);
					}
				}
			}else {
				result="{\"status\":0,\"message\":\"您无删除权限！\"}";
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 跳转到相应的增删改查页面
	 * @param model
	 * @param roleId
	 * @param msg
	 * @return
	 */
	@RequestMapping(value="roleButton")
	public String roleButton(Model model,String roleId,String msg){
		List<SysMenu> menuList = sysMenuService.listAllMenuButton();
		SysRole sysRole=sysRoleService.getById(roleId);

		String roleRight = "";
		if("addQx".equals(msg)){
			roleRight = sysRole.getAddQx();
		}else if("delQx".equals(msg)){
			roleRight = sysRole.getDelQx();
		}else if("editQx".equals(msg)){
			roleRight = sysRole.getEditQx();
		}else if("chaQx".equals(msg)){
			roleRight = sysRole.getChaQx();
		}else if("rights".equals(msg)){
			roleRight =sysRole.getRights();
		}
		if(Tools.notEmpty(roleRight)){
			for(SysMenu menu : menuList){
				menu.setHasMenu(RightsHelper.testRights(roleRight, menu.getMenuId()));
				if(menu.isHasMenu()){
					List<SysMenu> subMenuList = menu.getMenuList();
					for(SysMenu sub : subMenuList){
						sub.setHasMenu(RightsHelper.testRights(roleRight, sub.getMenuId()));
						if (sub.isHasMenu()){
							List<SysMenu> subsubMenuList = sub.getMenuList();
							for (SysMenu subsub : subsubMenuList){
								subsub.setHasMenu(RightsHelper.testRights(roleRight, subsub.getMenuId()));
								if(subsub.isHasMenu()){
									List<SysMenu> subsubsubMenuList=subsub.getMenuList();
									if (subsubsubMenuList!=null && subsubsubMenuList.size()>0){
										for (SysMenu subsubsub : subsubsubMenuList){
											subsubsub.setHasMenu(RightsHelper.testRights(roleRight, subsubsub.getMenuId()));
										}
									}
								}
							}
						}
					}
				}
			}
		}
		String json = JSON.toJSON(menuList).toString();
		json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("menuList", "nodes").replaceAll("hasMenu", "checked");

		model.addAttribute("zTreeNodes",json);
		model.addAttribute("roleId",roleId);
		model.addAttribute("msg",msg);
		return "ez/system/sysrole/rolebutton";
	}
	/**
	 * 保存增删改查的权限信息
	 * @param ids
	 * @param sysRole
	 * @param msg
	 * @return
	 */
	@RequestMapping(value = "roleQxSave")
	public String roleQxSave(String ids, SysRole sysRole,String msg,HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"编辑成功！\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
				String rights="0";
				if (Tools.notEmpty(ids)){
					 rights = RightsHelper.sumRights(Tools.str2StrArray(ids)).toString();
				}
				if ("addQx".equals(msg)){
					sysRole.setAddQx(rights);
				}else if ("delQx".equals(msg)){
					sysRole.setDelQx(rights);
				}else if("editQx".equals(msg)){
					sysRole.setEditQx(rights);
				}else if("chaQx".equals(msg)){
					sysRole.setChaQx(rights);
				}else if("rights".equals(msg)){
					sysRole.setRights(rights);
				}
				sysRoleService.modify(sysRole);
			}else {
				result="{\"msg\":\"fail\",\"message\":\"您无修改权限！\"}";
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	/**
	 * 角色单选下拉框
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getSdBySdtCode")
	@ResponseBody
	public String getSdBySdtCode(String selected,HttpServletResponse response){
		//字典类型编码
		//List<SysDictype> sysDictypes = sysDictypeService.getSdBySdtCode(code);
		List<SysRole> sysRoleList = sysRoleService.findAll();
		String result="";
		for(SysRole sd : sysRoleList) {
			if (selected!=null  && selected.equals(sd.getRoleId())){
				result+="<option value="+sd.getRoleId()+" selected >"+sd.getRoleName()+"</option>";
			}else {
				result+="<option value="+sd.getRoleId()+">"+sd.getRoleName()+"</option>";
			}
		}
		WebTool.writeHtml(result, response);
		return null;
	}

}

