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
 * @2017-06-06
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class CmsInfo extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "文章管理";
	public static final String ALIAS_CMS_INFO_ID = "文章id";
	public static final String ALIAS_CMS_NODE_ID = "栏目id";
	public static final String ALIAS_CMS_INFO_TITLE = "文章标题";
	public static final String ALIAS_CMS_INFO_KEY = "文章关键字";
	public static final String ALIAS_CMS_INFO_DES = "文章摘要";
	public static final String ALIAS_CMS_INFO_CONTENT = "文章内容";
	public static final String ALIAS_CMS_INFO_PICPATH = "文章标题图";
	public static final String ALIAS_CMS_INFO_ORDER = "新闻内容排序";
	public static final String ALIAS_CMS_INFO_INSERTTIME = "操作时间";
	public static final String ALIAS_CMS_INFO_STATE = "发布状态 0 禁用 1 启用";
	public static final String ALIAS_PUBLISH_STARTIME = "发布开始时间";
	public static final String ALIAS_PUBLISH_ENDTIME = "发布结束时间";
	public static final String ALIAS_AUTHOR = "录入者";
	public static final String ALIAS_COUNT_CLICK = "文章点击数";
	public static final String ALIAS_CMS_NEWS_FROM = "文章来源";
	public static final String ALIAS_CMS_NEWS_URL = "文章来源地址";
	public static final String ALIAS_CMS_NEWS_AUTHOR = "文章作者";
	public static final String ALIAS_NEW_SEO_KEY = "seo关键词";
	public static final String ALIAS_NEW_SEO_DES = "seo描述";
	
	//date formats
	public static final String FORMAT_CMS_INFO_INSERTTIME = DATE_FORMAT;
	public static final String FORMAT_PUBLISH_STARTIME = DATE_FORMAT;
	public static final String FORMAT_PUBLISH_ENDTIME = DATE_FORMAT;
	
	public CmsInfo(){
	}

	public CmsInfo(
		Integer cmsInfoId
	){
		this.cmsInfoId = cmsInfoId;
	}

	
	//columns START
	/**文章id==>db_column: cms_info_id*/
	private Integer cmsInfoId;
	/**栏目id==>db_column: cms_node_id*/
	private Integer cmsNodeId;
	/**文章标题==>db_column: cms_info_title*/
	private String cmsInfoTitle;
	/**文章关键字==>db_column: cms_info_key*/
	private String cmsInfoKey;
	/**文章摘要==>db_column: cms_info_des*/
	private String cmsInfoDes;
	/**文章内容==>db_column: cms_info_content*/
	private String cmsInfoContent;
	/**文章标题图==>db_column: cms_info_picpath*/
	private String cmsInfoPicpath;
	/**排序==>db_column: cms_info_order*/
	private Integer cmsInfoOrder;
	private java.util.Date cmsInfoInserttimeBegin;
	private java.util.Date cmsInfoInserttimeEnd;
	private java.util.Date cmsInfoInserttime;
	
	public java.util.Date getCmsInfoInserttimeBegin() {
		return this.cmsInfoInserttimeBegin;
	}
	
	public void setCmsInfoInserttimeBegin(java.util.Date value) {
		this.cmsInfoInserttimeBegin = value;
	}	
	
	public java.util.Date getCmsInfoInserttimeEnd() {
		return this.cmsInfoInserttimeEnd;
	}
	
	public void setCmsInfoInserttimeEnd(java.util.Date value) {
		this.cmsInfoInserttimeEnd = value;
	}
	
	/**发布状态 0 禁用 1 启用==>db_column: cms_info_state*/
	private Integer cmsInfoState;
	private java.util.Date publishStartimeBegin;
	private java.util.Date publishStartimeEnd;
	private java.util.Date publishStartime;
	
	public java.util.Date getPublishStartimeBegin() {
		return this.publishStartimeBegin;
	}
	
	public void setPublishStartimeBegin(java.util.Date value) {
		this.publishStartimeBegin = value;
	}	
	
	public java.util.Date getPublishStartimeEnd() {
		return this.publishStartimeEnd;
	}
	
	public void setPublishStartimeEnd(java.util.Date value) {
		this.publishStartimeEnd = value;
	}
	
	private java.util.Date publishEndtimeBegin;
	private java.util.Date publishEndtimeEnd;
	private java.util.Date publishEndtime;
	
	public java.util.Date getPublishEndtimeBegin() {
		return this.publishEndtimeBegin;
	}
	
	public void setPublishEndtimeBegin(java.util.Date value) {
		this.publishEndtimeBegin = value;
	}	
	
	public java.util.Date getPublishEndtimeEnd() {
		return this.publishEndtimeEnd;
	}
	
	public void setPublishEndtimeEnd(java.util.Date value) {
		this.publishEndtimeEnd = value;
	}
	
	/**录入者==>db_column: author*/
	private String author;
	/**文章点击数==>db_column: count_click*/
	private Integer countClick;
	/**文章来源==>db_column: cms_news_from*/
	private String cmsNewsFrom;
	/**文章来源地址==>db_column: cms_news_url*/
	private String cmsNewsUrl;
	/**文章作者==>db_column: cms_news_author*/
	private String cmsNewsAuthor;
	/**seo关键词==>db_column: new_seo_key*/
	private String newSeoKey;
	/**seo描述==>db_column: new_seo_des*/
	private String newSeoDes;
	//columns END
	//表外字段
	private String cmsNodeName;//栏目名称
	private String authorname;//作者姓名


	public String getCmsNodeName() {
		return cmsNodeName;
	}

	public void setCmsNodeName(String cmsNodeName) {
		this.cmsNodeName = cmsNodeName;
	}

	public String getAuthorname() {
		return authorname;
	}

	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}

	public void setCmsInfoId(Integer value) {
		this.cmsInfoId = value;
	}
	
	public Integer getCmsInfoId() {
		return this.cmsInfoId;
	}
	public void setCmsNodeId(Integer value) {
		this.cmsNodeId = value;
	}
	
	public Integer getCmsNodeId() {
		return this.cmsNodeId;
	}
	public void setCmsInfoTitle(String value) {
		this.cmsInfoTitle = value;
	}

	public String getCmsInfoTitle() {
		return this.cmsInfoTitle;
	}
	public void setCmsInfoKey(String value) {
		this.cmsInfoKey = value;
	}
	
	public String getCmsInfoKey() {
		return this.cmsInfoKey;
	}
	public void setCmsInfoDes(String value) {
		this.cmsInfoDes = value;
	}
	
	public String getCmsInfoDes() {
		return this.cmsInfoDes;
	}
	public void setCmsInfoContent(String value) {
		this.cmsInfoContent = value;
	}
	
	public String getCmsInfoContent() {
		return this.cmsInfoContent;
	}
	public void setCmsInfoPicpath(String value) {
		this.cmsInfoPicpath = value;
	}
	
	public String getCmsInfoPicpath() {
		return this.cmsInfoPicpath;
	}
	public void setCmsInfoOrder(Integer value) {
		this.cmsInfoOrder = value;
	}
	
	public Integer getCmsInfoOrder() {
		return this.cmsInfoOrder;
	}
	public void setCmsInfoInserttime(java.util.Date value) {
		this.cmsInfoInserttime = value;
	}
	
	public java.util.Date getCmsInfoInserttime() {
		return this.cmsInfoInserttime;
	}
	public void setCmsInfoState(Integer value) {
		this.cmsInfoState = value;
	}
	
	public Integer getCmsInfoState() {
		return this.cmsInfoState;
	}
	public void setPublishStartime(java.util.Date value) {
		this.publishStartime = value;
	}
	
	public java.util.Date getPublishStartime() {
		return this.publishStartime;
	}
	public void setPublishEndtime(java.util.Date value) {
		this.publishEndtime = value;
	}
	
	public java.util.Date getPublishEndtime() {
		return this.publishEndtime;
	}
	public void setAuthor(String value) {
		this.author = value;
	}
	
	public String getAuthor() {
		return this.author;
	}
	public void setCountClick(Integer value) {
		this.countClick = value;
	}
	
	public Integer getCountClick() {
		return this.countClick;
	}
	public void setCmsNewsFrom(String value) {
		this.cmsNewsFrom = value;
	}
	
	public String getCmsNewsFrom() {
		return this.cmsNewsFrom;
	}
	public void setCmsNewsUrl(String value) {
		this.cmsNewsUrl = value;
	}
	
	public String getCmsNewsUrl() {
		return this.cmsNewsUrl;
	}
	public void setCmsNewsAuthor(String value) {
		this.cmsNewsAuthor = value;
	}
	
	public String getCmsNewsAuthor() {
		return this.cmsNewsAuthor;
	}
	public void setNewSeoKey(String value) {
		this.newSeoKey = value;
	}
	
	public String getNewSeoKey() {
		return this.newSeoKey;
	}
	public void setNewSeoDes(String value) {
		this.newSeoDes = value;
	}
	
	public String getNewSeoDes() {
		return this.newSeoDes;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CmsInfoId",getCmsInfoId())
			.append("CmsNodeId",getCmsNodeId())
			.append("CmsInfoTitle",getCmsInfoTitle())
			.append("CmsInfoKey",getCmsInfoKey())
			.append("CmsInfoDes",getCmsInfoDes())
			.append("CmsInfoContent",getCmsInfoContent())
			.append("CmsInfoPicpath",getCmsInfoPicpath())
			.append("CmsInfoOrder",getCmsInfoOrder())
			.append("CmsInfoInserttime",getCmsInfoInserttime())
			.append("CmsInfoState",getCmsInfoState())
			.append("PublishStartime",getPublishStartime())
			.append("PublishEndtime",getPublishEndtime())
			.append("Author",getAuthor())
			.append("CountClick",getCountClick())
			.append("CmsNewsFrom",getCmsNewsFrom())
			.append("CmsNewsUrl",getCmsNewsUrl())
			.append("CmsNewsAuthor",getCmsNewsAuthor())
			.append("NewSeoKey",getNewSeoKey())
			.append("NewSeoDes",getNewSeoDes())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCmsInfoId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsInfo == false) return false;
		if(this == obj) return true;
		CmsInfo other = (CmsInfo)obj;
		return new EqualsBuilder()
			.append(getCmsInfoId(),other.getCmsInfoId())
			.isEquals();
	}
}

