/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.modules.system.controller;

import com.alibaba.fastjson.JSON;
import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.json.TreeNode;
import com.ez.modules.system.entity.SysOrg;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.service.SysOrgService;
import com.ez.modules.system.service.SysUserService;
import com.ez.commons.util.WebTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author chenez
 * @2017-03-21
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysorg/")
public class SysOrgController extends BaseController {

	@Autowired
	private SysOrgService sysOrgService;
	@Autowired
	private SysUserService sysUserService;


	/**
	 * 跳到列表页面
	 * @param
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到组织结构表列表页面")
	public String list(){
		return "/ez/system/sysorg/list";
	}
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到组织结构表新增页面")
	public String addUI(){
		return "/ez/system/sysorg/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param sysorg
	 * @return
	 */
	@RequestMapping(value="add")
	@SystemLogController(description = "保存组织结构表新增信息")
	public String add(SysOrg sysorg,HttpServletResponse response){
		String result="";
		sysOrgService.add(sysorg);
		SysOrg org=sysOrgService.getById(sysorg.getOrgId()+"");
		result="{\"msg\":\"suc\",\"organization\":"+JSON.toJSONString(org)+"}";
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * post方式分页查询
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询组织结构表信息")
	public Map<String, Object> showlist(HttpServletRequest request){
		List<SysOrg> list=sysOrgService.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		if(list!=null && list.size()>0){
			List<TreeNode> treeNodes = new ArrayList<TreeNode>();
			for (SysOrg sysOrg : list) {
				TreeNode node=sysOrgService.convert(sysOrg, request,1);
				treeNodes.add(node);
			}
			map.put("treeNodes",treeNodes);
		}

		return map;
	}
	
	/**
	 * 根据id删除
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除组织结构表信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1}";
		List<SysUser> sysUserList=sysUserService.listByDptno(ids);
		if (sysUserList!=null && sysUserList.size()>0){
			result="{\"status\":0,\"message\":\"该组织部门下仍有用户！\"}";
		}else {
			sysOrgService.delete(ids);
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysorgId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改组织结构表单条记录页面")
	public String getById(Model model,String sysorgId,int typeKey){
		SysOrg sysorg = sysOrgService.getById(sysorgId);
		model.addAttribute("sysorg", sysorg);
		if(typeKey == 1){
			return "/ez/system/sysorg/edit";
		}else if(typeKey == 2){
			return "/ez/system/sysorg/view";
		}else{
			return "/ez/system/sysorg/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysorg
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改组织结构表的信息")
	public String updateSysOrg(Model model,SysOrg sysorg,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			sysOrgService.modify(sysorg);
			SysOrg org=sysOrgService.getById(sysorg.getOrgId()+"");
			result="{\"msg\":\"suc\",\"organization\":"+JSON.toJSONString(org)+"}";
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;		
	}

	/**
	 * 跳到选择负责人页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="queryuser")
	@SystemLogController(description = "跳到选择负责人列表页面")
	public String queryuser(Model model){
		model.addAttribute("otype","1");//系统后台操作员
		return "/ez/system/sysorg/queryuser";
	}
	@RequestMapping(value = "getcompanylist")
	public Map<String, Object> getcompanyList (HttpServletRequest request){
		List<SysOrg> sysOrgList = sysOrgService.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		List<TreeNode> treeNodes = new ArrayList<TreeNode>();
		for (SysOrg sysOrg : sysOrgList) {
			TreeNode node = sysOrgService.convert(sysOrg, request, 1);
			treeNodes.add(node);
		}
		map.put("treeNodes",treeNodes);
		return map;
	}

}

