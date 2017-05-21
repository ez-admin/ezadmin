/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.ez.annotation.SystemLogController;
import com.ez.system.entity.SysCity;
import com.ez.system.service.SysCityService;
import com.ez.util.Common;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author chenez
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/syscity/")
public class SysCityController {

	@Autowired
	private SysCityService sysCityService;


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
	@SystemLogController(description = "跳到城市区域列表页面")
	public String list(Model model){
		return "/ez/system/syscity/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到城市区域新增页面")
	public String addUI(){
		return "/ez/system/syscity/add";
	}
	
	/**
	 * 保存新增一级区域
	 * @param response
	 * @param syscity
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("syscity_add")
	@SystemLogController(description = "保存一级城市区域新增信息")
	public String add(SysCity syscity,HttpServletResponse response){
		String result=this.addpublic(syscity);
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 保存新增 下级区域
	 * @param response
	 * @param syscity
	 * @return
	 */
	@RequestMapping(value="addsub")
	@RequiresPermissions("syscity_addsub")
	@SystemLogController(description = "保存下级城市区域新增信息")
	public String addsub(SysCity syscity,HttpServletResponse response){
		String result=this.addpublic(syscity);
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 公用新增方法
	 * @param syscity
	 * @return
	 */
	public String addpublic(SysCity syscity){
		String result="{\"msg\":\"suc\"}";
		try {
			SysCity sysCity=sysCityService.getById(syscity.getId().toString());
			if (null==sysCity){
				sysCityService.add(syscity);
			}else {
				result="{\"msg\":\"fail\",\"message\":\"区域id已经存在，请重新输入！\"}";
			}
		} catch (Exception e) {
			result="{\"msg\":\"fail\",\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询城市区域信息")
	public Map<String, Object> showlist(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.query(page, syscity);
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}

	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getParentcity",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到分页查询一级城市区域信息")
	public Map<String, Object> getParentcity(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getParentcity(page, syscity);
		if (!Common.isEmpty(syscity.getName())){
			list = sysCityService.query(page, syscity);
		}
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}

	/**
	 * post方式不分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getParentcityList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询一级城市区域信息")
	public Map<String, Object> getParentcityList(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getParentcityList(page,syscity);
		if (!Common.isEmpty(syscity.getName())){
			list = sysCityService.queryList(page,syscity);
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}

	/**
	 * post方式分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getChildrencity",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到分页查询下级城市区域信息")
	public Map<String, Object> getChildrencity(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getChildrenCity(page, syscity);
		PageInfo<SysCity> pageInfo = new PageInfo<SysCity>(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", pageInfo.getTotal());
		return map;
	}

	/**
	 * post方式不分页查询
	 * @param page
	 * @param syscity
	 * @return map
	 */
	@RequestMapping(value="getChildrencityList",method=RequestMethod.POST)
	@ResponseBody
	@SystemLogController(description = "跳到不分页查询下级城市区域信息")
	public Map<String, Object> getChildrencityList(Page<SysCity> page,SysCity syscity){
		List<SysCity> list = sysCityService.getChildrenCityList(page,syscity);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}

	/**
	 * 根据id删除
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	@SystemLogController(description = "删除城市区域信息")
	@RequiresPermissions("syscity_delete")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			sysCityService.deleteSubAll(ids);
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
	 * @param syscityId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改城市区域单条记录页面")
	public String getById(Model model,String syscityId,int typeKey){
		SysCity syscity = sysCityService.getById(syscityId);
		model.addAttribute("syscity", syscity);
		if(typeKey == 1){
			return "/ez/system/syscity/edit";
		}else if(typeKey == 2){
			return "/ez/system/syscity/addsub";
		}else{
			return "/ez/system/syscity/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param syscity
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("syscity_modify")
	@SystemLogController(description = "更新修改城市区域的信息")
	public String updateSysCity(SysCity syscity,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			sysCityService.modify(syscity);
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
	@RequiresPermissions("syscity_deleteall")
	@SystemLogController(description = "批量删除城市区域信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				sysCityService.delete(id);
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 调到上传页面
	 * @return
	 */
	@RequestMapping("upload")
	public String upload(){
		return "/ez/system/syscity/upload";
	}

	/**
	 * 下载导入数据的模板
	 * 参考资料
	 * http://www.open-open.com/lib/view/open1429847388213.html#articleHeader5
	 * @param response
	 */
	@RequestMapping("exportfile")
	public void loadFileDemo(HttpServletResponse response){
		//创建HSSFWorkbook对象
		HSSFWorkbook wb = new HSSFWorkbook();
		//创建HSSFSheet对象
		HSSFSheet sheet = wb.createSheet("sheet0");
		//创建HSSFRow对象
		HSSFRow row = sheet.createRow(0);
		//创建HSSFCell对象
		//HSSFCell cell=row.createCell(0);
		//设置单元格的值
		//cell.setCellValue("单元格中的中文");
		row.createCell(0).setCellValue(SysCity.ALIAS_ID);
		row.createCell(1).setCellValue(SysCity.ALIAS_NAME);
		row.createCell(2).setCellValue(SysCity.ALIAS_PARENT_ID);
		//输出Excel文件
		String fileName ="syscity.xls";
		WebTool.writeExcel(fileName,wb,response);
	}

	/**
	 * 上传文件 保存到服务器
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "uploadfile",method=RequestMethod.POST)
	public String uploadfile(@RequestParam("file") MultipartFile file, HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		String filename="";
		String filelastname="";
		if (!file.isEmpty()){
			filename=file.getOriginalFilename();
			filelastname=file.getOriginalFilename().substring(filename.lastIndexOf("."));
		}
		if(file.isEmpty()){
			jsonObject.put("msg","fail");
			jsonObject.put("message","您未上传Excel文件,请先上传！");
		}else if(!filelastname.equalsIgnoreCase(".xls") && !filelastname.equalsIgnoreCase(".xlsx")) {
			jsonObject.put("msg","fail");
			jsonObject.put("message","上传的文件类型非Excel,请重新上传！");
		}else {
			try {
				String filedName1= UUID.randomUUID()+filename.substring(filename.lastIndexOf("."),filename.length());
				String path=request.getSession().getServletContext().getRealPath("/")+"upload"+ File.separator+filedName1;
				File dirfile =new File(request.getSession().getServletContext().getRealPath("/")+"upload");
				if  (!dirfile .exists()  && !dirfile .isDirectory()){ dirfile .mkdir();}//如果文件夹不存在则创建
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(file.getBytes());
				fos.close();
				jsonObject.put("path",path);
				jsonObject.put("filename",filename);
			} catch (Exception e) {
				jsonObject.put("msg","fail");
				jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
				e.printStackTrace();
			}
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	/**
	 * 删除上传的临时文件
	 * @param uploadfilepath
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "deleteuploadfile",method=RequestMethod.POST)
	public String deleteuploadfile(String uploadfilepath, HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		if (!uploadfilepath.isEmpty()){
			try {
				File file = new File(uploadfilepath);
				if (file.isFile() && file.exists()) {
					file.delete();
				}
			} catch (Exception e) {
				jsonObject.put("msg","fail");
				jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
				e.printStackTrace();
			}
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	/**
	 * 新增上传数据
	 * 参考资料http://www.open-open.com/lib/view/open1429847388213.html#articleHeader19
	 * @param filepath
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "uploadadd",method=RequestMethod.POST)
	public String uploadadd(String filepath,HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		if (!filepath.isEmpty()){
			try {
				sysCityService.uploadadd(filepath);
			} catch (Exception e) {
				jsonObject.put("msg","fail");
				jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
				e.printStackTrace();
			}
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	/**
	 * 更新上传数据
	 * 参考资料http://www.open-open.com/lib/view/open1429847388213.html#articleHeader19
	 * @param filepath
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "uploadmodify",method=RequestMethod.POST)
	public String uploadmodify(String filepath,HttpServletRequest request,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		if (!filepath.isEmpty()){
			try {
				sysCityService.uploadmodify(filepath);
			} catch (Exception e) {
				jsonObject.put("msg","fail");
				jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
				e.printStackTrace();
			}
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	@RequestMapping(value="getSdBySdtCode")
	@ResponseBody
	public String getSdBySdtCode(String parentId,String selected,HttpServletResponse response){
		//字典类型编码
		List<SysCity> sysCityList = sysCityService.findSdBySdtCode(parentId);
		String result="";
		for(SysCity sysCity : sysCityList) {
			if (selected!=null && selected.equals(sysCity.getId().toString())){
				result+="<option value=\""+sysCity.getId()+"\" selected >"+sysCity.getName()+"</option>";
			}else {
				result+="<option value=\""+sysCity.getId()+ "\">"+sysCity.getName()+"</option>";
			}
		}
		WebTool.writeHtml(result, response);
		return null;
	}


}

