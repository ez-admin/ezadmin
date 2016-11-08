package com.ez.system.entity;


import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2016-10-28
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
	public static final String ALIAS_PARENT_ID = "parentId";
	public static final String ALIAS_ADD_QX = "addQx";
	public static final String ALIAS_DEL_QX = "delQx";
	public static final String ALIAS_EDIT_QX = "editQx";
	public static final String ALIAS_CHA_QX = "chaQx";
	public static final String ALIAS_QX_ID = "qxId";
	
	//date formats
	
	public SysRole(){
	}

	public SysRole(
		String roleId
	){
		this.roleId = roleId;
	}

	
	//columns START
	/**roleId==>db_column: ROLE_ID*/
	private String roleId;
	/**roleName==>db_column: ROLE_NAME*/
	private String roleName;
	/**rights==>db_column: RIGHTS*/
	private String rights;
	/**parentId==>db_column: PARENT_ID*/
	private String parentId;
	/**addQx==>db_column: ADD_QX*/
	private String addQx;
	/**delQx==>db_column: DEL_QX*/
	private String delQx;
	/**editQx==>db_column: EDIT_QX*/
	private String editQx;
	/**chaQx==>db_column: CHA_QX*/
	private String chaQx;
	/**qxId==>db_column: QX_ID*/
	private String qxId;
	//columns END
	
	//系统框架字段 start
	
	private String sort;
	private String direction;
	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getDirection() {
		return direction;
	}
	
	public void setDirection(String direction) {
		this.direction = direction;
	}
	//系统框架字段 end

	public void setRoleId(String value) {
		this.roleId = value;
	}
	
	public String getRoleId() {
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
	public void setParentId(String value) {
		this.parentId = value;
	}
	
	public String getParentId() {
		return this.parentId;
	}
	public void setAddQx(String value) {
		this.addQx = value;
	}
	
	public String getAddQx() {
		return this.addQx;
	}
	public void setDelQx(String value) {
		this.delQx = value;
	}
	
	public String getDelQx() {
		return this.delQx;
	}
	public void setEditQx(String value) {
		this.editQx = value;
	}
	
	public String getEditQx() {
		return this.editQx;
	}
	public void setChaQx(String value) {
		this.chaQx = value;
	}
	
	public String getChaQx() {
		return this.chaQx;
	}
	public void setQxId(String value) {
		this.qxId = value;
	}
	
	public String getQxId() {
		return this.qxId;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("RoleId",getRoleId())
			.append("RoleName",getRoleName())
			.append("Rights",getRights())
			.append("ParentId",getParentId())
			.append("AddQx",getAddQx())
			.append("DelQx",getDelQx())
			.append("EditQx",getEditQx())
			.append("ChaQx",getChaQx())
			.append("QxId",getQxId())
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

