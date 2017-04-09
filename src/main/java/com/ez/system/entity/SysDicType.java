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
 * @2017-01-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysDicType extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统字典表类型";
	public static final String ALIAS_CODE = "字典类型编号";
	public static final String ALIAS_NAME = "字典类型名称";
	public static final String ALIAS_REMARK = "字典备注说明";
	public static final String ALIAS_FLAG = "字典使用标识，是否使用";
	
	//date formats
	
	public SysDicType(){
	}

	public SysDicType(
		String code
	){
		this.code = code;
	}

	
	//columns START
	/**字典类型编号==>db_column: CODE*/
	private String code;
	/**字典类型名称==>db_column: NAME*/
	private String name;
	/**字典备注说明==>db_column: REMARK*/
	private String remark;
	/**字典使用标识，是否使用==>db_column: FLAG*/
	private String flag;
	//columns END
	

	public void setCode(String value) {
		this.code = value;
	}
	
	public String getCode() {
		return this.code;
	}
	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return this.name;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}
	public void setFlag(String value) {
		this.flag = value;
	}
	
	public String getFlag() {
		return this.flag;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("Code",getCode())
			.append("Name",getName())
			.append("Remark",getRemark())
			.append("Flag",getFlag())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCode())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDicType == false) return false;
		if(this == obj) return true;
		SysDicType other = (SysDicType)obj;
		return new EqualsBuilder()
			.append(getCode(),other.getCode())
			.isEquals();
	}
}

