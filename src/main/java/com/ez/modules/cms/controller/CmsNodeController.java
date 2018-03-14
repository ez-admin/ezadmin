/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.modules.cms.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.modules.cms.entity.CmsNode;
import com.ez.modules.cms.service.CmsNodeService;
import com.ez.commons.util.Common;
import com.ez.commons.util.DateUtil;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
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
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsnode/")
public class CmsNodeController extends BaseController {

	@Autowired
	private CmsNodeService cmsNodeService;

	/**
	 * 跳到列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到栏目管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsnode/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI.do")
	@SystemLogController(description = "跳到栏目管理新增页面")
	public String addUI(){
		return "/ez/cms/cmsnode/add";
	}
	
	/**
	 * 保存新增
	 * @param cmsnode
	 * @return
	 */
	@RequestMapping(value="add.do")
	@ResponseBody
	@SystemLogController(description = "保存栏目管理新增信息")
	public Map<String, String> add(CmsNode cmsnode){
		cmsNodeService.add(cmsnode);
		Map<String,String> map = new HashMap<String, String>();
		map.put("msg","suc");
		return map;
	}
	
	/**
	 * post方式分页查询
	 * @param page
	 * @param cmsnode
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询栏目管理信息")
	public Map<String, Object> showlist(Page<CmsNode> page,CmsNode cmsnode){
		List<CmsNode> list = cmsNodeService.query(page, cmsnode);
		PageInfo<CmsNode> pageInfo = new PageInfo<CmsNode>(list);
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
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@ResponseBody
	@RequiresPermissions("cmsnode_delete")
	@SystemLogController(description = "删除栏目管理信息")
	public Map<String,Object> deleteById(String ids){
		cmsNodeService.delete(ids);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("status","1");
		return map;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param cmsnodeId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改栏目管理单条记录页面")
	public String getById(Model model,String cmsnodeId,int typeKey){
		CmsNode cmsnode = cmsNodeService.getById(cmsnodeId);
		model.addAttribute("cmsnode", cmsnode);
		if(typeKey == 1){
			return "/ez/cms/cmsnode/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsnode/view";
		}else{
			return "/ez/cms/cmsnode/addsub";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param cmsnode
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@ResponseBody
	@RequiresPermissions("cmsnode_modify")
	@SystemLogController(description = "更新修改栏目管理的信息")
	public Map<String,Object> updateCmsNode(CmsNode cmsnode){
		if (null==cmsnode.getCmsNodeState()){
			cmsnode.setCmsNodeState(0);
		}
		cmsnode.setCmsNodeInserttime(DateUtil.getNowDate());
		cmsNodeService.modify(cmsnode);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg","suc");
		return map;
	}

	/**
	 * 批量删除数据
	 * @param response
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	@ResponseBody
	@RequiresPermissions("cmsnode_deleteall")
	@SystemLogController(description = "批量删除栏目管理信息")
	public Map<String,Object> deleteAll(String[] ids, HttpServletResponse response) {
		for (String id : ids) {
			cmsNodeService.delete(id);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status","1");
		map.put("message","删除成功！");
		return map;
	}
	/**
	 * post方式不分页查询
	 * @param page
	 * @param cmsNode
	 * @return map
	 */
	@RequestMapping(value="getParentList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询一级栏目管理信息")
	public Map<String, Object> getParentcityList(Page<CmsNode> page,CmsNode cmsNode){
		List<CmsNode> list;
		if (!Common.isEmpty(cmsNode.getCmsNodeName()) || !Common.isEmpty(cmsNode.getCmsNodeCode()) || null!=cmsNode.getCmsNodeType() || null!=cmsNode.getCmsNodeState()){
			list = cmsNodeService.queryList(page,cmsNode);
		}else {
			list = cmsNodeService.getParentcityList(page,cmsNode);
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	* post方式不分页查询
	 * @param page
	 * @param cmsNode
	 * @return map
	 */
	@RequestMapping(value="getChildrenList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询下级栏目管理信息")
	public Map<String, Object> getChildrencityList(Page<CmsNode> page, CmsNode cmsNode){
		List<CmsNode> list = cmsNodeService.getChildrenCityList(page,cmsNode);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
}

