/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */


package com.ez.modules.system.controller;

import com.ez.commons.annotation.SystemLogController;
import com.ez.commons.base.BaseController;
import com.ez.modules.system.entity.SysDicType;
import com.ez.modules.system.service.SysDicTypeService;
import com.ez.commons.util.WebTool;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
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
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Controller
@RequestMapping(value="/ez/system/sysdictype/")
public class SysDicTypeController extends BaseController {

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
     * @param model
     * @param sysdictype
     * @return
     */
    @RequestMapping(value="add")
    @SystemLogController(description = "保存字典类型新增信息")
    public String add(Model model, SysDicType sysdictype, HttpServletResponse response, HttpServletRequest request){
        String result="{\"msg\":\"suc\"}";
        SysDicType checkcodeSysDictype = sysDictypeService.getById(sysdictype.getCode());
        SysDicType checknameSysDictype = sysDictypeService.getByName(sysdictype.getName());
        if (checkcodeSysDictype != null) {
            result = "{\"msg\":\"fail\",\"message\":\"字典类型编码重复,请重新输入!\"}";
        } else if (checknameSysDictype != null) {
            result = "{\"msg\":\"fail\",\"message\":\"字符类型名称重复,请重新输入!\"}";
        } else {
            if (!"1".equals(sysdictype.getFlag())) {
                sysdictype.setFlag("0");
            }
            sysDictypeService.add(sysdictype);
        }
        WebTool.writeJson(result, response);
        return null;
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
     * @param model
     * @param ids
     * @return
     */
    @RequestMapping(value="deleteById",method=RequestMethod.POST)
    @SystemLogController(description = "删除字典类型信息")
    public String deleteById(Model model,String ids, HttpServletResponse response){
        String result="{\"status\":1}";
        sysDictypeService.delete(ids);
        WebTool.writeJson(result, response);
        return null;
    }

    /**
     * 查询&修改单条记录
     * @param model
     * @param sysdictypeId
     * @param typeKey
     * @return
     */
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
    @RequestMapping(value="update",method=RequestMethod.POST)
    @SystemLogController(description = "更新修改字典类型的信息")
    public String updateSysDictype(SysDicType sysdictype, HttpServletRequest request, HttpServletResponse response){
        String result="{\"msg\":\"suc\"}";
        String oldname=request.getParameter("oldname");
        SysDicType checknameSysDictype=sysDictypeService.getByName(sysdictype.getName());
        if(checknameSysDictype!=null && !oldname.equals(sysdictype.getName())){
            result="{\"msg\":\"fail\",\"message\":\"字符类型名称重复,请重新输入!\"}";
        }else {
            if (!"1".equals(sysdictype.getFlag())){
                sysdictype.setFlag("0");
            }
            sysDictypeService.modify(sysdictype);
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
    @SystemLogController(description = "批量删除字典类型信息")
    public String deleteAll(String[] ids, Model model, HttpServletResponse response) {
        String result = "{\"status\":1}";
        for (String id : ids) {
            sysDictypeService.delete(id);
        }
        WebTool.writeJson(result, response);
        return null;
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
        List<SysDicType> sysDictypes = sysDictypeService.getSdBySdtCode(code);
        String result="";
        for(SysDicType sd : sysDictypes) {
            if (selected!=null  && selected.equals(sd.getCode())){
                result+="<option value="+sd.getCode()+" selected >"+sd.getName()+"</option>";
            }else {
                result+="<option value="+sd.getCode()+">"+sd.getName()+"</option>";
            }
        }
        WebTool.writeHtml(result, response);
        return null;
    }

}

