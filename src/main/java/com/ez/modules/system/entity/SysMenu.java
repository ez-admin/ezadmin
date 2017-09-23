/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.entity;


import com.ez.commons.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import java.util.List;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysMenu extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统菜单表";
	public static final String ALIAS_MENU_ID = "菜单主键";
	public static final String ALIAS_MENU_NAME = "菜单名称";
	public static final String ALIAS_MENU_URL = "菜单地址";
	public static final String ALIAS_PARENT_ID = "父级ID";
	public static final String ALIAS_MENU_ORDER = "菜单顺序";
	public static final String ALIAS_MENU_ICON = "菜单图标";
	public static final String ALIAS_MENU_TYPE = "菜单类型";
	
	//date formats
	
	public SysMenu(){
	}

	public SysMenu(
		Integer menuId
	){
		this.menuId = menuId;
	}

	
	//columns START
	/**菜单主键==>db_column: MENU_ID*/
	private Integer menuId;
	/**菜单名称==>db_column: MENU_NAME*/
	private String menuName;
	/**菜单地址==>db_column: MENU_URL*/
	private String menuUrl;
	/**父级ID==>db_column: PARENT_ID*/
	private String parentId;
	/**菜单顺序==>db_column: MENU_ORDER*/
	private String menuOrder;
	/**菜单图标==>db_column: MENU_ICON*/
	private String menuIcon;
	/**菜单类型==>db_column: MENU_TYPE*/
	private String menuType;
	//columns END

	private List<SysMenu> menuList;

	private boolean hasMenu = false;

	public void setMenuId(Integer value) {
		this.menuId = value;
	}
	
	public Integer getMenuId() {
		return this.menuId;
	}
	public void setMenuName(String value) {
		this.menuName = value;
	}
	
	public String getMenuName() {
		return this.menuName;
	}
	public void setMenuUrl(String value) {
		this.menuUrl = value;
	}
	
	public String getMenuUrl() {
		return this.menuUrl;
	}
	public void setParentId(String value) {
		this.parentId = value;
	}
	
	public String getParentId() {
		return this.parentId;
	}
	public void setMenuOrder(String value) {
		this.menuOrder = value;
	}
	
	public String getMenuOrder() {
		return this.menuOrder;
	}
	public void setMenuIcon(String value) {
		this.menuIcon = value;
	}
	
	public String getMenuIcon() {
		return this.menuIcon;
	}
	public void setMenuType(String value) {
		this.menuType = value;
	}
	
	public String getMenuType() {
		return this.menuType;
	}

	public boolean isHasMenu() {
		return hasMenu;
	}

	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}

	public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	@Override
	public String toString() {
		return "SysMenu{" +
				"menuId=" + menuId +
				", menuName='" + menuName + '\'' +
				", menuUrl='" + menuUrl + '\'' +
				", parentId='" + parentId + '\'' +
				", menuOrder='" + menuOrder + '\'' +
				", menuIcon='" + menuIcon + '\'' +
				", menuType='" + menuType + '\'' +
				", menuList=" + menuList +
				", hasMenu=" + hasMenu +
				'}';
	}

	public int hashCode() {
		return new HashCodeBuilder()
			.append(getMenuId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysMenu == false) return false;
		if(this == obj) return true;
		SysMenu other = (SysMenu)obj;
		return new EqualsBuilder()
			.append(getMenuId(),other.getMenuId())
			.isEquals();
	}
}

