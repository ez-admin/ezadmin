package com.ez.system.controller;


import com.ez.json.Entity;
import com.ez.system.entity.SysDictionary;
import com.ez.system.service.SysDictionaryService;
import com.ez.util.Common;
import com.ez.util.PageView;
import com.ez.util.PubConstants;
import com.ez.util.WebTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/ez/system/sysdictionary/")
public class SysDictionaryController {

	@Autowired
	private SysDictionaryService sysDictionaryService;

	/**
	 * 跳转到list展示页面
	 * @return
	 */
	@RequestMapping(value="list")
	public String list(){
		return "ez/system/sysDictionary/list";
	}

	@RequestMapping(value = "getPageList")
	@ResponseBody
	public Map<String, Object> getSysDicTypeList(Model model, SysDictionary sysDictionary,
                                                 HttpServletRequest request) {
		PageView pageView = null;
		String pageNow = request.getParameter("pager.pageNo");
		String pageSize = request.getParameter("pager.pageSize");
		if (Common.isEmpty(pageNow))
			pageView = new PageView(1);
		else {
			pageView = new PageView(Integer.parseInt(pageSize),
					Integer.parseInt(pageNow));
		}
		Map map = new HashMap();
		pageView = this.sysDictionaryService.query(pageView, sysDictionary);
		List list = pageView.getRecords();
		map.put("rows", list);
		map.put("pager.pageNo", Integer.valueOf(pageView.getPageNow()));
		map.put("pager.totalRows", Long.valueOf(pageView.getRowCount()));
		return map;
	}

	/**
	 * 
	 * @param code
	 * @param sdvalue
	 * @param request
	 * @return
	 * 多条件查询
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="getSdBySdtCode1")
	@ResponseBody
	public Map<String, List> getSdBySdtCode1(String code,String sdvalue, HttpServletRequest request){
		//字典类型编码
		code = request.getParameter("code");
		sdvalue =request.getParameter("sdvalue");
		SysDictionary newDic=new SysDictionary();
		newDic.setCode(code);
		newDic.setSdvalue(sdvalue);
		Entity entity;
		List<SysDictionary> sysDictionarys = sysDictionaryService.findSdBySdtCode2(newDic);
		List<Entity> list = new ArrayList<Entity>();
		Map<String,List> resMap = new HashMap<String,List>();
		for(SysDictionary sd : sysDictionarys){
			entity = new Entity();
			entity.setKey(sd.getSdkey());
			entity.setValue(sd.getSdvalue());
			list.add(entity);
		}
		resMap.put("list", list);
		return resMap;
	}
	/**
	 * @param code
	 * @return
	 * 多选下拉框查询
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="getSdBySdtCode2")
	@ResponseBody
	public String getSdBySdtCode2(String code, HttpServletRequest request){
		//字典类型编码
		code = request.getParameter("code");
		String stat =request.getParameter("stat");
		
		List<SysDictionary> sysDictionarys = sysDictionaryService.findSdBySdtCode(code);
		StringBuffer sb=new StringBuffer();
		for(SysDictionary sd : sysDictionarys){
			sb.append("{");
			sb.append("\"id\":\""+sd.getId()+"\",");
			sb.append("\"parentId\":\"0\",");
			sb.append("\"name\":\""+sd.getSdkey()+"\"");
			sb.append("},");
		}
		String result=sb.toString();
			   result=result.substring(0,result.length()-1);
			   result="{\"treeNodes\":["+result+"]}";
		return result;
	}
	
	@RequestMapping(value="findKeyByValue",method= RequestMethod.POST)
	public String findKeyByValue(SysDictionary sysDictionary, HttpServletResponse response){
		String result=null;
		List<SysDictionary> sysDictionaryList = sysDictionaryService.findKeyByCodeAndValue(sysDictionary);
		if(null == sysDictionaryList){
			result = "{\"msg\":\"不存在的空值\"}";
		}else if(sysDictionaryList.size() == 0){
			result = "{\"msg\":\"不存在的空值\"}";
		}else if(sysDictionaryList.size() > 1){
			result = "{\"msg\":\"异常，存在多个值\"}";
		}else{
			sysDictionary = sysDictionaryList.get(0);
			String sdkey = sysDictionary.getSdkey();
			result = "{\"sdkey\":\""+ sdkey + "\"}";
		}
		WebTool.writeJson(result, response);
		return null;
	}
	//chenenze - start
		/**
		 * 提供list展示界面的数据
		 * @param model
		 * @param request
		 * @return
		 */
		@RequestMapping(value = "query")
		@ResponseBody
		public Map<String, Object> getSysDictionary(Model model, SysDictionary sysDictionary,
                                                    HttpServletRequest request) {
			PageView pageView = null;
			String pageNow = request.getParameter("pager.pageNo");
			String pageSize = request.getParameter("pager.pageSize");
			if (Common.isEmpty(pageNow))
				pageView = new PageView(1);
			else {
				pageView = new PageView(Integer.parseInt(pageSize),
						Integer.parseInt(pageNow));
			}
			Map map = new HashMap();
			pageView = this.sysDictionaryService.query(pageView, sysDictionary);
			List list = pageView.getRecords();
			map.put("rows", list);
			map.put("pager.pageNo", Integer.valueOf(pageView.getPageNow()));
			map.put("pager.totalRows", Long.valueOf(pageView.getRowCount()));
			return map;
		}
	/**
	 * 跳转到新增界面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return "mf/system/sysDictionary/add";
	}
	
	/**
	 * 保存数据
	 * @param model
	 * @param sysDictionary
	 * @param response
	 * @return
	 */
	@RequestMapping(value="add")
	@ResponseBody
	public String add(Model model, SysDictionary sysDictionary, HttpServletResponse response){
		String result = "{\"msg\":\"suc\"}";
		//判断字典编号和findByCodeAndValue里的key和value是否同时存在
		String code=sysDictionary.getCode();
		String sdvalue=sysDictionary.getSdvalue();
		SysDictionary sv=sysDictionaryService.findByCodeAndValue(sysDictionary);
		if(null != sv){
			result = "{\"msg\":\"fail\"}";
		}else{
			sysDictionaryService.add(sysDictionary);
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	@RequestMapping(value="findByCode")
	public String getById(Model model, String id, String pageType, HttpServletResponse response){
		SysDictionary sysDictionary = sysDictionaryService.findByCode(id);
		model.addAttribute("sysDictionary", sysDictionary);
		if(null != pageType){
			if(PubConstants.PAGE_TYPE_VIEW.equals(pageType)){
				return "ez/system/sysDictionary/info";
			}else{
				return "ez/system/sysDictionary/edit";
			}
		}else{
			return null;
		}
	}
	
	@RequestMapping(value = "modify")
	public String modify(SysDictionary sysDictionary, HttpServletResponse response){
		String result = null;
		try {
			sysDictionaryService.modify(sysDictionary);
			result = "{\"msg\":\"suc\"}";
		} catch (Exception e) {
			result = "{\"msg\":\"fail\"}";
		}
		WebTool.writeJson(result, response);
		return null;
	}
	//chenenze - end


}
