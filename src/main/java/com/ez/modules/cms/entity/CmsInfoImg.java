/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2017
 */

package com.ez.modules.cms.entity;

import com.ez.commons.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsInfoImg extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "图片管理";
	public static final String ALIAS_EM_IMAGE_ID = "图片id";
	public static final String ALIAS_EM_IMAGE_NAME = "图片名称";
	public static final String ALIAS_POSITION_ID = "图片所属位置id";
	public static final String ALIAS_EM_IMAGE_URL = "图片地址";
	public static final String ALIAS_EM_IMAGE_LINKURL = "图片外链";
	public static final String ALIAS_EM_IMAGE_ORDER = "排序";
	public static final String ALIAS_EM_IMAGE_INSERTTIME = "操作时间";
	public static final String ALIAS_EM_IMAGE_STAT = "发布状态 0 禁用 1 启用";
	public static final String ALIAS_EM_IMAGE_SMALL_URL = "图片缩略图";
	public static final String ALIAS_ISNOFOLLOW = "是否需要isnofollow  0：否  1：是";
	public static final String ALIAS_AUTHOR = "录入者";
	
	//date formats
	public static final String FORMAT_EM_IMAGE_INSERTTIME = DATE_FORMAT;
	
	public CmsInfoImg(){
	}

	public CmsInfoImg(
		java.lang.Integer emImageId
	){
		this.emImageId = emImageId;
	}

	
	//columns START
	/**图片id==>db_column: em_image_id*/
	private java.lang.Integer emImageId;
	/**图片名称==>db_column: em_image_name*/
	private java.lang.String emImageName;
	/**图片所属位置id==>db_column: position_id*/
	private java.lang.Integer positionId;
	/**图片地址==>db_column: em_image_url*/
	private java.lang.String emImageUrl;
	/**图片外链==>db_column: em_image_linkurl*/
	private java.lang.String emImageLinkurl;
	/**排序==>db_column: em_image_order*/
	private java.lang.Integer emImageOrder;
	private java.util.Date emImageInserttimeBegin;
	private java.util.Date emImageInserttimeEnd;
	private java.util.Date emImageInserttime;
	
	public java.util.Date getEmImageInserttimeBegin() {
		return this.emImageInserttimeBegin;
	}
	
	public void setEmImageInserttimeBegin(java.util.Date value) {
		this.emImageInserttimeBegin = value;
	}	
	
	public java.util.Date getEmImageInserttimeEnd() {
		return this.emImageInserttimeEnd;
	}
	
	public void setEmImageInserttimeEnd(java.util.Date value) {
		this.emImageInserttimeEnd = value;
	}
	
	/**发布状态 0 禁用 1 启用==>db_column: em_image_stat*/
	private java.lang.Integer emImageStat;
	/**图片缩略图==>db_column: em_image_small_url*/
	private java.lang.String emImageSmallUrl;
	/**是否需要isnofollow  0：否  1：是==>db_column: isnofollow*/
	private java.lang.Integer isnofollow;
	/**录入者==>db_column: author*/
	private java.lang.String author;
	//columns END

	//表外参数
	private String positionName;//图片位置名称
	private String authorname;//作者姓名

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getAuthorname() {
		return authorname;
	}

	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}

	public void setEmImageId(java.lang.Integer value) {
		this.emImageId = value;
	}
	
	public java.lang.Integer getEmImageId() {
		return this.emImageId;
	}
	public void setEmImageName(java.lang.String value) {
		this.emImageName = value;
	}
	
	public java.lang.String getEmImageName() {
		return this.emImageName;
	}
	public void setPositionId(java.lang.Integer value) {
		this.positionId = value;
	}
	
	public java.lang.Integer getPositionId() {
		return this.positionId;
	}
	public void setEmImageUrl(java.lang.String value) {
		this.emImageUrl = value;
	}
	
	public java.lang.String getEmImageUrl() {
		return this.emImageUrl;
	}
	public void setEmImageLinkurl(java.lang.String value) {
		this.emImageLinkurl = value;
	}
	
	public java.lang.String getEmImageLinkurl() {
		return this.emImageLinkurl;
	}
	public void setEmImageOrder(java.lang.Integer value) {
		this.emImageOrder = value;
	}
	
	public java.lang.Integer getEmImageOrder() {
		return this.emImageOrder;
	}
	public void setEmImageInserttime(java.util.Date value) {
		this.emImageInserttime = value;
	}
	
	public java.util.Date getEmImageInserttime() {
		return this.emImageInserttime;
	}
	public void setEmImageStat(java.lang.Integer value) {
		this.emImageStat = value;
	}
	
	public java.lang.Integer getEmImageStat() {
		return this.emImageStat;
	}
	public void setEmImageSmallUrl(java.lang.String value) {
		this.emImageSmallUrl = value;
	}
	
	public java.lang.String getEmImageSmallUrl() {
		return this.emImageSmallUrl;
	}
	public void setIsnofollow(java.lang.Integer value) {
		this.isnofollow = value;
	}
	
	public java.lang.Integer getIsnofollow() {
		return this.isnofollow;
	}
	public void setAuthor(java.lang.String value) {
		this.author = value;
	}
	
	public java.lang.String getAuthor() {
		return this.author;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("EmImageId",getEmImageId())
			.append("EmImageName",getEmImageName())
			.append("PositionId",getPositionId())
			.append("EmImageUrl",getEmImageUrl())
			.append("EmImageLinkurl",getEmImageLinkurl())
			.append("EmImageOrder",getEmImageOrder())
			.append("EmImageInserttime",getEmImageInserttime())
			.append("EmImageStat",getEmImageStat())
			.append("EmImageSmallUrl",getEmImageSmallUrl())
			.append("Isnofollow",getIsnofollow())
			.append("Author",getAuthor())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getEmImageId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsInfoImg == false) return false;
		if(this == obj) return true;
		CmsInfoImg other = (CmsInfoImg)obj;
		return new EqualsBuilder()
			.append(getEmImageId(),other.getEmImageId())
			.isEquals();
	}
}

