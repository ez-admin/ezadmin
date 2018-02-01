
package com.ez.modules.system.service;

import com.ez.commons.base.service.BaseService;
import com.ez.modules.login.entity.MenuTitle;
import com.ez.modules.system.entity.SysDicType;
import com.ez.modules.system.entity.SysMenu;
import com.github.pagehelper.Page;
import org.apache.shiro.session.Session;

import java.util.List;
/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public interface SysMenuService extends BaseService<SysMenu> {

    List<SysMenu> getParentMenu(Page<SysMenu> page, SysMenu sysmenu);

	List<SysMenu> getChildrenMenu(Page<SysMenu> page,SysMenu sysmenu);

    List<SysMenu> getParentMenuAll(SysMenu sysmenu);

	List<SysMenu> getChildrenMenuAll(SysMenu sysmenu);

	List<SysMenu> listAllMenuButton(String rights);

    List<String> findmenuids();

	List<SysMenu> findMenuList(String userRights, Session session);
}
