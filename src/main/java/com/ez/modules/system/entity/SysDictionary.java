
package com.ez.modules.system.entity;


import com.ez.commons.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2017-01-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysDictionary extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统字典表";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_CODE = "字典类型编码";
	public static final String ALIAS_SDVALUE = "字典VALUE";
	public static final String ALIAS_SDKEY = "字典KEY";
	public static final String ALIAS_REMARK = "字典备注";
	
	//date formats
	
	public SysDictionary(){
	}

	public SysDictionary(
		Integer id
	){
		this.id = id;
	}

	
	//columns START
	/**id==>db_column: ID*/
	private Integer id;
	/**字典类型编码==>db_column: CODE*/
	private String code;
	/**字典VALUE==>db_column: SDVALUE*/
	private String sdvalue;
	/**字典KEY==>db_column: SDKEY*/
	private String sdkey;
	/**字典备注==>db_column: REMARK*/
	private String remark;
	//columns END
	//表外字段
	/**字典类型编码名称==>db_column: codeName*/
	private String codeName;

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setCode(String value) {
		this.code = value;
	}
	
	public String getCode() {
		return this.code;
	}
	public void setSdvalue(String value) {
		this.sdvalue = value;
	}

	public String getSdvalue() {
		return this.sdvalue;
	}
	public void setSdkey(String value) {
		this.sdkey = value;
	}
	
	public String getSdkey() {
		return this.sdkey;
	}
	public void setRemark(String value) {
		this.remark = value;
	}
	
	public String getRemark() {
		return this.remark;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Code",getCode())
			.append("Sdvalue",getSdvalue())
			.append("Sdkey",getSdkey())
			.append("Remark",getRemark())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDictionary == false) return false;
		if(this == obj) return true;
		SysDictionary other = (SysDictionary)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

