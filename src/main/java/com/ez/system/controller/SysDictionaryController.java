package com.ez.system.controller;

import com.ez.annotation.SystemLogController;
import com.ez.base.AutoCompleteEntity;
import com.ez.system.entity.SysDictionary;
import com.ez.system.service.SysDictionaryService;
import com.ez.util.Jurisdiction;
import com.ez.util.PubConstants;
import com.ez.util.WebTool;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysdictionary/")
public class SysDictionaryController {

	String menuUrl = "/ez/system/sysdictionary/list.do"; //菜单地址(权限用)
	@Resource
	private SysDictionaryService sysDictionaryService;
	
	
	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到字典名称列表页面")
	public String list(Model model){
		model.addAttribute(PubConstants.SESSION_QX,WebTool.getSessionQx());
		return "/ez/system/sysdictionary/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到字典名称新增页面")
	public String addUI(Model model){
		return "/ez/system/sysdictionary/add";
	}
	
	/**
	 * 保存新增
	 * @param model
	 * @param sysdictionary
	 * @return
	 */
	@RequestMapping(value="add")
	@SystemLogController(description = "保存字典名称新增信息")
	public String add(Model model, SysDictionary sysdictionary, HttpServletResponse response, HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
				sysDictionaryService.add(sysdictionary);
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
	 * @param sysdictionary
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到分页查询字典名称信息")
	public Map<String, Object> showlist(SysDictionary sysdictionary, Page<SysDictionary> page){
		List<SysDictionary> list = sysDictionaryService.query(page, sysdictionary);
		PageInfo<SysDictionary> pageInfo = new PageInfo<SysDictionary>(list);
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
	@SystemLogController(description = "删除字典名称信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			if(Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
				sysDictionaryService.delete(ids);
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
	 * @param sysdictionaryId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改字典名称单条记录页面")
	public String getById(Model model,String sysdictionaryId,int typeKey){
		SysDictionary sysdictionary = sysDictionaryService.getById(sysdictionaryId);
		model.addAttribute("sysdictionary", sysdictionary);
		if(typeKey == 1){
			return "/ez/system/sysdictionary/edit";
		}else if(typeKey == 2){
			return "/ez/system/sysdictionary/view";
		}else{
			return "/ez/system/sysdictionary/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysdictionary
	 *
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改字典名称的信息")
	public String updateSysDictionary(Model model,SysDictionary sysdictionary,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
				sysDictionaryService.modify(sysdictionary);
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
	@SystemLogController(description = "批量删除菜单名称的信息")
	public String deleteAll(String[] ids, Model model, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			if(Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
				for (String id : ids) {
					sysDictionaryService.delete(id);
				}
			}else {
				result = "{\"status\":0,\"message\":\"您无删除权限！\"}";
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
	 * @param request
	 * @return
	 */
	@RequestMapping(value="getSdBySdtCode-old")
	@ResponseBody
	public Map<String, List<AutoCompleteEntity>> getSdBySdtCodeold (String code,HttpServletRequest request){
		//字典类型编码
		code = request.getParameter("code");
		AutoCompleteEntity entity;
		List<SysDictionary> sysDictionarys = sysDictionaryService.findSdBySdtCode(code);
        List<AutoCompleteEntity> list = new ArrayList<AutoCompleteEntity>();
		Map<String,List<AutoCompleteEntity>> resMap = new HashMap<String,List<AutoCompleteEntity>>();
        for(SysDictionary sd : sysDictionarys) {
			entity = new AutoCompleteEntity();
			entity.setKey(sd.getSdkey());
			entity.setValue(sd.getSdvalue());
			entity.setSuggest(sd.getSdkey());
			list.add(entity);
		}
		resMap.put("list", list);
		return resMap;
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
        List<SysDictionary> sysDictionarys = sysDictionaryService.findSdBySdtCode(code);
        String result="";
        for(SysDictionary sd : sysDictionarys) {
			if (selected!=null && selected.equals(sd.getSdvalue())){
				result+="<option value=\""+sd.getSdvalue()+"\" selected >"+sd.getSdkey()+"</option>";
			}else {
				result+="<option value=\""+sd.getSdvalue()+ "\">"+sd.getSdkey()+"</option>";
			}

        }
		WebTool.writeHtml(result, response);
		return null;
    }

}

