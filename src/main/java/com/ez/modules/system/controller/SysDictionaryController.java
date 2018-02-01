package com.ez.modules.system.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysDictionary;
import com.ez.modules.system.service.SysDictionaryService;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class SysDictionaryController extends BaseController {

	@Autowired
	private SysDictionaryService sysDictionaryService;
	
	
	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到字典名称列表页面")
	public String list(){
		return "/ez/system/sysdictionary/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到字典名称新增页面")
	public String addUI(){
		return "/ez/system/sysdictionary/add";
	}
	
	/**
	 * 保存新增
	 * @param sysdictionary
	 * @return
	 */
	@RequiresPermissions("sysdictionary_add")
	@RequestMapping(value="add")
	@SystemLogController(description = "保存字典名称新增信息")
	@ResponseBody
	public Map<String, Object> add(SysDictionary sysdictionary){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", PubConstants.TRUE);
		sysDictionaryService.add(sysdictionary);
		return map;
	}
	/**
	 * post方式分页查询
	 * @param sysdictionary
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "分页查询字典名称信息")
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
	 * @param ids
	 * @return
	 */
	@RequiresPermissions("sysdictionary_delete")
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除字典名称信息")
	@ResponseBody
	public Map<String, Object> deleteById(String ids){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		sysDictionaryService.delete(ids);
		return map;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param sysdictionaryId
	 * @param typeKey
	 * @return
	 */
	@RequiresPermissions(value={"sysdictionary_view","sysdictionary_modify"},logical= Logical.OR)
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
	 * @param sysdictionary
	 * @return
	 */
	@RequiresPermissions("sysdictionary_modify")
	@RequestMapping(value="update",method=RequestMethod.POST)
	@SystemLogController(description = "更新修改字典名称的信息")
	@ResponseBody
	public Map<String, Object> updateSysDictionary(SysDictionary sysdictionary){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", PubConstants.TRUE);
		sysDictionaryService.modify(sysdictionary);
		return map;
	}

	/**
	 * 批量删除数据
	 * @param ids
	 * @return
	 */
	@RequiresPermissions("sysdictionary_deleteall")
	@RequestMapping(value = "deleteAll")
	@SystemLogController(description = "批量删除字典名称的信息")
	@ResponseBody
	public Map<String, Object> deleteAll(String[] ids) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status",PubConstants.TRUE);
		for (String id : ids) {
			sysDictionaryService.delete(id);
		}
		return map;
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

