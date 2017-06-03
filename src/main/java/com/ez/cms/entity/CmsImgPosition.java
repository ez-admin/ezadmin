/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.cms.entity;

import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2017-06-03
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsImgPosition extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "图片位置管理";
	public static final String ALIAS_POSITION_ID = " 图片位置id";
	public static final String ALIAS_POSITION_NAME = "位置名称";
	public static final String ALIAS_POSITION_DESC = "位置描述";
	public static final String ALIAS_INSERTTIME = "操作时间";
	public static final String ALIAS_TAG = "是否设置图片位置类型 0 否 1 是";
	public static final String ALIAS_POSITION_TYPE = "图片位置类型id";
	
	//date formats
	public static final String FORMAT_INSERTTIME = DATE_FORMAT;
	
	public CmsImgPosition(){
	}

	public CmsImgPosition(
		Integer positionId
	){
		this.positionId = positionId;
	}

	
	//columns START
	/** 图片位置id==>db_column: position_id*/
	private Integer positionId;
	/**位置名称==>db_column: position_name*/
	private String positionName;
	/**位置描述==>db_column: position_desc*/
	private String positionDesc;
	private java.util.Date inserttimeBegin;
	private java.util.Date inserttimeEnd;
	private java.util.Date inserttime;
	
	public java.util.Date getInserttimeBegin() {
		return this.inserttimeBegin;
	}
	
	public void setInserttimeBegin(java.util.Date value) {
		this.inserttimeBegin = value;
	}	
	
	public java.util.Date getInserttimeEnd() {
		return this.inserttimeEnd;
	}
	
	public void setInserttimeEnd(java.util.Date value) {
		this.inserttimeEnd = value;
	}
	
	/**是否设置图片位置类型 0 否 1 是==>db_column: tag*/
	private Integer tag;
	/**图片位置类型id==>db_column: position_type*/
	private Integer positionType;
	//columns END


	public void setPositionId(Integer value) {
		this.positionId = value;
	}
	
	public Integer getPositionId() {
		return this.positionId;
	}
	public void setPositionName(String value) {
		this.positionName = value;
	}
	
	public String getPositionName() {
		return this.positionName;
	}
	public void setPositionDesc(String value) {
		this.positionDesc = value;
	}
	
	public String getPositionDesc() {
		return this.positionDesc;
	}
	public void setInserttime(java.util.Date value) {
		this.inserttime = value;
	}
	
	public java.util.Date getInserttime() {
		return this.inserttime;
	}
	public void setTag(Integer value) {
		this.tag = value;
	}
	
	public Integer getTag() {
		return this.tag;
	}
	public void setPositionType(Integer value) {
		this.positionType = value;
	}
	
	public Integer getPositionType() {
		return this.positionType;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("PositionId",getPositionId())
			.append("PositionName",getPositionName())
			.append("PositionDesc",getPositionDesc())
			.append("Inserttime",getInserttime())
			.append("Tag",getTag())
			.append("PositionType",getPositionType())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getPositionId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsImgPosition == false) return false;
		if(this == obj) return true;
		CmsImgPosition other = (CmsImgPosition)obj;
		return new EqualsBuilder()
			.append(getPositionId(),other.getPositionId())
			.isEquals();
	}
}

