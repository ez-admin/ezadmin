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
 * @2017-06-23
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsInfoVideo extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "视频管理";
	public static final String ALIAS_EM_VIDEO_ID = "视频主键ID";
	public static final String ALIAS_POSITION_ID = "视频位置id";
	public static final String ALIAS_EM_VIDEO_TITLE = "标题";
	public static final String ALIAS_EM_VIDEO_PICPATH = "标题图";
	public static final String ALIAS_EM_VIDEO_PATH = "视频";
	public static final String ALIAS_EM_VIDEO_ORDER = "视频排序";
	public static final String ALIAS_EM_VIDEO_STAT = "发布状态 0 禁用 1 启用";
	public static final String ALIAS_AUTHOR = "录入者";
	public static final String ALIAS_EM_VIDEO_INSERTTIME = "录入时间";
	
	//date formats
	public static final String FORMAT_EM_VIDEO_INSERTTIME = DATE_FORMAT;
	
	public CmsInfoVideo(){
	}

	public CmsInfoVideo(
		Integer emVideoId
	){
		this.emVideoId = emVideoId;
	}

	
	//columns START
	/**视频主键ID==>db_column: em_video_id*/
	private Integer emVideoId;
	/**视频位置id==>db_column: position_id*/
	private Integer positionId;
	/**标题==>db_column: em_video_title*/
	private String emVideoTitle;
	/**标题图==>db_column: em_video_picpath*/
	private String emVideoPicpath;
	/**视频==>db_column: em_video_path*/
	private String emVideoPath;
	/**视频排序==>db_column: em_video_order*/
	private Integer emVideoOrder;
	/**发布状态 0 禁用 1 启用==>db_column: em_video_stat*/
	private Integer emVideoStat;
	/**录入者==>db_column: author*/
	private String author;
	private java.util.Date emVideoInserttimeBegin;
	private java.util.Date emVideoInserttimeEnd;
	private java.util.Date emVideoInserttime;
	
	public java.util.Date getEmVideoInserttimeBegin() {
		return this.emVideoInserttimeBegin;
	}
	
	public void setEmVideoInserttimeBegin(java.util.Date value) {
		this.emVideoInserttimeBegin = value;
	}	
	
	public java.util.Date getEmVideoInserttimeEnd() {
		return this.emVideoInserttimeEnd;
	}
	
	public void setEmVideoInserttimeEnd(java.util.Date value) {
		this.emVideoInserttimeEnd = value;
	}
	
	//columns END
	//表外字段
	private String positionName;//位置名称
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

	public void setEmVideoId(Integer value) {
		this.emVideoId = value;
	}
	
	public Integer getEmVideoId() {
		return this.emVideoId;
	}
	public void setPositionId(Integer value) {
		this.positionId = value;
	}
	
	public Integer getPositionId() {
		return this.positionId;
	}
	public void setEmVideoTitle(String value) {
		this.emVideoTitle = value;
	}
	
	public String getEmVideoTitle() {
		return this.emVideoTitle;
	}
	public void setEmVideoPicpath(String value) {
		this.emVideoPicpath = value;
	}
	
	public String getEmVideoPicpath() {
		return this.emVideoPicpath;
	}
	public void setEmVideoPath(String value) {
		this.emVideoPath = value;
	}
	
	public String getEmVideoPath() {
		return this.emVideoPath;
	}
	public void setEmVideoOrder(Integer value) {
		this.emVideoOrder = value;
	}
	
	public Integer getEmVideoOrder() {
		return this.emVideoOrder;
	}
	public void setEmVideoStat(Integer value) {
		this.emVideoStat = value;
	}
	
	public Integer getEmVideoStat() {
		return this.emVideoStat;
	}
	public void setAuthor(String value) {
		this.author = value;
	}
	
	public String getAuthor() {
		return this.author;
	}
	public void setEmVideoInserttime(java.util.Date value) {
		this.emVideoInserttime = value;
	}
	
	public java.util.Date getEmVideoInserttime() {
		return this.emVideoInserttime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("EmVideoId",getEmVideoId())
			.append("PositionId",getPositionId())
			.append("EmVideoTitle",getEmVideoTitle())
			.append("EmVideoPicpath",getEmVideoPicpath())
			.append("EmVideoPath",getEmVideoPath())
			.append("EmVideoOrder",getEmVideoOrder())
			.append("EmVideoStat",getEmVideoStat())
			.append("Author",getAuthor())
			.append("EmVideoInserttime",getEmVideoInserttime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getEmVideoId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsInfoVideo == false) return false;
		if(this == obj) return true;
		CmsInfoVideo other = (CmsInfoVideo)obj;
		return new EqualsBuilder()
			.append(getEmVideoId(),other.getEmVideoId())
			.isEquals();
	}
}

