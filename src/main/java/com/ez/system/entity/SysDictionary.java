package com.ez.system.entity;

import java.io.Serializable;

public class SysDictionary implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8985904712818417580L;
	private int id;
	private String code;
	private String sdkey;
	private String sdvalue;
	private String remark;

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
	
	public SysDictionary() {
		super();
	}

	public SysDictionary(int id, String code, String sdkey, String sdvalue,
			String remark) {
		super();
		this.id = id;
		this.code = code;
		this.sdkey = sdkey;
		this.sdvalue = sdvalue;
		this.remark = remark;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSdkey() {
		return sdkey;
	}

	public void setSdkey(String sdkey) {
		this.sdkey = sdkey;
	}

	public String getSdvalue() {
		return sdvalue;
	}

	public void setSdvalue(String sdvalue) {
		this.sdvalue = sdvalue;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
