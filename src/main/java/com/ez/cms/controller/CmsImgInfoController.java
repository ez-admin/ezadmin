/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.ez.annotation.SystemLogController;
import com.ez.cms.entity.CmsImgInfo;
import com.ez.cms.service.CmsImgInfoService;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
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
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsimginfo/")
public class CmsImgInfoController {

	@Autowired
	private CmsImgInfoService cmsImgInfoService;


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
	@SystemLogController(description = "跳到所有图片管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsimginfo/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到所有图片管理新增页面")
	public String addUI(){
		return "/ez/cms/cmsimginfo/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmsimginfo
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmsimginfo_add")
	@SystemLogController(description = "保存所有图片管理新增信息")
	public String add(CmsImgInfo cmsimginfo,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			cmsImgInfoService.add(cmsimginfo);
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
	 * @param cmsimginfo
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询所有图片管理信息")
	public Map<String, Object> showlist(Page<CmsImgInfo> page,CmsImgInfo cmsimginfo){
		List<CmsImgInfo> list = cmsImgInfoService.query(page, cmsimginfo);
		PageInfo<CmsImgInfo> pageInfo = new PageInfo<CmsImgInfo>(list);
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
	@RequiresPermissions("cmsimginfo_delete")
	@SystemLogController(description = "删除所有图片管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1,\"message\":\"删除成功！\"}";
		try{
			cmsImgInfoService.delete(ids);
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
	 * @param cmsimginfoId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改所有图片管理单条记录页面")
	public String getById(Model model,String cmsimginfoId,int typeKey){
		CmsImgInfo cmsimginfo = cmsImgInfoService.getById(cmsimginfoId);
		model.addAttribute("cmsimginfo", cmsimginfo);
		if(typeKey == 1){
			return "/ez/cms/cmsimginfo/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsimginfo/view";
		}else{
			return "/ez/cms/cmsimginfo/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmsimginfo
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmsimginfo_modify")
	@SystemLogController(description = "更新修改所有图片管理的信息")
	public String updateCmsImgInfo(Model model,CmsImgInfo cmsimginfo,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		try {
			if (null==cmsimginfo.getEmImageStat()){
				cmsimginfo.setEmImageStat(0);
			}
			cmsImgInfoService.modify(cmsimginfo);
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
	@RequiresPermissions("cmsimginfo_deleteall")
	@SystemLogController(description = "批量删除所有图片管理信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1,\"message\":\"删除成功！\"}";
		try {
			for (String id : ids) {
				cmsImgInfoService.delete(id);
			}
		} catch (Exception e) {
			result="{\"status\":0,\"message\":\"" +WebTool.getErrorMsg(e.getMessage())+"\"}";
			e.printStackTrace();
		}
		WebTool.writeJson(result, response);
		return null;
	}

	/**
	 * 上传图片到保存到服务器
	 * @param file
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value="uploadimg",method = RequestMethod.POST)
	@SystemLogController(description = "上传图片管理图片")
	public String headicon(@RequestParam("file") MultipartFile file, HttpServletResponse response, HttpServletRequest request){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			// 判断文件是否为空
			if (!file.isEmpty()) {
				String filename=file.getOriginalFilename();
				String filedName1= UUID.randomUUID()+filename.substring(filename.lastIndexOf("."),filename.length());
				String path=request.getSession().getServletContext().getRealPath("/")+"upload"+File.separator+"images"+ File.separator+filedName1;
				String url="/upload/images/"+filedName1;
				File dirfile =new File(request.getSession().getServletContext().getRealPath("/")+"upload"+File.separator+"images");
				if  (!dirfile.exists()  && !dirfile.isDirectory()){ dirfile.mkdir();}//如果文件夹不存在则创建
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(file.getBytes());
				fos.close();
				jsonObject.put("url",url);
				jsonObject.put("filename",filename);
			}
		} catch (Exception e) {
			jsonObject.put("msg","fail");
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

}

