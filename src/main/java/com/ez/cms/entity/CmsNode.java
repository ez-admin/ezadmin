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

public class CmsNode extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "栏目管理";
	public static final String ALIAS_CMS_NODE_ID = "主键id";
	public static final String ALIAS_CMS_NODE_NAME = "栏目名称";
	public static final String ALIAS_CMS_NODE_CODE = "栏目编码";
	public static final String ALIAS_CMS_NODE_PARENT_ID = "栏目父级id";
	public static final String ALIAS_CMS_NODE_SORT = "栏目排序";
	public static final String ALIAS_CMS_NODE_TYPE = "栏目类型";
	public static final String ALIAS_CMS_NODE_STATE = "栏目状态";
	public static final String ALIAS_CMS_NODE_INSERTTIME = "操作时间";
	
	//date formats
	public static final String FORMAT_CMS_NODE_INSERTTIME = DATE_FORMAT;
	
	public CmsNode(){
	}

	public CmsNode(
		Integer cmsNodeId
	){
		this.cmsNodeId = cmsNodeId;
	}

	
	//columns START
	/**主键id==>db_column: cms_node_id*/
	private Integer cmsNodeId;
	/**栏目名称==>db_column: cms_node_name*/
	private String cmsNodeName;
	/**栏目编码==>db_column: cms_node_code*/
	private String cmsNodeCode;
	/**栏目父级id==>db_column: cms_node_parentId*/
	private Integer cmsNodeParentId;
	/**栏目排序==>db_column: cms_node_sort*/
	private Integer cmsNodeSort;
	/**栏目类型==>db_column: cms_node_type*/
	private Integer cmsNodeType;
	/**栏目状态==>db_column: cms_node_state*/
	private Integer cmsNodeState;
	private java.util.Date cmsNodeInserttimeBegin;
	private java.util.Date cmsNodeInserttimeEnd;
	private java.util.Date cmsNodeInserttime;
	
	public java.util.Date getCmsNodeInserttimeBegin() {
		return this.cmsNodeInserttimeBegin;
	}
	
	public void setCmsNodeInserttimeBegin(java.util.Date value) {
		this.cmsNodeInserttimeBegin = value;
	}	
	
	public java.util.Date getCmsNodeInserttimeEnd() {
		return this.cmsNodeInserttimeEnd;
	}
	
	public void setCmsNodeInserttimeEnd(java.util.Date value) {
		this.cmsNodeInserttimeEnd = value;
	}

	//columns END
	//表外数据
	private String cmsNodeTypename;

	public String getCmsNodeTypename() {
		return cmsNodeTypename;
	}

	public void setCmsNodeTypename(String cmsNodeTypename) {
		this.cmsNodeTypename = cmsNodeTypename;
	}

	public void setCmsNodeId(Integer value) {
		this.cmsNodeId = value;
	}
	
	public Integer getCmsNodeId() {
		return this.cmsNodeId;
	}
	public void setCmsNodeName(String value) {
		this.cmsNodeName = value;
	}
	
	public String getCmsNodeName() {
		return this.cmsNodeName;
	}
	public void setCmsNodeCode(String value) {
		this.cmsNodeCode = value;
	}
	
	public String getCmsNodeCode() {
		return this.cmsNodeCode;
	}
	public void setCmsNodeParentId(Integer value) {
		this.cmsNodeParentId = value;
	}
	
	public Integer getCmsNodeParentId() {
		return this.cmsNodeParentId;
	}
	public void setCmsNodeSort(Integer value) {
		this.cmsNodeSort = value;
	}
	
	public Integer getCmsNodeSort() {
		return this.cmsNodeSort;
	}
	public void setCmsNodeType(Integer value) {
		this.cmsNodeType = value;
	}
	
	public Integer getCmsNodeType() {
		return this.cmsNodeType;
	}
	public void setCmsNodeState(Integer value) {
		this.cmsNodeState = value;
	}
	
	public Integer getCmsNodeState() {
		return this.cmsNodeState;
	}
	public void setCmsNodeInserttime(java.util.Date value) {
		this.cmsNodeInserttime = value;
	}
	
	public java.util.Date getCmsNodeInserttime() {
		return this.cmsNodeInserttime;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("CmsNodeId",getCmsNodeId())
			.append("CmsNodeName",getCmsNodeName())
			.append("CmsNodeCode",getCmsNodeCode())
			.append("CmsNodeParentId",getCmsNodeParentId())
			.append("CmsNodeSort",getCmsNodeSort())
			.append("CmsNodeType",getCmsNodeType())
			.append("CmsNodeState",getCmsNodeState())
			.append("CmsNodeInserttime",getCmsNodeInserttime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getCmsNodeId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CmsNode == false) return false;
		if(this == obj) return true;
		CmsNode other = (CmsNode)obj;
		return new EqualsBuilder()
			.append(getCmsNodeId(),other.getCmsNodeId())
			.isEquals();
	}
}

