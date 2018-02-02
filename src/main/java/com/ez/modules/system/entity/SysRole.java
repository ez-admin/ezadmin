/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.system.entity;

import com.ez.commons.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2017-11-17
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysRole extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统角色表";
	public static final String ALIAS_ROLE_ID = "roleId";
	public static final String ALIAS_ROLE_NAME = "roleName";
	public static final String ALIAS_RIGHTS = "rights";
	public static final String ALIAS_ROLE_LVEL = "角色等级";
	
	//date formats
	
	public SysRole(){
	}

	public SysRole(
		Integer roleId
	){
		this.roleId = roleId;
	}

	
	//columns START
	/**角色id==>db_column: ROLE_ID*/
	private Integer roleId;
	/**角色名称==>db_column: ROLE_NAME*/
	private String roleName;
	/**角色权限==>db_column: RIGHTS*/
	private String rights;
	/**角色等级==>db_column: ROLE_LVEL*/
	private Integer roleLvel;
	//columns END

	private boolean hasRole=false;

	public void setRoleId(Integer value) {
		this.roleId = value;
	}
	
	public Integer getRoleId() {
		return this.roleId;
	}
	public void setRoleName(String value) {
		this.roleName = value;
	}
	
	public String getRoleName() {
		return this.roleName;
	}
	public void setRights(String value) {
		this.rights = value;
	}
	
	public String getRights() {
		return this.rights;
	}
	public void setRoleLvel(Integer value) {
		this.roleLvel = value;
	}
	
	public Integer getRoleLvel() {
		return this.roleLvel;
	}

	public boolean isHasRole() {
		return hasRole;
	}

	public void setHasRole(boolean hasRole) {
		this.hasRole = hasRole;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("RoleId",getRoleId())
			.append("RoleName",getRoleName())
			.append("Rights",getRights())
			.append("RoleLvel",getRoleLvel())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getRoleId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysRole == false) return false;
		if(this == obj) return true;
		SysRole other = (SysRole)obj;
		return new EqualsBuilder()
			.append(getRoleId(),other.getRoleId())
			.isEquals();
	}
}

