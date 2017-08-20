/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.modules.cms.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
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
import com.ez.modules.cms.entity.*;
import com.ez.modules.cms.service.*;

/**
 * @author chenez
 * @2017-06-23
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsinfovideo/")
public class CmsInfoVideoController extends BaseController {

	@Autowired
	private CmsInfoVideoService cmsInfoVideoService;

	/**
	 * 跳到列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到视频管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsinfovideo/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到视频管理新增页面")
	public String addUI(){
		return "/ez/cms/cmsinfovideo/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmsinfovideo
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmsinfovideo_add")
	@SystemLogController(description = "保存视频管理新增信息")
	public String add(CmsInfoVideo cmsinfovideo,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		cmsInfoVideoService.add(cmsinfovideo);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * post方式分页查询
	 * @param page
	 * @param cmsinfovideo
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询视频管理信息")
	public Map<String, Object> showlist(Page<CmsInfoVideo> page,CmsInfoVideo cmsinfovideo){
		List<CmsInfoVideo> list = cmsInfoVideoService.query(page, cmsinfovideo);
		PageInfo<CmsInfoVideo> pageInfo = new PageInfo<CmsInfoVideo>(list);
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
	@RequiresPermissions("cmsinfovideo_delete")
	@SystemLogController(description = "删除视频管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1}";
		cmsInfoVideoService.delete(ids);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param cmsinfovideoId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改视频管理单条记录页面")
	public String getById(Model model,String cmsinfovideoId,int typeKey){
		CmsInfoVideo cmsinfovideo = cmsInfoVideoService.getById(cmsinfovideoId);
		model.addAttribute("cmsinfovideo", cmsinfovideo);
		if(typeKey == 1){
			return "/ez/cms/cmsinfovideo/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsinfovideo/view";
		}else{
			return "/ez/cms/cmsinfovideo/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmsinfovideo
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmsinfovideo_modify")
	@SystemLogController(description = "更新修改视频管理的信息")
	public String updateCmsInfoVideo(Model model,CmsInfoVideo cmsinfovideo,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		if (null==cmsinfovideo.getEmVideoStat()){
			cmsinfovideo.setEmVideoStat(0);
		}
		cmsinfovideo.setEmVideoInserttime(DateUtil.getNowDate());
		cmsInfoVideoService.modify(cmsinfovideo);
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
	@RequiresPermissions("cmsinfovideo_deleteall")
	@SystemLogController(description = "批量删除视频管理信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1}";
		for (String id : ids) {
			cmsInfoVideoService.delete(id);
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
}

