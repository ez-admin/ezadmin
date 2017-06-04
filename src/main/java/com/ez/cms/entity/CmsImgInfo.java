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
 * @2017-06-04
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsImgInfo extends BaseEntity implements java.io.Serializable{
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
	
	//date formats
	public static final String FORMAT_EM_IMAGE_INSERTTIME = DATE_FORMAT;
	
	public CmsImgInfo(){
	}

	public CmsImgInfo(
		Integer emImageId
	){
		this.emImageId = emImageId;
	}

	
	//columns START
	/**图片id==>db_column: em_image_id*/
	private Integer emImageId;
	/**图片名称==>db_column: em_image_name*/
	private String emImageName;
	/**图片所属位置id==>db_column: position_id*/
	private Integer positionId;
	/**图片地址==>db_column: em_image_url*/
	private String emImageUrl;
	/**图片外链==>db_column: em_image_linkurl*/
	private String emImageLinkurl;
	/**排序==>db_column: em_image_order*/
	private Integer emImageOrder;
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
	private Integer emImageStat;
	/**图片缩略图==>db_column: em_image_small_url*/
	private String emImageSmallUrl;
	/**是否需要isnofollow  0：否  1：是==>db_column: isnofollow*/
	private Integer isnofollow;
	//columns END

	//表外参数
	private String positionName;//图片位置名称

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public void setEmImageId(Integer value) {
		this.emImageId = value;
	}
	
	public Integer getEmImageId() {
		return this.emImageId;
	}
	public void setEmImageName(String value) {
		this.emImageName = value;
	}
	
	public String getEmImageName() {
		return this.emImageName;
	}
	public void setPositionId(Integer value) {
		this.positionId = value;
	}
	
	public Integer getPositionId() {
		return this.positionId;
	}
	public void setEmImageUrl(String value) {
		this.emImageUrl = value;
	}
	
	public String getEmImageUrl() {
		return this.emImageUrl;
	}
	public void setEmImageLinkurl(String value) {
		this.emImageLinkurl = value;
	}
	
	public String getEmImageLinkurl() {
		return this.emImageLinkurl;
	}
	public void setEmImageOrder(Integer value) {
		this.emImageOrder = value;
	}
	
	public Integer getEmImageOrder() {
		return this.emImageOrder;
	}
	public void setEmImageInserttime(java.util.Date value) {
		this.emImageInserttime = value;
	}
	
	public java.util.Date getEmImageInserttime() {
		return this.emImageInserttime;
	}
	public void setEmImageStat(Integer value) {
		this.emImageStat = value;
	}
	
	public Integer getEmImageStat() {
		return this.emImageStat;
	}
	public void setEmImageSmallUrl(String value) {
		this.emImageSmallUrl = value;
	}
	
	public String getEmImageSmallUrl() {
		return this.emImageSmallUrl;
	}
	public void setIsnofollow(Integer value) {
		this.isnofollow = value;
	}
	
	public Integer getIsnofollow() {
		return this.isnofollow;
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
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getEmImageId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsImgInfo == false) return false;
		if(this == obj) return true;
		CmsImgInfo other = (CmsImgInfo)obj;
		return new EqualsBuilder()
			.append(getEmImageId(),other.getEmImageId())
			.isEquals();
	}
}

