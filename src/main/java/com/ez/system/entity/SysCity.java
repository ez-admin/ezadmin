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
 * @2017-05-13
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysCity extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "城市区域表";
	public static final String ALIAS_ID = "主键id";
	public static final String ALIAS_NAME = "城市名";
	public static final String ALIAS_PARENT_ID = "父级id";
	
	//date formats
	
	public SysCity(){
	}

	public SysCity(
		Integer id
	){
		this.id = id;
	}

	
	//columns START
	/**主键id==>db_column: id*/
	private Integer id;
	/**城市名==>db_column: name*/
	private String name;
	/**父级id==>db_column: parentId*/
	private Integer parentId;
	//columns END


	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return this.name;
	}

	public void setParentId(Integer value) {
		this.parentId = value;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("ParentId",getParentId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysCity == false) return false;
		if(this == obj) return true;
		SysCity other = (SysCity)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

