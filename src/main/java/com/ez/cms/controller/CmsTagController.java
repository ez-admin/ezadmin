/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.cms.controller;

import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysDictionary;
import com.ez.util.DateUtil;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
 * @2017-06-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmstag/")
public class CmsTagController {

	@Autowired
	private CmsTagService cmsTagService;


	/** binder用于bean属性的设置 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}

	/**
	 * 跳到列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到标签表列表页面")
	public String list(Model model){
		return "/ez/cms/cmstag/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到标签表新增页面")
	public String addUI(){
		return "/ez/cms/cmstag/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmstag
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmstag_add")
	@SystemLogController(description = "保存标签表新增信息")
	public String add(CmsTag cmstag,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsTagService.add(cmstag);
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
	 * @param cmstag
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询标签表信息")
	public Map<String, Object> showlist(Page<CmsTag> page,CmsTag cmstag){
		List<CmsTag> list = cmsTagService.query(page, cmstag);
		PageInfo<CmsTag> pageInfo = new PageInfo<CmsTag>(list);
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
	@RequiresPermissions("cmstag_delete")
	@SystemLogController(description = "删除标签表信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			cmsTagService.delete(ids);
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
	 * @param cmstagId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改标签表单条记录页面")
	public String getById(Model model,String cmstagId,int typeKey){
		CmsTag cmstag = cmsTagService.getById(cmstagId);
		model.addAttribute("cmstag", cmstag);
		if(typeKey == 1){
			return "/ez/cms/cmstag/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmstag/view";
		}else{
			return "/ez/cms/cmstag/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmstag
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmstag_modify")
	@SystemLogController(description = "更新修改标签表的信息")
	public String updateCmsTag(Model model,CmsTag cmstag,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			Date A=DateUtil.getNowDate();
			cmstag.setCmsCreationTime(A);
			cmsTagService.modify(cmstag);
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
	@RequiresPermissions("cmstag_deleteall")
	@SystemLogController(description = "批量删除标签表信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				cmsTagService.delete(id);
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	/**
	 * 数据字典单选下拉框
	 * @param id
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getSdBySdtCode")
	@ResponseBody
	@Deprecated//弃用
	public String getSdBySdtCode(String id,String selected,HttpServletResponse response){
		//字典类型编码
		List<CmsTag> cmsTags = cmsTagService.findSdBySdtCode(id);
		String result="";
		for(CmsTag sd : cmsTags) {
			if (selected!=null && selected.equals(sd.getCmsTagId())){
				result+="<option value=\""+sd.getCmsTagId()+"\" selected >"+sd.getCmsName()+"</option>";
			}else {
				result+="<option value=\""+sd.getCmsTagId()+ "\">"+sd.getCmsName()+"</option>";
			}
		}
		WebTool.writeHtml(result, response);
		return null;
	}
}

