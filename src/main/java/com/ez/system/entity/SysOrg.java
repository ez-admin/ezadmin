/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.system.entity;

import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2017-03-21
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysOrg extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*组织结构表";
	public static final String ALIAS_ORG_ID = "主键";
	public static final String ALIAS_ORG_NAME = "组织名称";
	public static final String ALIAS_ORG_DESCRIPTION = "组织节点描述";
	public static final String ALIAS_ORG_MANAGER = "组织负责人id";
	public static final String ALIAS_ORG_PHONE = "组织联系电话";
	public static final String ALIAS_ORG_PARENTID = "上级组织的ID，顶级节点的ID为0";
	public static final String ALIAS_ORG_ESTABLISH_TIME = "成立时间";
	public static final String ALIAS_ORG_PATH = "从根节点到该节点的路径；默认根节点的值为0；节点间的分割符为“-”";
	public static final String ALIAS_ORG_TYPE = "组织类型";
	
	//date formats
	public static final String FORMAT_ORG_ESTABLISH_TIME = DATE_FORMAT;
	
	public SysOrg(){
	}

	public SysOrg(
		java.lang.Integer orgId
	){
		this.orgId = orgId;
	}

	
	//columns START
	/**主键==>db_column: orgId*/
	private java.lang.Integer orgId;
	/**组织名称==>db_column: orgName*/
	private java.lang.String orgName;
	/**组织节点描述==>db_column: orgDescription*/
	private java.lang.String orgDescription;
	/**组织负责人id==>db_column: orgManager*/
	private java.lang.String orgManager;
	/**组织联系电话==>db_column: orgPhone*/
	private java.lang.String orgPhone;
	/**上级组织的ID，顶级节点的ID为0==>db_column: orgParentid*/
	private java.lang.Integer orgParentid;
	private java.util.Date orgEstablishTimeBegin;
	private java.util.Date orgEstablishTimeEnd;
	private java.util.Date orgEstablishTime;
	
	public java.util.Date getOrgEstablishTimeBegin() {
		return this.orgEstablishTimeBegin;
	}
	
	public void setOrgEstablishTimeBegin(java.util.Date value) {
		this.orgEstablishTimeBegin = value;
	}	
	
	public java.util.Date getOrgEstablishTimeEnd() {
		return this.orgEstablishTimeEnd;
	}
	
	public void setOrgEstablishTimeEnd(java.util.Date value) {
		this.orgEstablishTimeEnd = value;
	}
	
	/**从根节点到该节点的路径；默认根节点的值为0；节点间的分割符为“-”==>db_column: orgPath*/
	private java.lang.String orgPath;
	/**组织类型==>db_column: orgType*/
	private java.lang.Integer orgType;
	//columns END

	//组织负责人的姓名
	private String orgManageName;
	//根部门ID号默认为0
	public static final String ROOT_ORG_ID = "0";

	public String getOrgManageName() {
		return orgManageName;
	}

	public void setOrgManageName(String orgManageName) {
		this.orgManageName = orgManageName;
	}

	public void setOrgId(java.lang.Integer value) {
		this.orgId = value;
	}
	
	public java.lang.Integer getOrgId() {
		return this.orgId;
	}
	public void setOrgName(java.lang.String value) {
		this.orgName = value;
	}
	
	public java.lang.String getOrgName() {
		return this.orgName;
	}
	public void setOrgDescription(java.lang.String value) {
		this.orgDescription = value;
	}
	
	public java.lang.String getOrgDescription() {
		return this.orgDescription;
	}
	public void setOrgManager(java.lang.String value) {
		this.orgManager = value;
	}
	
	public java.lang.String getOrgManager() {
		return this.orgManager;
	}
	public void setOrgPhone(java.lang.String value) {
		this.orgPhone = value;
	}
	
	public java.lang.String getOrgPhone() {
		return this.orgPhone;
	}
	public void setOrgParentid(java.lang.Integer value) {
		this.orgParentid = value;
	}
	
	public java.lang.Integer getOrgParentid() {
		return this.orgParentid;
	}
	public void setOrgEstablishTime(java.util.Date value) {
		this.orgEstablishTime = value;
	}
	
	public java.util.Date getOrgEstablishTime() {
		return this.orgEstablishTime;
	}
	public void setOrgPath(java.lang.String value) {
		this.orgPath = value;
	}
	
	public java.lang.String getOrgPath() {
		return this.orgPath;
	}
	public void setOrgType(java.lang.Integer value) {
		this.orgType = value;
	}
	
	public java.lang.Integer getOrgType() {
		return this.orgType;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("OrgId",getOrgId())
			.append("OrgName",getOrgName())
			.append("OrgDescription",getOrgDescription())
			.append("OrgManager",getOrgManager())
			.append("OrgPhone",getOrgPhone())
			.append("OrgParentid",getOrgParentid())
			.append("OrgEstablishTime",getOrgEstablishTime())
			.append("OrgPath",getOrgPath())
			.append("OrgType",getOrgType())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getOrgId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysOrg == false) return false;
		if(this == obj) return true;
		SysOrg other = (SysOrg)obj;
		return new EqualsBuilder()
			.append(getOrgId(),other.getOrgId())
			.isEquals();
	}
}

