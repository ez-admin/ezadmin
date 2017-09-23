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
 * @2017-04-29
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysUserRole extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*用户-角色";
	public static final String ALIAS_USERNO = "用户编号";
	public static final String ALIAS_ROLE_ID = "角色编号";
	
	//date formats
	
	public SysUserRole(){
	}

	public SysUserRole(
		String userno,
		String roleId
	){
		this.userno = userno;
		this.roleId = roleId;
	}

	
	//columns START
	/**用户编号==>db_column: userno*/
	private String userno;
	/**角色编号==>db_column: ROLE_ID*/
	private String roleId;
	//columns END


	public void setUserno(String value) {
		this.userno = value;
	}
	
	public String getUserno() {
		return this.userno;
	}
	public void setRoleId(String value) {
		this.roleId = value;
	}
	
	public String getRoleId() {
		return this.roleId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Userno",getUserno())
			.append("RoleId",getRoleId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getUserno())
			.append(getRoleId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysUserRole == false) return false;
		if(this == obj) return true;
		SysUserRole other = (SysUserRole)obj;
		return new EqualsBuilder()
			.append(getUserno(),other.getUserno())
			.append(getRoleId(),other.getRoleId())
			.isEquals();
	}
}

