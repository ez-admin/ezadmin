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
 * @2017-04-18
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysOption extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "系统设置";
	public static final String ALIAS_OID = "参数id";
	public static final String ALIAS_OPTION_VALUE = "参数值";
	public static final String ALIAS_OPTION_NAME = "参数名称";
	public static final String ALIAS_OPTION_ORDER = "参数排序";

	//date formats
	
	public SysOption(){
	}

	public SysOption(
		String oid
	){
		this.oid = oid;
	}

	
	//columns START
	/**参数id==>db_column: oId*/
	private String oid;
	/**参数值==>db_column: optionValue*/
	private String optionValue;
	/**参数名称==>db_column: optionName*/
	private String optionName;
	/**参数排序==>db_column: optionOrder*/
	private String optionOrder;
	//columns END


	public void setOid(String value) {
		this.oid = value;
	}
	
	public String getOid() {
		return this.oid;
	}
	public void setOptionValue(String value) {
		this.optionValue = value;
	}
	
	public String getOptionValue() {
		return this.optionValue;
	}
	public void setOptionName(String value) {
		this.optionName = value;
	}
	
	public String getOptionName() {
		return this.optionName;
	}

	public String getOptionOrder() {
		return optionOrder;
	}

	public void setOptionOrder(String optionOrder) {
		this.optionOrder = optionOrder;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Oid",getOid())
			.append("OptionValue",getOptionValue())
			.append("OptionName",getOptionName())
			.append("OptionOrder",getOptionOrder())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getOid())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysOption == false) return false;
		if(this == obj) return true;
		SysOption other = (SysOption)obj;
		return new EqualsBuilder()
			.append(getOid(),other.getOid())
			.isEquals();
	}
}

