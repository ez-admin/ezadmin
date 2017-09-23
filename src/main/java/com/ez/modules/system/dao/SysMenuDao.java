/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.dao;

import com.ez.commons.base.BaseDao;
import com.ez.modules.login.entity.MenuTitle;
import com.ez.modules.system.entity.SysMenu;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */
public interface SysMenuDao extends BaseDao<SysMenu> {
	List<SysMenu> findAllByParentid(String parentId) throws DataAccessException;

	List<String> findParentIdList() throws DataAccessException;

	List<SysMenu> findAllList() throws DataAccessException;

    List<MenuTitle> findFisrtMenu() throws DataAccessException;

	List<MenuTitle> getByParentId(String parentid) throws DataAccessException;

	List<SysMenu> getParentMenu(SysMenu sysmenu) throws DataAccessException;

	List<SysMenu> getChildrenMenu(SysMenu sysmenu) throws DataAccessException;

	List<SysMenu> findAllListMenu(SysMenu sysMenu) throws DataAccessException;

    List<String> findmenuids() throws DataAccessException;

	List<SysMenu> findAllMenuList() throws DataAccessException;

}
