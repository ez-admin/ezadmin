package com.ez.system.controller;

import com.ez.system.entity.SysRight;
import com.ez.system.service.SysRightService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenez
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysright/")
public class SysRightController {
	
	@Resource
	private SysRightService sysRightService;
	
	
	
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		return "ez/system/sysright/add";
	}
	
	/**
	 * 保存新增
	 * @param model
	 * @param sysright
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysRight sysright,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			sysRightService.add(sysright);
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" + WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * 保存新增--for 即时编辑
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="addnull")
	public String addnull(Model model,HttpServletResponse response,HttpServletRequest request){
		String result="";
		try {
			SysRight sysright = new SysRight();
			sysRightService.addAll(sysright);
			result="{\"id\":" + sysright.getUid() + ",\"message\":\"新增成功！\"}";
		} catch (Exception e) {
			result="{\"id\":\"0\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		 WebTool.writeJson(result, response);
		 return null;
	}
	
	/**
	 * 分页查询跳转
	 * @param model
	 * @param sysright
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,SysRight sysright,String pageNow, String pageSize){
		return "ez/system/sysright/list_list";
	}

	/**
	 * post方式分页查询
	 * @param offset
	 * @param limit
	 * @param sysright
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showlist(int offset, int limit, SysRight sysright, HttpServletRequest request){
		//设置分页参数
		Page<SysRight> page = new Page<SysRight>(offset, limit);
		//page.setOrderBy(sort + " " + direction);

		List<SysRight> list = sysRightService.query(page, sysright);
		PageInfo<SysRight> pageInfo = new PageInfo<SysRight>(list);

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}
	/*@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> showlist(Model model,SysRight sysright,HttpServletRequest request){
		PageView pageView = null;
		String pageNow=request.getParameter("pager.pageNo");
		String pageSize=request.getParameter("pager.pageSize");
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageSize),Integer.parseInt(pageNow));
		}
		Map<String, Object> map=new HashMap<String, Object>();
		pageView = sysRightService.query(pageView, sysright);
		List<SysRight> list=pageView.getRecords();
		map.put("rows", list); 
		map.put("pager.pageNo", pageView.getPageNow());
		map.put("pager.totalRows", pageView.getRowCount());
		return map;
	}*/
	
	/**
	 * 根据id删除
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result=null;
		try{
			sysRightService.delete(ids);
		    result="{\"status\":1,\"message\":\"删除成功！\"}";
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
	 * @param sysrightId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String sysrightId,int typeKey){
		SysRight sysright = sysRightService.getById(sysrightId);
		model.addAttribute("sysright", sysright);
		if(typeKey == 1){
			return "ez/system/sysright/edit";
		}else if(typeKey == 2){
			return "ez/system/sysright/view";
		}else{
			return "ez/system/sysright/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysright
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysRight(Model model,SysRight sysright,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";;
		try {			
			sysRightService.modify(sysright);
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
		String result = null;
		try {
			for (String id : ids) {
				sysRightService.delete(id);
			}
			result = "{\"status\":1,\"message\":\"删除成功！\"}";
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}
	
	
}

