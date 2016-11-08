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
 * @2016-10-28
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysRight extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "SysRight";
	public static final String ALIAS_UID = "uid";
	public static final String ALIAS_C1 = "c1";
	public static final String ALIAS_C2 = "c2";
	public static final String ALIAS_C3 = "c3";
	public static final String ALIAS_C4 = "c4";
	public static final String ALIAS_Q1 = "q1";
	public static final String ALIAS_Q2 = "q2";
	public static final String ALIAS_Q3 = "q3";
	public static final String ALIAS_Q4 = "q4";
	
	//date formats
	
	public SysRight(){
	}

	public SysRight(
		String uid
	){
		this.uid = uid;
	}

	
	//columns START
	/**uid==>db_column: U_ID*/
	private String uid;
	/**c1==>db_column: C1*/
	private Integer c1;
	/**c2==>db_column: C2*/
	private Integer c2;
	/**c3==>db_column: C3*/
	private Integer c3;
	/**c4==>db_column: C4*/
	private Integer c4;
	/**q1==>db_column: Q1*/
	private Integer q1;
	/**q2==>db_column: Q2*/
	private Integer q2;
	/**q3==>db_column: Q3*/
	private Integer q3;
	/**q4==>db_column: Q4*/
	private Integer q4;
	//columns END

	private  String roleID;

	public String getRoleID() {
		return roleID;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
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

	public void setUid(String value) {
		this.uid = value;
	}
	
	public String getUid() {
		return this.uid;
	}
	public void setC1(Integer value) {
		this.c1 = value;
	}
	
	public Integer getC1() {
		return this.c1;
	}
	public void setC2(Integer value) {
		this.c2 = value;
	}
	
	public Integer getC2() {
		return this.c2;
	}
	public void setC3(Integer value) {
		this.c3 = value;
	}
	
	public Integer getC3() {
		return this.c3;
	}
	public void setC4(Integer value) {
		this.c4 = value;
	}
	
	public Integer getC4() {
		return this.c4;
	}
	public void setQ1(Integer value) {
		this.q1 = value;
	}
	
	public Integer getQ1() {
		return this.q1;
	}
	public void setQ2(Integer value) {
		this.q2 = value;
	}
	
	public Integer getQ2() {
		return this.q2;
	}
	public void setQ3(Integer value) {
		this.q3 = value;
	}
	
	public Integer getQ3() {
		return this.q3;
	}
	public void setQ4(Integer value) {
		this.q4 = value;
	}
	
	public Integer getQ4() {
		return this.q4;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("Uid",getUid())
			.append("C1",getC1())
			.append("C2",getC2())
			.append("C3",getC3())
			.append("C4",getC4())
			.append("Q1",getQ1())
			.append("Q2",getQ2())
			.append("Q3",getQ3())
			.append("Q4",getQ4())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getUid())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysRight == false) return false;
		if(this == obj) return true;
		SysRight other = (SysRight)obj;
		return new EqualsBuilder()
			.append(getUid(),other.getUid())
			.isEquals();
	}
}

