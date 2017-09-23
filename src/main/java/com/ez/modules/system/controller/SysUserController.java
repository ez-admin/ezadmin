package com.ez.modules.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.util.*;
import com.ez.modules.system.entity.SysRole;
import com.ez.modules.system.entity.SysUser;
import com.ez.modules.system.entity.SysUserRole;
import com.ez.modules.system.service.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

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

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysOrgService sysOrgService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private SysCityService sysCityService;
	/**
	 * 跳到列表页面
	 * @return
	 */
	@RequestMapping(value="list")
	@SystemLogController(description = "获取系统用户列表页面")
	public String list(Model model){
		return "/ez/system/sysuser/list";
	}


	/**
	 * 跳到新增页面
	 * @return
	 */
	@RequestMapping(value="addUI")
	public String addUI(Model model){
		String companyList=sysOrgService.findAllCompany(null);
		String dptList=sysOrgService.findAllDpt(null);
		model.addAttribute("companyList",companyList);
		model.addAttribute("dptList",dptList);
		return "ez/system/sysuser/add";
	}

	/**
	 * 保存新增
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(SysUser sysuser,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			String userno= WaterIdGener.getWaterId();
			sysuser.setUserno(userno);
			if (!"1".equals(sysuser.getIsused())){
				sysuser.setIsused("0");
			}
			sysuser.setUptdate(FormatDateUtil.getFormatDate("yyyy-MM-dd"));
			sysUserService.add(sysuser);
		} catch (Exception e) {
			jsonObject.put("msg","fail");
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		 WebTool.writeJson(jsonObject.toString(), response);
		 return null;
	}


	/**
	 * post方式分页查询
	 * @param page
	 * @param sysuser
	 * @return map
	 */
	@RequestMapping(value="showlist",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showlist(SysUser sysuser, Page<SysUser> page){
		List<SysUser> list = sysUserService.query(page, sysuser);
		PageInfo<SysUser> pageInfo = new PageInfo<SysUser>(list);
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
	@RequestMapping(value="deleteById",method=RequestMethod.POST)
	public String deleteById(String ids, HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("status",1);
		jsonObject.put("message","删除成功！");
		try{
			sysUserService.delete(ids);
		}catch(Exception e){
			jsonObject.put("status",0);
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}
	
	/**
	 * 查询&修改单条记录
	 * @param model
	 * @param userno
	 * @param typeKey
	 * @return
	 */
	@RequestMapping(value="getById")
	public String getById(Model model,String userno,int typeKey){
		SysUser sysuser = sysUserService.getById(userno);
		String companyList=sysOrgService.findAllCompany(sysuser.getCompanyno());
		String dptList=sysOrgService.findAllDpt(sysuser.getDptno());
		model.addAttribute("sysUser", sysuser);
		model.addAttribute("companyList",companyList);
		model.addAttribute("dptList",dptList);
		if (Tools.notEmpty(sysuser.getLocation())){
			String quiz2=sysCityService.getById(sysuser.getLocation()).getParentId().toString();
			String quiz1=sysCityService.getById(quiz2).getParentId().toString();
			model.addAttribute("quiz1",quiz1);
			model.addAttribute("quiz2",quiz2);
		}
		if(typeKey == 1){
			return "ez/system/sysuser/edit";
		}else if(typeKey == 2){
			return "ez/system/sysuser/view";
		}else{
			return "ez/system/sysuser/view_1";
		}
	}
	
	/**
	 * 更新修改的信息
	 * @param sysuser
	 * @return
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String updateSysUser(SysUser sysuser,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			if (!"1".equals(sysuser.getIsused())){
				sysuser.setIsused("0");
			}
			sysuser.setUptdate(FormatDateUtil.getFormatDate("yyyy-MM-dd"));
			sysUserService.modify(sysuser);
		} catch (Exception e) {
			jsonObject.put("msg","fail");
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		 WebTool.writeJson(jsonObject.toString(), response);
		 return null;		
	}
	
	
	/**
	 * 批量删除数据
	 *
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "deleteAll")
	@SystemLogController(description = "批量删除角色数据")
	public String deleteAll(String[] ids,HttpServletResponse response) {
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("status",1);
		jsonObject.put("message","删除成功！");
		try {
			for (String id : ids) {
				sysUserService.delete(id);
			}
		} catch (Exception e) {
			jsonObject.put("status",0);
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	/**
	 * 跳转到分配角色页面
	 * @param model
	 * @param userno
	 * @return
	 */
	@RequestMapping(value = "assignrolelist")
	@SystemLogController(description = "跳转到分配角色页面")
	public String assignroleList (Model model,String userno){
		List<SysUserRole> sysUserRoleList = sysUserRoleService.findById(userno);
		List<SysRole> sysRoleList=sysRoleService.findAll();
		if (null!=sysRoleList && sysRoleList.size()>0){
			for (SysRole sysRole:sysRoleList){
				if (null!=sysUserRoleList && sysUserRoleList.size()>0){
					for (SysUserRole sysUserRole:sysUserRoleList){
						if (sysRole.getRoleId().equals(sysUserRole.getRoleId())){
							sysRole.setHasRole(true);
						}
					}
				}
			}
		}
		model.addAttribute("sysRoleList",sysRoleList);
		model.addAttribute("userno",userno);
		return "ez/system/sysuser/assignrolelist";
	}

	/**
	 * modify the roles and rights of user by chenez 20170430
	 * @param sysUserRole
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value="assignrole",method=RequestMethod.POST)
	public String assignrole(SysUserRole sysUserRole,HttpServletResponse response,HttpServletRequest request){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			String[] roleIds = request.getParameterValues("roleId");
			sysUserRoleService.assignrole(roleIds,sysUserRole);
		} catch (Exception e) {
			jsonObject.put("msg","fail");
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}

	/**
	 * 跳转个人信息设置页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="persetting")
	@SystemLogController(description = "跳转个人信息设置页面")
	public String persetting(Model model){
		Session session=SecurityUtils.getSubject().getSession();
		SysUser sysUser=(SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
		SysUser sysuser=sysUserService.getById(sysUser.getUserno());
		String companyList=sysOrgService.findAllCompany(sysUser.getCompanyno());
		String dptList=sysOrgService.findAllDpt(sysUser.getDptno());
		model.addAttribute("sysuser", sysUser);
		model.addAttribute("companyList",companyList);
		model.addAttribute("dptList",dptList);
		return "/ez/system/sysuser/persetting";
	}

	/**
	 * 用户个人设置自己的头像
	 * @param img
	 * @param response
	 * @return
	 */
	@RequestMapping(value="usericon")
	@SystemLogController(description = "设置个人头像")
	public String usericon(String img,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			if (null!=img){
				Session session=SecurityUtils.getSubject().getSession();
				SysUser sysUser=(SysUser)session.getAttribute(PubConstants.SESSION_SYSUSER);
				SysUser sysUser1=new SysUser();
				sysUser1.setUserno(sysUser.getUserno());
				sysUser1.setUsericom(img);
				sysUserService.modify(sysUser1);
				sysUser.setUsericom(img);
			}else {
				jsonObject.put("msg","fail");
				jsonObject.put("message","图片数据传输失败，请联系管理员!");
			}
		} catch (Exception e) {
			jsonObject.put("msg","fail");
			jsonObject.put("message",WebTool.getErrorMsg(e.getMessage()));
			e.printStackTrace();
		}
		WebTool.writeJson(jsonObject.toString(), response);
		return null;
	}
	@RequestMapping(value="headicon",method = RequestMethod.POST)
	@SystemLogController(description = "设置用户头像")
	public String headicon(@RequestParam("file") MultipartFile file,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("msg","suc");
		try {
			// 判断文件是否为空
			if (!file.isEmpty()) {
				BASE64Encoder encoder = new BASE64Encoder();
				// 通过base64来转化图片
				String base64 = encoder.encode(file.getBytes());
				//拼装imgsrcurl
				String dataurl="data:"+file.getContentType()+";base64,"+base64;
				jsonObject.put("url",dataurl);
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

