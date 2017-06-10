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

public class CmsInfoTag extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "文章标签关联表";
	public static final String ALIAS_CMS_INFO_ID = "文章id";
	public static final String ALIAS_CMS_TAG_ID = "标签id";
	
	//date formats

	
	//columns START
	/**文章id==>db_column: cms_info_id*/
	private Integer cmsInfoId;
	/**标签id==>db_column: cms_tag_id*/
	private Integer cmsTagId;
	//columns END


	public void setCmsInfoId(Integer value) {
		this.cmsInfoId = value;
	}
	
	public Integer getCmsInfoId() {
		return this.cmsInfoId;
	}
	public void setCmsTagId(Integer value) {
		this.cmsTagId = value;
	}
	
	public Integer getCmsTagId() {
		return this.cmsTagId;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CmsInfoId",getCmsInfoId())
			.append("CmsTagId",getCmsTagId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsInfoTag == false) return false;
		if(this == obj) return true;
		CmsInfoTag other = (CmsInfoTag)obj;
		return new EqualsBuilder()
			.isEquals();
	}
}

