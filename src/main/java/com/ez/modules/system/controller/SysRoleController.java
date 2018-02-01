/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */


package com.ez.modules.system.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.entity.SysRole;
import com.ez.modules.system.entity.SysUserRole;
import com.ez.modules.system.service.SysMenuService;
import com.ez.modules.system.service.SysRoleService;
import com.ez.modules.system.service.SysUserRoleService;
import com.ez.modules.system.service.SysUserService;
import com.ez.commons.util.RightsHelper;
import com.ez.commons.util.Tools;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysrole/")
public class SysRoleController extends BaseController {

	@Autowired
	private SysRoleService sysRoleService;

	@Autowired
	private SysMenuService sysMenuService;

	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysUserRoleService sysUserRoleService;

	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "获取角色管理列表页面")
	public String list(Model model){
		return "/ez/system/sysrole/list";
	}
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到角色管理新增页面")
	public String addUI(Model model){
		List<SysMenu> menuList = sysMenuService.listAllMenuButton(null);
		String json = JSON.toJSON(menuList).toString();
		json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("parentId", "pId").replaceAll("hasMenu", "checked");
		model.addAttribute("zTreeNodes",json);
		return "ez/system/sysrole/add";
	}
	
	/**
	 * 保存新增
	 * @param ids
	 * @param sysRole
	 * @return
	 */
	@RequiresPermissions("sysrole_add")
	@RequestMapping(value="add")
	@SystemLogController(description = "保存角色管理新增信息")
	@ResponseBody
	public Map<String, Object> add(String ids, SysRole sysRole){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", PubConstants.TRUE);
		//角色权限
		String rights="0";
		if (StringUtils.isNotEmpty(ids)){
			rights = RightsHelper.sumRights(Tools.str2StrArray(ids)).toString();
		}
		sysRole.setRights(rights);
		sysRoleService.add(sysRole);
		return map;
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
	 * 根据id删除
	 * @param ids
	 * @return
	 */
	@RequiresPermissions("sysrole_delete")
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除角色管理信息")
	@ResponseBody
	public Map<String, Object>  deleteById(String ids){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		List<SysUserRole> sysUserRoleList=sysUserRoleService.findByRoleid(ids);
		if (sysUserRoleList!=null && sysUserRoleList.size()>0){
			map.put("status",PubConstants.FALSE);
			map.put("message","该角色下仍有用户!");
		}else {
			sysRoleService.delete(ids);
		}
		return map;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysroleId
	 * @param typeKey
	 * @return
	 */
	@RequiresPermissions(value={"sysrole_view","sysrole_modify"},logical= Logical.OR)
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改角色管理单条记录页面")
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
	 * @param sysrole
	 * @return
	 */
	@RequiresPermissions("sysrole_modify")
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改角色管理的信息")
	@ResponseBody
	public Map<String, Object> updateSysRole(SysRole sysrole){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", PubConstants.TRUE);
		sysRoleService.modify(sysrole);
		return map;
		
	}
	
	
	/**
	 * 批量删除数据
	 * 
	 * @param ids 角色id
	 * @return
	 */
	@RequiresPermissions("sysrole_deleteall")
	@RequestMapping(value = "deleteAll")
	@SystemLogController(description = "批量删除角色管理的信息")
	@ResponseBody
	public Map<String, Object> deleteAll(String[] ids) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		JSONArray jsonArray = new JSONArray();
		//循环数组
		for (String id : ids) {
			JSONObject jsonObject = new JSONObject();
			String rolename=sysRoleService.getById(id).getRoleName();
			jsonObject.put("rolename",rolename);

			List<SysUserRole> sysUserRoleList=sysUserRoleService.findByRoleid(id);
			if (sysUserRoleList!=null && sysUserRoleList.size()>0){
				map.put("status",PubConstants.FALSE);
				jsonObject.put("status",PubConstants.FALSE);
				jsonObject.put("msg","删除失败——该角色下仍有用户，请将用户删除再来删除该角色！");
			}else {
				sysRoleService.delete(id);
				jsonObject.put("status",PubConstants.TRUE);
				jsonObject.put("msg","删除成功！");
			}
			jsonArray.add(jsonObject);
		}
		map.put("falsemsg",jsonArray.toString());
		return map;
	}

	/**
	 * 跳转到相应的增删改查页面
	 * @param model
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="roleButton")
	public String roleButton(Model model,String roleId){

		SysRole sysRole=sysRoleService.getById(roleId);
		List<SysMenu> menuList = sysMenuService.listAllMenuButton(sysRole.getRights());
		String json = JSON.toJSON(menuList).toString();
		json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("parentId", "pId").replaceAll("hasMenu", "checked");

		model.addAttribute("zTreeNodes",json);
		model.addAttribute("roleId",roleId);
		return "ez/system/sysrole/rolebutton";
	}
	/**
	 * 保存增删改查的权限信息
	 * @param ids
	 * @param sysRole
	 * @param
	 * @return
	 */
	@RequestMapping(value = "roleQxSave")
	public String roleQxSave(String ids, SysRole sysRole,HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"编辑成功！\"}";
		String rights="0";
		if (Tools.notEmpty(ids)){
			 rights = RightsHelper.sumRights(Tools.str2StrArray(ids)).toString();
		}
		sysRole.setRights(rights);
		sysRoleService.modify(sysRole);
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
		if (sysRoleList!=null && sysRoleList.size()>0){
			for(SysRole sd : sysRoleList) {
				if (selected!=null  && selected.equals(sd.getRoleId())){
					result+="<option value="+sd.getRoleId()+" selected >"+sd.getRoleName()+"</option>";
				}else {
					result+="<option value="+sd.getRoleId()+">"+sd.getRoleName()+"</option>";
				}
			}
		}

		WebTool.writeHtml(result, response);
		return null;
	}

}

