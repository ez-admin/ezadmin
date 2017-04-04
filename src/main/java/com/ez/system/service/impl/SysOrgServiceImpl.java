/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service.impl;

import com.ez.annotation.SystemLogService;
import com.ez.json.TreeNode;
import com.ez.system.dao.SysOrgDao;
import com.ez.system.dao.SysUserDao;
import com.ez.system.entity.SysOrg;
import com.ez.system.entity.SysUser;
import com.ez.system.service.SysOrgService;
import com.ez.util.DateUtil;
import com.ez.util.Tools;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author chenez
 * @2017-03-21
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysOrgService")
public class SysOrgServiceImpl implements SysOrgService {
	@Resource
	private SysOrgDao sysOrgDao;
	@Resource
	private SysUserDao sysUserDao;
	/**
	 * 分页查询
	 * @param page
	 * @param sysOrg
	 * @return List<SysOrg>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "分页查询组织结构表异常")
	public List<SysOrg> query(Page<SysOrg> page, SysOrg sysOrg) {
		PageHelper.startPage(page.getPageNum(),page.getPageSize(),page.getOrderBy());
		List<SysOrg> list = sysOrgDao.query(sysOrg);
		return list;
	}
	
	/**
	 * 不分页查询
	 * @param sysOrg
	 * @return List<SysOrg>
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "不分页查询组织结构表异常")
	public List<SysOrg> queryAll(SysOrg sysOrg) {
		List<SysOrg> list = sysOrgDao.query(sysOrg);
		return list;
	}
	
	/**
	 * 新增操作
	 * @param sysOrg
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")	@SystemLogService(description = "保存组织结构表异常")
	public void add(SysOrg sysOrg) {
		sysOrg.setOrgEstablishTime(DateUtil.getNowDate());
		sysOrgDao.add(sysOrg);
		SysOrg parent = sysOrgDao.getById(sysOrg.getOrgParentid()+"");
		if(parent==null){
			sysOrg.setOrgPath("0-" + sysOrg.getOrgId());
		}else{
			sysOrg.setOrgPath(parent.getOrgPath()+ "-" +sysOrg.getOrgId());
		}
		sysOrgDao.modify(sysOrg);
	}
	
	/**
	 * 新增操作
	 * @param sysOrg
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "保存组织结构表异常")
	public void addAll(SysOrg sysOrg) {
		sysOrgDao.addAll(sysOrg);
	}
	
	/**
	 * 删除操作
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@SystemLogService(description = "删除组织结构表异常")
	public void delete(String id) {
		SysOrg sysOrg=sysOrgDao.getById(id);
		//获取所有级联子部门
		List<SysOrg> childern=this.getAllChildern(sysOrg.getOrgPath(),false);
		if(childern!=null && childern.size()>0){
			for (SysOrg org : childern) {
				sysOrgDao.delete(org.getOrgId()+"");
			}

		}
		sysOrgDao.delete(sysOrg.getOrgId()+"");
	}

	public List<SysOrg> getAllChildern(String orgPath,boolean isContain) {
		if(orgPath!=null && !"".equals(orgPath)){
			SysOrg sysOrg = new SysOrg();
			if(isContain){
				sysOrg.setOrgPath(orgPath);
			}else{
				sysOrg.setOrgPath(orgPath+ "-");
			}
			return sysOrgDao.query(sysOrg);
		}
		return null;
	}
	/**
	 * 根据id查找实体类
	 * @param id
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "根据id查找组织结构表异常")
	public SysOrg getById(String id) {
		return sysOrgDao.getById(id);
	}
	
	/**
	 * 修改实体类
	 * @param sysOrg
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*
	@SystemLogService(description = "修改组织结构表异常")
	public void modify(SysOrg sysOrg) {
		sysOrgDao.modify(sysOrg);
		if (Tools.notEmpty(sysOrg.getOrgId()+"") && Tools.notEmpty(sysOrg.getOrgName())){
			SysUser sysUser=new SysUser();
			sysUser.setDptno(sysOrg.getOrgId()+"");
			sysUser.setDptnm(sysOrg.getOrgName());
			sysUserDao.modifyOrg(sysUser);
		}
	}

	/**
	 * 查找所有
	 * @return
	 */
	//@PreAuthorize("hasRole('ROLE_*')")
	@Transactional(readOnly=true)
	@SystemLogService(description = "查找所有组织结构表异常")
	public List<SysOrg> findAll() {
		return sysOrgDao.findAll();
	}

    @Override
    public TreeNode convert(SysOrg sysOrg, HttpServletRequest request, int type) {
		TreeNode node = new TreeNode();
		node.setChecked(false);
		node.setChkDisabled(false);
		node.setClick("");
		//modify by wh for 树形下拉框机构不能被选中  at 20140505 start
//		type=0表示系统默认tree数节点是可以选中的，type=1根据用户自定义是否可以让节点选中
		if(null != sysOrg){//modify by yangchao for 空指针异常 at 20140721
			if(type==0){
				node.setClickExpand(false);
			}else if(type==1){//要进行判断如果是公司那么不可以选中
				if(null != sysOrg.getOrgType()){//modify by yangchao for 空指针异常 at 20140721  //modify by yangchao for 公司不可以选中缺陷 at 20141122
					if(sysOrg.getOrgType().intValue()==0){
//						当sysOrgType=0表示默认不可选中
						node.setClickExpand(true);
					}else if(sysOrg.getOrgType().intValue()==1){
//						当sysOrgType=1表示默认可选中
						node.setClickExpand(false);
					}
				}
			}

//			List<Organization> childern = this.getChildern(sysOrg.getOrgId());
			boolean result=this.childerExist(sysOrg.getOrgId());
			if(result){
				node.setDrag(false);
			}else{
				node.setDrag(true);
			}
			node.setIcon(request.getContextPath() + "/static/plugins/zTree/qui/img/icons/group.png");
			node.setIconClose("");
			node.setIconOpen("");
			node.setId(String.valueOf(sysOrg.getOrgId()));

			node.setName(sysOrg.getOrgName());
			node.setParentId(String.valueOf(sysOrg.getOrgParentid()));
			node.setOldParentId(String.valueOf(sysOrg.getOrgParentid()));
			node.setOpen(true);
			node.setDesc(sysOrg.getOrgDescription());
			node.setManager(String.valueOf(sysOrg.getOrgManageName()));
			node.setPhone(sysOrg.getOrgPhone());
			node.setMenuType(sysOrg.getOrgType()+"");
			node.setExisted(true);
			node.setPath(sysOrg.getOrgPath());
		}

		return node;
    }

	private boolean childerExist(Integer orgId) {
		if(orgId!=null){
			SysOrg sysOrg=new SysOrg();
			sysOrg.setOrgParentid(orgId);
			List<SysOrg> list=sysOrgDao.query(sysOrg);
			if(list!=null && list.size()>0){
				return true;
			}else{
				return false;
			}
		}
		return false;
	}

}
