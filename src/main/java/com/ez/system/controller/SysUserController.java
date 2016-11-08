package com.ez.system.controller;

import com.ez.system.entity.SysUser;
import com.ez.system.service.SysUserService;
import com.ez.util.Common;
import com.ez.util.PageView;
import com.ez.util.WebTool;
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
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysuser/")
public class SysUserController {
	
	@Resource
	private SysUserService sysUserService;

	/**
	 * test
	 * @return
	 */
	@RequestMapping(value="test")
	public String test(Model model){
		System.out.println("\"11111111\" = " + "11111111");
		SysUser sysuser = sysUserService.getById("1000");
		model.addAttribute("sysuser",sysuser);
		return "ez/client/showUser";
	}


	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		return "/ez/system/sysuser/add";
	}

	/**
	 * 保存新增
	 * @param model
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysUser sysuser,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";;
		try {
			sysUserService.add(sysuser);
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
	 * @return
	 */
	@RequestMapping(value="addnull")
	public String addnull(Model model,HttpServletResponse response,HttpServletRequest request){
		String result="";
		try {
			SysUser sysuser = new SysUser();
			sysUserService.addAll(sysuser);
			result="{\"id\":" + sysuser.getUserno() + ",\"message\":\"新增成功！\"}";
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
	 * @param sysuser
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,SysUser sysuser,String pageNow, String pageSize){
		return "/ez/system/sysuser/list_list";
	}
	
	/**
	 * post方式分页查询
	 * @param model
	 * @param sysuser
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> showlist(Model model,SysUser sysuser,HttpServletRequest request){
		PageView pageView = null;
		String pageNow=request.getParameter("pager.pageNo");
		String pageSize=request.getParameter("pager.pageSize");
		if(Common.isEmpty(pageNow)){
			pageView = new PageView(1);
		}else{
			pageView = new PageView(Integer.parseInt(pageSize),Integer.parseInt(pageNow));
		}
		Map<String, Object> map=new HashMap<String, Object>();
		pageView = sysUserService.query(pageView, sysuser);
		List<SysUser> list=pageView.getRecords();
		map.put("rows", list); 
		map.put("pager.pageNo", pageView.getPageNow());
		map.put("pager.totalRows", pageView.getRowCount());
		return map;
	}
	
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
			sysUserService.delete(ids);
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
	 * @param sysuserId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String sysuserId,int typeKey){
		SysUser sysuser = sysUserService.getById(sysuserId);
		model.addAttribute("sysuser", sysuser);
		if(typeKey == 1){
			return "/ez/system/sysuser/edit";
		}else if(typeKey == 2){
			return "/ez/system/sysuser/view";
		}else{
			return "/ez/system/sysuser/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysUser(Model model,SysUser sysuser,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";
		try {			
			sysUserService.modify(sysuser);
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
				sysUserService.delete(id);
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

