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
 * @2017-06-10
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsTag extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "标签表";
	public static final String ALIAS_CMS_TAG_ID = "标签主键id";
	public static final String ALIAS_CMS_NAME = "名称";
	public static final String ALIAS_CMS_CREATION_TIME = "操作时间";
	public static final String ALIAS_CMS_REFERS = "文档数量";
	
	//date formats
	public static final String FORMAT_CMS_CREATION_TIME = DATE_FORMAT;
	
	public CmsTag(){
	}

	public CmsTag(
		Integer cmsTagId
	){
		this.cmsTagId = cmsTagId;
	}

	
	//columns START
	/**标签主键id==>db_column: cms_tag_id*/
	private Integer cmsTagId;
	/**名称==>db_column: cms_name*/
	private String cmsName;
	private java.util.Date cmsCreationTimeBegin;
	private java.util.Date cmsCreationTimeEnd;
	private java.util.Date cmsCreationTime;
	
	public java.util.Date getCmsCreationTimeBegin() {
		return this.cmsCreationTimeBegin;
	}
	
	public void setCmsCreationTimeBegin(java.util.Date value) {
		this.cmsCreationTimeBegin = value;
	}	
	
	public java.util.Date getCmsCreationTimeEnd() {
		return this.cmsCreationTimeEnd;
	}
	
	public void setCmsCreationTimeEnd(java.util.Date value) {
		this.cmsCreationTimeEnd = value;
	}
	
	/**文档数量==>db_column: cms_refers*/
	private Integer cmsRefers;
	//columns END
	//表外字段
	private boolean isTag;//是否已经设置

	public boolean isTag() {
		return isTag;
	}

	public void setTag(boolean tag) {
		isTag = tag;
	}

	public void setCmsTagId(Integer value) {
		this.cmsTagId = value;
	}
	
	public Integer getCmsTagId() {
		return this.cmsTagId;
	}
	public void setCmsName(String value) {
		this.cmsName = value;
	}
	
	public String getCmsName() {
		return this.cmsName;
	}
	public void setCmsCreationTime(java.util.Date value) {
		this.cmsCreationTime = value;
	}
	
	public java.util.Date getCmsCreationTime() {
		return this.cmsCreationTime;
	}
	public void setCmsRefers(Integer value) {
		this.cmsRefers = value;
	}
	
	public Integer getCmsRefers() {
		return this.cmsRefers;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CmsTagId",getCmsTagId())
			.append("CmsName",getCmsName())
			.append("CmsCreationTime",getCmsCreationTime())
			.append("CmsRefers",getCmsRefers())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCmsTagId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsTag == false) return false;
		if(this == obj) return true;
		CmsTag other = (CmsTag)obj;
		return new EqualsBuilder()
			.append(getCmsTagId(),other.getCmsTagId())
			.isEquals();
	}
}

