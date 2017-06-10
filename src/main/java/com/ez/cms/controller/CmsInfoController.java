/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.cms.controller;

import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysUser;
import com.ez.util.DateUtil;
import com.ez.util.PubConstants;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.ez.cms.entity.*;
import com.ez.cms.service.*;

/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsinfo/")
public class CmsInfoController {

	@Autowired
	private CmsInfoService cmsInfoService;
	@Autowired
	private CmsNodeService cmsNodeService;
	@Autowired
	private  CmsTagService cmsTagService;

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
	@SystemLogController(description = "跳到文章管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsinfo/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到文章管理新增页面")
	public String addUI(Model model){
		//栏目列表
		String cmsnodeList=cmsNodeService.findAllCmsNode(null);
		model.addAttribute("cmsnodeList",cmsnodeList);
		//标签列表
		List<CmsTag> cmsTags=cmsTagService.findAll();
		model.addAttribute("cmsTags",cmsTags);
		return "/ez/cms/cmsinfo/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmsinfo
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmsinfo_add")
	@SystemLogController(description = "保存文章管理新增信息")
	public String add(CmsInfo cmsinfo, HttpServletResponse response, HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsInfoService.addinfo(cmsinfo,request);
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
	 * @param cmsinfo
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询文章管理信息")
	public Map<String, Object> showlist(Page<CmsInfo> page,CmsInfo cmsinfo){
		List<CmsInfo> list = cmsInfoService.query(page, cmsinfo);
		PageInfo<CmsInfo> pageInfo = new PageInfo<CmsInfo>(list);
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
	@RequiresPermissions("cmsinfo_delete")
	@SystemLogController(description = "删除文章管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			cmsInfoService.delete(ids);
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
	 * @param cmsinfoId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改文章管理单条记录页面")
	public String getById(Model model,String cmsinfoId,int typeKey){
		CmsInfo cmsinfo = cmsInfoService.getById(cmsinfoId);
		model.addAttribute("cmsinfo", cmsinfo);
		String cmsnodeList=cmsNodeService.findAllCmsNode(cmsinfo.getCmsNodeId().toString());
		model.addAttribute("cmsnodeList",cmsnodeList);
		List<CmsInfoTag> cmsInfoTags = cmsInfoService.getCmsInfoTags(cmsinfoId);
		if(typeKey == 1){
			return "/ez/cms/cmsinfo/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsinfo/view";
		}else{
			return "/ez/cms/cmsinfo/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmsinfo
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmsinfo_modify")
	@SystemLogController(description = "更新修改文章管理的信息")
	public String updateCmsInfo(Model model,CmsInfo cmsinfo,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsinfo.setCmsInfoInserttime(DateUtil.getNowDate());
			SysUser sysUser = (SysUser)SecurityUtils.getSubject().getSession().getAttribute(PubConstants.SESSION_SYSUSER);
			cmsinfo.setAuthor(sysUser.getUserno());
			cmsInfoService.modify(cmsinfo);
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
	@RequiresPermissions("cmsinfo_deleteall")
	@SystemLogController(description = "批量删除文章管理信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				cmsInfoService.delete(id);
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
}

