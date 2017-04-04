package com.ez.system.controller;

import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysRoleService;
import com.ez.system.service.SysUserService;
import com.ez.util.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping(value="/ez/system/sysuser/")
public class SysUserController {

	String menuUrl = "/ez/system/sysuser/list.do"; //菜单地址(权限用)
	@Resource
	private SysUserService sysUserService;
	@Resource
	private SysRoleService sysRoleService;


	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list/{otype}")
	@SystemLogController(description = "获取系统用户列表页面")
	public String list(Model model,
					   @PathVariable("otype")  String otype){
		model.addAttribute("otype",otype);
		model.addAttribute(PubConstants.SESSION_QX,WebTool.getSessionQx());
		return "/ez/system/sysuser/list";
	}


	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model,String optype){
		model.addAttribute("optype",optype);
		return "ez/system/sysuser/add";
	}

	/**
	 * 保存新增
	 * @param model
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysUser sysuser,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
				String userno= WaterIdGener.getWaterId();
				String rolename=sysRoleService.getById(sysuser.getRlid()).getRoleName();
				sysuser.setUserno(userno);
				sysuser.setRlnm(rolename);
				if (!"1".equals(sysuser.getIsused())){
					sysuser.setIsused("0");
				}
				sysuser.setUptdate(FormatDateUtil.getFormatDate("yyyy-MM-dd"));
				sysUserService.add(sysuser);
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
	 * @param sysuser
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showlist(SysUser sysuser, Page<SysUser> page){
		List<SysUser> list = sysUserService.query(page, sysuser);
		PageInfo<SysUser> pageInfo = new PageInfo<SysUser>(list);
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
				sysUserService.delete(ids);
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
	 * @param userno
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String userno,int typeKey){
		SysUser sysuser = sysUserService.getById(userno);
		model.addAttribute("sysuser", sysuser);
		if(typeKey == 1){
			return "ez/system/sysuser/edit";
		}else if(typeKey == 2){
			return "ez/system/sysuser/view";
		}else{
			return "ez/system/sysuser/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysUser(Model model,SysUser sysuser,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
				if (!"1".equals(sysuser.getIsused())){
					sysuser.setIsused("0");
				}
				sysuser.setUptdate(FormatDateUtil.getFormatDate("yyyy-MM-dd"));
				sysUserService.modify(sysuser);
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
					sysUserService.delete(id);
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
	
	
}

