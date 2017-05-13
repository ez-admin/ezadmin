/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.service.impl;

import com.ez.base.service.impl.BaseServiceImpl;
import com.ez.system.dao.SysMenuDao;
import com.ez.system.dao.SysRoleDao;
import com.ez.system.dao.SysUserDao;
import com.ez.system.dao.SysUserRoleDao;
import com.ez.system.entity.SysMenu;
import com.ez.system.entity.SysUser;
import com.ez.system.entity.SysUserRole;
import com.ez.system.service.SysUserRoleService;
import com.ez.util.Common;
import com.ez.util.RightsHelper;
import com.ez.util.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author chenez
 * @2017-04-29
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
@Transactional
@Service("sysUserRoleService")
public class SysUserRoleServiceImpl extends BaseServiceImpl<SysUserRole> implements SysUserRoleService {
	@Autowired
	private SysUserRoleDao sysUserRoleDao;
    @Autowired
    private SysMenuDao sysMenuDao;
    @Autowired
    private SysRoleDao sysRoleDao;
    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public List<SysUserRole> findById(String userno) {
        return sysUserRoleDao.findById(userno);
    }

    @Override
    public void assignrole(String[] roleIds, SysUserRole sysUserRole) {
        //modify user's roles
        sysUserRoleDao.delete(sysUserRole.getUserno());
        List<SysMenu> allmenuList=sysMenuDao.findAllList();
        for(int i=0; i < roleIds.length;i++){
            sysUserRole.setRoleId(roleIds[i]);
            sysUserRoleDao.add(sysUserRole);
            String roleRights=sysRoleDao.getById(roleIds[i].toString()).getRights();
            for (SysMenu sysMenu : allmenuList) {
                Boolean ishasmenu=RightsHelper.testRights(roleRights, sysMenu.getMenuId());
                if (!sysMenu.isHasMenu()){
                    sysMenu.setHasMenu(ishasmenu);
                }
            }
        }
        String rights= Common.listMenutoRight(allmenuList);
        SysUser sysuser=new SysUser();
        sysuser.setUserno(sysUserRole.getUserno());
        sysuser.setOpright(rights);
        sysUserDao.modify(sysuser);
    }

    @Override
    public List<SysUserRole> findByRoleid(String ids) {
        return sysUserRoleDao.findByRoleid(ids);
    }
}
