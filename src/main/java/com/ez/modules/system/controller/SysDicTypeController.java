package com.ez.modules.system.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.commons.json.Entity;
import com.ez.commons.util.PubConstants;
import com.ez.modules.system.entity.SysDicType;
import com.ez.modules.system.service.SysDicTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chenez
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysdictype/")
public class SysDicTypeController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(SysDicTypeController.class);
    @Autowired
    private SysDicTypeService sysDictypeService;

    /**
     * 跳到列表页面
     * @return
     */
    @RequestMapping(value="list")
    @SystemLogController(description = "跳到字典类型列表页面")
    public String list(){
        return "/ez/system/sysdictype/list";
    }
    /**
     * 跳到新增页面
     * @return
     */
    @RequestMapping(value="addUI")
    @SystemLogController(description = "跳到字典类型新增页面")
    public String addUI(){
        return "/ez/system/sysdictype/add";
    }

    /**
     * 保存新增
     * @param sysdictype
     * @return
     */
    @RequiresPermissions("sysdictype_add")
    @RequestMapping(value="add",method = RequestMethod.POST)
    @SystemLogController(description = "保存字典类型新增信息")
    @ResponseBody
    public Map<String, Object> add(SysDicType sysdictype){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("status", PubConstants.TRUE);
        SysDicType checkcodeSysDictype = sysDictypeService.getById(sysdictype.getCode());
        SysDicType checknameSysDictype = sysDictypeService.getByName(sysdictype.getName());
        if (checkcodeSysDictype != null) {
            map.put("status", PubConstants.FALSE);
            map.put("message","字典类型编码重复,请重新输入!");
        } else if (checknameSysDictype != null) {
            map.put("status", PubConstants.FALSE);
            map.put("message","字典类型编码名称重复,请重新输入!");
        } else {
            sysDictypeService.add(sysdictype);
        }
        return map;
    }

    /**
     * post方式分页查询
     * @param page
     * @param sysdictype
     * @return map
     */
    @RequestMapping(value="showlist",method=RequestMethod.POST)
    @ResponseBody
    @SystemLogController(description = "跳到分页查询字典类型信息")
    public Map<String, Object> showlist(SysDicType sysdictype, Page<SysDicType> page){
        List<SysDicType> list = sysDictypeService.query(page, sysdictype);
        PageInfo<SysDicType> pageInfo = new PageInfo<SysDicType>(list);
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
    @RequiresPermissions("sysdictype_delete")
    @RequestMapping(value="deleteById",method=RequestMethod.POST)
    @SystemLogController(description = "删除字典类型信息")
    @ResponseBody
    public Map<String, Object> deleteById(String ids){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("status",PubConstants.TRUE);
        sysDictypeService.delete(ids);
        return map;
    }

    /**
     * 查询&修改单条记录
     * @param model
     * @param sysdictypeId
     * @param typeKey
     * @return
     */
    @RequiresPermissions(value={"sysdictype_view","sysdictype_modify"},logical= Logical.OR)
    @RequestMapping(value="getById")
    @SystemLogController(description = "跳到查询&修改字典类型单条记录页面")
    public String getById(Model model,String sysdictypeId,Integer typeKey){
        SysDicType sysdictype = sysDictypeService.getById(sysdictypeId);
        model.addAttribute("sysdictype", sysdictype);
        if(typeKey == 1){
            return "/ez/system/sysdictype/edit";
        }else if(typeKey == 2){
            return "/ez/system/sysdictype/view";
        }else{
            return "/ez/system/sysdictype/view_1";
        }
    }

    /**
     * 更新修改的信息
     * @param request
     * @param sysdictype
     * @return
     */
    @RequiresPermissions("sysdictype_modify")
    @RequestMapping(value="update",method=RequestMethod.POST)
    @SystemLogController(description = "更新修改字典类型的信息")
    @ResponseBody
    public Map<String, Object> updateSysDictype(SysDicType sysdictype, HttpServletRequest request){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("status",PubConstants.TRUE);
        String oldname=request.getParameter("oldname");
        SysDicType checknameSysDictype=sysDictypeService.getByName(sysdictype.getName());
        if(checknameSysDictype!=null && !oldname.equals(sysdictype.getName())){
            map.put("status",PubConstants.FALSE);
            map.put("message","字典类型名称重复,请重新输入!");
        }else {
            sysDictypeService.modify(sysdictype);
        }
        return map;
    }


    /**
     * 批量删除数据
     * @param ids
     * @return
     */
    @RequiresPermissions("sysdictype_deleteall")
    @RequestMapping(value = "deleteAll")
    @SystemLogController(description = "批量删除字典类型信息")
    @ResponseBody
    public Map<String, Object> deleteAll(String[] ids) {
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("status",PubConstants.TRUE);
        for (String id : ids) {
            sysDictypeService.delete(id);
        }
        return map;
    }
    /**
     * 数据字典单选下拉框
     * @param code
     * @return
     */
    @RequestMapping(value="getSdBySdtCode")
    @ResponseBody
    public Map<String,Object> getSdBySdtCode(String code){
        Map<String, Object> map=new HashMap<String, Object>();
        List<Entity> entityList = sysDictypeService.getSdBySdtCode(code);
        //创建json集合
        JSONArray jsonArray= JSONArray.fromObject(entityList);
        if (jsonArray != null && jsonArray.size()>0) {
            map.put("data",jsonArray);
        }
        return map;
    }

}

