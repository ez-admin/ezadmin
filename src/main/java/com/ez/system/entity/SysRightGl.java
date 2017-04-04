/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.entity;


import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2016-11-01
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysRightGl extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统管理权限表";
	public static final String ALIAS_GL_ID = "角色编号";//原系统角色有父子，取消了，重复了
	public static final String ALIAS_ROLE_ID = "角色编号";
	public static final String ALIAS_FX_QX = "fxQx";
	public static final String ALIAS_FW_QX = "fwQx";
	public static final String ALIAS_QX1 = "qx1";
	public static final String ALIAS_QX2 = "qx2";
	public static final String ALIAS_QX3 = "qx3";
	public static final String ALIAS_QX4 = "qx4";
	
	//date formats
	
	public SysRightGl(){
	}

	public SysRightGl(
		String glId
	){
		this.glId = glId;
	}

	
	//columns START
	/**角色编号==>db_column: GL_ID*/
	private String glId;
	/**角色编号==>db_column: ROLE_ID*/
	private String roleId;
	/**fxQx==>db_column: FX_QX*/
	private Integer fxQx;
	/**fwQx==>db_column: FW_QX*/
	private Integer fwQx;
	/**qx1==>db_column: QX1*/
	private Integer qx1;
	/**qx2==>db_column: QX2*/
	private Integer qx2;
	/**qx3==>db_column: QX3*/
	private Integer qx3;
	/**qx4==>db_column: QX4*/
	private Integer qx4;
	//columns END

	public void setGlId(String value) {
		this.glId = value;
	}
	
	public String getGlId() {
		return this.glId;
	}
	public void setRoleId(String value) {
		this.roleId = value;
	}
	
	public String getRoleId() {
		return this.roleId;
	}
	public void setFxQx(Integer value) {
		this.fxQx = value;
	}
	
	public Integer getFxQx() {
		return this.fxQx;
	}
	public void setFwQx(Integer value) {
		this.fwQx = value;
	}
	
	public Integer getFwQx() {
		return this.fwQx;
	}
	public void setQx1(Integer value) {
		this.qx1 = value;
	}
	
	public Integer getQx1() {
		return this.qx1;
	}
	public void setQx2(Integer value) {
		this.qx2 = value;
	}
	
	public Integer getQx2() {
		return this.qx2;
	}
	public void setQx3(Integer value) {
		this.qx3 = value;
	}
	
	public Integer getQx3() {
		return this.qx3;
	}
	public void setQx4(Integer value) {
		this.qx4 = value;
	}
	
	public Integer getQx4() {
		return this.qx4;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("GlId",getGlId())
			.append("RoleId",getRoleId())
			.append("FxQx",getFxQx())
			.append("FwQx",getFwQx())
			.append("Qx1",getQx1())
			.append("Qx2",getQx2())
			.append("Qx3",getQx3())
			.append("Qx4",getQx4())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getGlId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysRightGl == false) return false;
		if(this == obj) return true;
		SysRightGl other = (SysRightGl)obj;
		return new EqualsBuilder()
			.append(getGlId(),other.getGlId())
			.isEquals();
	}
}

