package com.ez.system.controller;


import com.ez.json.Entity;
import com.ez.system.entity.SysDicType;
import com.ez.system.entity.SysMenu;
import com.ez.system.service.SysDicTypeService;
import com.ez.util.PageView;
import com.ez.util.PubConstants;
import com.ez.util.WebTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/ez/system/sysdictype/")
public class SysDicTypeController {
	
	@Autowired
	private SysDicTypeService sysDicTypeService;
	
	/**
	 * 跳转到list展示页面
	 * @return
	 */
	@RequestMapping(value="list")
	public String list(){
		return "ez/system/sysDicType/list";
	}

	/**
	 * 提供list展示界面的数据
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "query")
	@ResponseBody
	public Map<String, Object> getSysDicTypeList(Model model, SysDicType sysDicType, HttpServletRequest request) {
		PageView pageView = null;
		// For pagination
		int pageSize = 10;
		int startPage = 0;
		String size = request.getParameter("length");
		if (!"".equals(size) && size != null) {
			pageSize = Integer.parseInt(size);
		}
		String currentRecord = request.getParameter("start");
		if (!"".equals(currentRecord) && currentRecord != null) {
			startPage = Integer.parseInt(currentRecord);
		}
		// For sortable
		String sidx = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
		String sord = request.getParameter("order[0][dir]");
		// For search
		String searchValue = request.getParameter("search[value]");

		if (!sidx.equals("0")) {
			sysDicType.setSidx(sidx);
		}
		sysDicType.setSord(sord);
		sysDicType.setSearchValue(searchValue);

		pageView = new PageView(pageSize, startPage);
		Map<String, Object> map = new HashMap<String, Object>();
		pageView = sysDicTypeService.query(pageView, sysDicType);
		List<SysMenu> list = pageView.getRecords();

		map.put("draw", request.getParameter("draw"));
		map.put("recordsTotal", pageView.getRowCount());
		map.put("recordsFiltered", pageView.getRowCount());
		map.put("data", list);
		return  map;
	}
	/**
	 * 跳转到新增界面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(){
		return "ez/system/sysDicType/add";
	}
	
	/**
	 * 保存数据
	 * @param model
	 * @param sysDicType
	 * @param response
	 * @return
	 */
	@RequestMapping(value="add")
	@ResponseBody
	public String add(Model model, SysDicType sysDicType, HttpServletResponse response){
		String result = "{\"msg\":\"suc\"}";
		SysDicType sd = sysDicTypeService.findByCode(sysDicType.getCode());
		if(null != sd){
			result = "{\"msg\":\"fail\"}";
		}else{
			sysDicTypeService.add(sysDicType);
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	@RequestMapping(value="findByCode")
	public String getById(Model model, String code, String pageType, HttpServletResponse response){
		SysDicType sysDicType = sysDicTypeService.findByCode(code);
		model.addAttribute("sysDicType", sysDicType);
		if(null != pageType){
			if(PubConstants.PAGE_TYPE_VIEW.equals(pageType)){
				return "ez/system/sysDicType/view";
			}else{
				return "ez/system/sysDicType/edit";
			}
		}else{
			return null;
		}
	}
	
	@RequestMapping(value = "modify")
	public String modify(SysDicType sysDicType, HttpServletResponse response){
		String result = null;
		try {
			sysDicTypeService.modify(sysDicType);
			result = "{\"msg\":\"suc\"}";
		} catch (Exception e) {
			result = "{\"msg\":\"fail\"}";
		}
		WebTool.writeJson(result, response);
		return null;
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="getSdBySdtCode")
	@ResponseBody
	public Map<String, List> getSdBySdtCode(Entity entity){
		//新增时下拉选择框
		List<SysDicType> sysDicTypes = sysDicTypeService.findAll();
		List<Entity> list = new ArrayList<Entity>();
		Map<String,List> resMap = new HashMap<String,List>();
		for(SysDicType sd : sysDicTypes){
			entity = new Entity();
			entity.setKey(sd.getName());
			entity.setValue(sd.getCode());
			list.add(entity);
		}
		resMap.put("list", list);
		return resMap;
	}
}
