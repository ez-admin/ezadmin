package com.ez.modules.cms.service.impl;

import com.ez.commons.annotation.ServiceImplClassDescription;
import com.ez.commons.annotation.SystemLogService;
import com.ez.commons.base.service.impl.BaseServiceImpl;
import com.ez.modules.cms.dao.CmsNodeDao;
import com.ez.modules.cms.entity.CmsNode;
import com.ez.modules.cms.service.CmsNodeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("cmsNodeService")
@ServiceImplClassDescription(description = "栏目管理")
public class CmsNodeServiceImpl extends BaseServiceImpl<CmsNode> implements CmsNodeService {
	@Autowired
	private CmsNodeDao cmsNodeDao;


    @Override
    @SystemLogService(description = "不分页查询一级栏目管理异常")
    public List<CmsNode> getParentcityList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.getParentcity(cmsNode);
        return list;
    }

    @Override
    @SystemLogService(description = "不分页查询全部栏目管理异常")
    public List<CmsNode> queryList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.query(cmsNode);
        return list;
    }

    @Override
    @SystemLogService(description = "不分页查询下级栏目管理异常")
    public List<CmsNode> getChildrenCityList(Page<CmsNode> page, CmsNode cmsNode) {
        PageHelper.orderBy(page.getOrderBy());
        List<CmsNode> list=cmsNodeDao.getChildrenCityList(cmsNode);
        return list;
    }

    @Override
    public String findAllCmsNode(String selected) {
        String result="";
        List<CmsNode> list =cmsNodeDao.findAllCmsNode();
        if (list!=null && list.size()>0){
            for(CmsNode cmsNode : list) {
                if (selected != null  && selected.equals(cmsNode.getCmsNodeId().toString())){
                    if (0==cmsNode.getCmsNodeParentId()){
                        result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\" selected >"+cmsNode.getCmsNodeName()+"</option>";
                    }else {
                        result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\" parent=\""+cmsNode.getCmsNodeParentId().toString()+"\" selected >"+cmsNode.getCmsNodeName()+"</option>";
                    }
                }else {
                    if (0==cmsNode.getCmsNodeParentId()){//一级菜单
                        if( isMostDetail(cmsNode.getCmsNodeId()) ){//最明细菜单
                            result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\"  disabled>"+cmsNode.getCmsNodeName()+"</option>";
                        }else {
                            result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\">"+cmsNode.getCmsNodeName()+"</option>";
                        }
                    }else {//非一级菜单
                        if( isMostDetail(cmsNode.getCmsNodeId()) ){//最明细菜单
                            result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\" parent=\""+cmsNode.getCmsNodeParentId().toString()+"\" disabled>"+cmsNode.getCmsNodeName()+"</option>";
                        }else {
                            result+="<option value=\""+cmsNode.getCmsNodeId().toString()+"\" parent=\""+cmsNode.getCmsNodeParentId().toString()+"\" >"+cmsNode.getCmsNodeName()+"</option>";
                        }
                    }
                }
            }
        }
        return result;
    }

    /**
     * @auther chenez
     * @description 通过栏目主键id查询该 栏目下是否有子栏目
     * @date 2017/6/7  11:54
     * @param cmsNodeId
     * @return
     */
    public boolean isMostDetail(int cmsNodeId){
        boolean isMostDetail=true;
        CmsNode cmsNode=new CmsNode();
        cmsNode.setCmsNodeParentId(cmsNodeId);
        List<CmsNode> cmsNodes=cmsNodeDao.getChildrenCityList(cmsNode);
        if (null != cmsNodes && cmsNodes.size()==0){
            isMostDetail=false;
        }
        return isMostDetail;
    }
}
