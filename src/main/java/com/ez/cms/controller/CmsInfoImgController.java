/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.ez.annotation.SystemLogController;
import com.ez.base.BaseController;
import com.ez.cms.entity.CmsInfoImg;
import com.ez.cms.service.CmsInfoImgService;
import com.ez.util.DateUtil;
import com.ez.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/cms/cmsinfoimg/")
public class CmsInfoImgController extends BaseController {

	@Autowired
	private CmsInfoImgService cmsInfoImgService;


	/**
	 * 跳到列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "跳到图片管理列表页面")
	public String list(Model model){
		return "/ez/cms/cmsinfoimg/list";
	}

	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	@SystemLogController(description = "跳到图片管理新增页面")
	public String addUI(){
		return "/ez/cms/cmsinfoimg/add";
	}
	
	/**
	 * 保存新增
	 * @param response
	 * @param cmsinfoimg
	 * @return
	 */
	@RequestMapping(value="add")
	@RequiresPermissions("cmsinfoimg_add")
	@SystemLogController(description = "保存图片管理新增信息")
	public String add(CmsInfoImg cmsinfoimg,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";
		cmsInfoImgService.add(cmsinfoimg);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * post方式分页查询
	 * @param page
	 * @param cmsinfoimg
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
	@SystemLogController(description = "跳到分页查询图片管理信息")
	public Map<String, Object> showlist(Page<CmsInfoImg> page,CmsInfoImg cmsinfoimg){
		List<CmsInfoImg> list = cmsInfoImgService.query(page, cmsinfoimg);
		PageInfo<CmsInfoImg> pageInfo = new PageInfo<CmsInfoImg>(list);
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
	@RequiresPermissions("cmsinfoimg_delete")
	@SystemLogController(description = "删除图片管理信息")
	public String deleteById(Model model,String ids, HttpServletResponse response){
		String result="{\"status\":1}";
		cmsInfoImgService.delete(ids);
		WebTool.writeJson(result, response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param cmsinfoimgId
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	@SystemLogController(description = "跳到查询&修改图片管理单条记录页面")
	public String getById(Model model,String cmsinfoimgId,int typeKey){
		CmsInfoImg cmsinfoimg = cmsInfoImgService.getById(cmsinfoimgId);
		model.addAttribute("cmsinfoimg", cmsinfoimg);
		if(typeKey == 1){
			return "/ez/cms/cmsinfoimg/edit";
		}else if(typeKey == 2){
			return "/ez/cms/cmsinfoimg/view";
		}else{
			return "/ez/cms/cmsinfoimg/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param model
	 * @param cmsinfoimg
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	@RequiresPermissions("cmsinfoimg_modify")
	@SystemLogController(description = "更新修改图片管理的信息")
	public String updateCmsInfoImg(Model model,CmsInfoImg cmsinfoimg,HttpServletResponse response){
		String result="{\"msg\":\"suc\"}";

		if (null==cmsinfoimg.getEmImageStat()){
			cmsinfoimg.setEmImageStat(0);
		}
		cmsinfoimg.setEmImageInserttime(DateUtil.getNowDate());
		cmsInfoImgService.modify(cmsinfoimg);

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
	@RequiresPermissions("cmsinfoimg_deleteall")
	@SystemLogController(description = "批量删除图片管理信息")
	public String deleteAll(String[] ids, HttpServletResponse response) {
		String result = "{\"status\":1}";
		for (String id : ids) {
			cmsInfoImgService.delete(id);
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

