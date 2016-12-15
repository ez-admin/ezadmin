package com.ez.system.entity;

import java.io.Serializable;

public class SysDicType implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2010236402452429290L;
	private String code;
	private String name;
	private String remark;
	private String flag;
	
	public SysDicType() {
		super();
	}

	public SysDicType(String code, String name, String remark, String flag) {
		super();
		this.code = code;
		this.name = name;
		this.remark = remark;
		this.flag = flag;
	}
//系统框架字段 start

	private String sidx;
	private String sord;
	private String searchValue;

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	//系统框架字段 end
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
}
