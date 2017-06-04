/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.cms.controller;

import com.ez.annotation.SystemLogController;
import com.ez.cms.entity.CmsImgPosition;
import com.ez.cms.service.CmsImgPositionService;
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

/**
 * @author chenez
 * @2017-06-03
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsimgposition/")
public class CmsImgPositionController {

	@Autowired
	private CmsImgPositionService cmsImgPositionService;


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
	@SystemLogController(description = "跳到图片位置管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsimgposition/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到图片位置管理新增页面")
	public String addUI(){
		return "/ez/cms/cmsimgposition/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmsimgposition
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmsimgposition_add")
	@SystemLogController(description = "保存图片位置管理新增信息")
	public String add(CmsImgPosition cmsimgposition,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsImgPositionService.add(cmsimgposition);
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
	 * @param cmsimgposition
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询图片位置管理信息")
	public Map<String, Object> showlist(Page<CmsImgPosition> page,CmsImgPosition cmsimgposition){
		List<CmsImgPosition> list = cmsImgPositionService.query(page, cmsimgposition);
		PageInfo<CmsImgPosition> pageInfo = new PageInfo<CmsImgPosition>(list);
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
	@RequiresPermissions("cmsimgposition_delete")
	@SystemLogController(description = "删除图片位置管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			cmsImgPositionService.delete(ids);
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
	 * @param cmsimgpositionId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改图片位置管理单条记录页面")
	public String getById(Model model,String cmsimgpositionId,int typeKey){
		CmsImgPosition cmsimgposition = cmsImgPositionService.getById(cmsimgpositionId);
		model.addAttribute("cmsimgposition", cmsimgposition);
		if(typeKey == 1){
			return "/ez/cms/cmsimgposition/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsimgposition/view";
		}else{
			return "/ez/cms/cmsimgposition/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmsimgposition
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmsimgposition_modify")
	@SystemLogController(description = "更新修改图片位置管理的信息")
	public String updateCmsImgPosition(Model model,CmsImgPosition cmsimgposition,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsImgPositionService.modify(cmsimgposition);
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
	@RequiresPermissions("cmsimgposition_deleteall")
	@SystemLogController(description = "批量删除图片位置管理信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				cmsImgPositionService.delete(id);
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
	 * @param code
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getSdBySdtCode")
	@ResponseBody
	public String getSdBySdtCode(String code,String selected,HttpServletResponse response){
		//字典类型编码
		List<CmsImgPosition> cmsImgPositions = cmsImgPositionService.getSdBySdtCode(code);
		String result="";
		for(CmsImgPosition sd : cmsImgPositions) {
			if (selected!=null  && selected.equals(sd.getPositionId().toString())){
				result+="<option value="+sd.getPositionId()+" selected >"+sd.getPositionName()+"</option>";
			}else {
				result+="<option value="+sd.getPositionId()+">"+sd.getPositionName()+"</option>";
			}
		}
		WebTool.writeHtml(result, response);
		return null;
	}
}

