package com.ez.system.controller;

import com.ez.system.entity.SysMenu;
import com.ez.system.service.SysMenuService;
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
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysmenu/")
public class SysMenuController {
	
	@Resource
	private SysMenuService sysMenuService;

	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	public String list(){
		return "ez/system/sysMenu/list";
	}
	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		return "ez/system/sysMenu/add";
	}
    /**
     * 跳到查看图标页面
     * @return
     */
    @RequestMapping(value="viewIcons")
    public String viewIcons(Model model){
        return "ez/system/sysMenu/viewicons";
    }
	/**
	 * 保存新增
	 * @param model
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(Model model,SysMenu sysmenu,HttpServletResponse response,HttpServletRequest request){
		String result="{\"msg\":\"suc\"}";
		try {
			sysMenuService.add(sysmenu);
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
	 * @param response
	 * @return
	 */
	@RequestMapping(value="addnull")
	public String addnull(Model model,HttpServletResponse response,HttpServletRequest request){
		String result="";
		try {
			SysMenu sysmenu = new SysMenu();
			sysMenuService.addAll(sysmenu);
			result="{\"id\":" + sysmenu.getMenuId() + ",\"message\":\"新增成功！\"}";
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
	 * @param sysmenu
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="query")
	public String query(Model model,SysMenu sysmenu,String pageNow, String pageSize){
		return "ez/system/sysMenu/list_list";
	}
	
	/**
	 * post方式分页查询
	 * @param model
	 * @param sysmenu
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	public Map<String, Object> showlist(Model model,SysMenu sysmenu,HttpServletRequest request){
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
		String sidx =request.getParameter("columns["+request.getParameter("order[0][column]")+"][name]");
		String sord = request.getParameter("order[0][dir]");
		// For search
		String searchValue = request.getParameter("search[value]");

        if (!sidx.equals("0")){
            sysmenu.setSidx(sidx);
        }
        sysmenu.setSord(sord);
        sysmenu.setSearchValue(searchValue);

		pageView = new PageView(pageSize,startPage);
		Map<String, Object> map=new HashMap<String, Object>();
		pageView = sysMenuService.query(pageView, sysmenu);
		List<SysMenu> list=pageView.getRecords();

		map.put("draw",request.getParameter("draw"));
		map.put("recordsTotal",pageView.getRowCount());
		map.put("recordsFiltered",pageView.getRowCount());
		map.put("data", list);
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
			sysMenuService.delete(ids);
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
	 * @param sysmenuId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String sysmenuId,int typeKey){
		SysMenu sysmenu = sysMenuService.getById(sysmenuId);
		model.addAttribute("sysmenu", sysmenu);
		if(typeKey == 1){
			return "ez/system/sysMenu/edit";
		}else if(typeKey == 2){
			return "ez/system/sysMenu/view";
		}else{
			return "ez/system/sysMenu/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param sysmenu
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysMenu(Model model,SysMenu sysmenu,HttpServletResponse response){		
		String result="{\"msg\":\"suc\"}";;
		try {			
			sysMenuService.modify(sysmenu);
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
				sysMenuService.delete(id);
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

