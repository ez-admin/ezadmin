/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.entity;


import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author chenez
 * @2016-10-20
 * @Email: chenez 787818013@qq.com
 * @version 1.0
 */

public class SysUser extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "*系统用户表";
	public static final String ALIAS_USERNO = "用户编号";
	public static final String ALIAS_LOGNM = "登陆账户";
	public static final String ALIAS_LOGPWD = "登陆密码";
	public static final String ALIAS_DPTNO = "所属部门编号";
	public static final String ALIAS_DPTNM = "所属部门名称";
	public static final String ALIAS_RLID = "角色编号";
	public static final String ALIAS_RLNM = "角色名";
	public static final String ALIAS_USERRELNM = "用户姓名";
	public static final String ALIAS_IDNUM = "身份证号";
	public static final String ALIAS_MOBILE = "手机号码";
	public static final String ALIAS_USERICOM = "头像";
	public static final String ALIAS_EMAIL = "电子邮箱";
	public static final String ALIAS_OPTYPE = "操作员类型";
	public static final String ALIAS_ISUSED = "是否启用";
	public static final String ALIAS_OPRIGHT = "权限标识";
	public static final String ALIAS_UPTDATE = "更新日期";
	public static final String ALIAS_BSBSKND = "开办业务";
	public static final String ALIAS_INPOSTN = "是否在岗";
	public static final String ALIAS_CSTMRTYPE = "客户类型";
	public static final String ALIAS_CMPNO = "公司编号";
	
	//date formats
	
	public SysUser(){
	}

	//columns START
	/**用户编号==>db_column: USERNO*/
	private String userno;
	/**登陆账户==>db_column: LOGNM*/
	private String lognm;
	/**登陆密码==>db_column: LOGPWD*/
	private String logpwd;
	/**所属部门编号==>db_column: DPTNO*/
	private String dptno;
	/**所属部门名称==>db_column: DPTNM*/
	private String dptnm;
	/**角色编号==>db_column: RLID*/
	private String rlid;
	/**角色名==>db_column: RLNM*/
	private String rlnm;
	/**用户姓名==>db_column: USERRELNM*/
	private String userrelnm;
	/**身份证号==>db_column: IDNUM*/
	private String idnum;
	/**手机号码==>db_column: MOBILE*/
	private String mobile;
	/**头像==>db_column: USERICOM*/
	private String usericom;
	/**电子邮箱==>db_column: EMAIL*/
	private String email;
	/**操作员类型==>db_column: OPTYPE*/
	private String optype;
	/**是否启用==>db_column: ISUSED*/
	private String isused;
	/**权限标识==>db_column: OPRIGHT*/
	private String opright;
	/**更新日期==>db_column: UPTDATE*/
	private String uptdate;
	/**开办业务==>db_column: BSBSKND*/
	private String bsbsknd;
	/**是否在岗==>db_column: INPOSTN*/
	private String inpostn;
	/**客户类型==>db_column: CSTMRTYPE*/
	private String cstmrtype;
	/**公司编号==>db_column: CMPNO*/
	private String cmpno;
	//columns END
	
	//系统框架字段 start
	
	private String sort;
	private String direction;
	public String getSort() {
		return sort;
	}
	
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getDirection() {
		return direction;
	}
	
	public void setDirection(String direction) {
		this.direction = direction;
	}
	//系统框架字段 end

	public void setUserno(String value) {
		this.userno = value;
	}
	
	public String getUserno() {
		return this.userno;
	}
	public void setLognm(String value) {
		this.lognm = value;
	}
	
	public String getLognm() {
		return this.lognm;
	}
	public void setLogpwd(String value) {
		this.logpwd = value;
	}
	
	public String getLogpwd() {
		return this.logpwd;
	}
	public void setDptno(String value) {
		this.dptno = value;
	}
	
	public String getDptno() {
		return this.dptno;
	}
	public void setDptnm(String value) {
		this.dptnm = value;
	}
	
	public String getDptnm() {
		return this.dptnm;
	}
	public void setRlid(String value) {
		this.rlid = value;
	}
	
	public String getRlid() {
		return this.rlid;
	}
	public void setRlnm(String value) {
		this.rlnm = value;
	}
	
	public String getRlnm() {
		return this.rlnm;
	}
	public void setUserrelnm(String value) {
		this.userrelnm = value;
	}
	
	public String getUserrelnm() {
		return this.userrelnm;
	}
	public void setIdnum(String value) {
		this.idnum = value;
	}
	
	public String getIdnum() {
		return this.idnum;
	}
	public void setMobile(String value) {
		this.mobile = value;
	}
	
	public String getMobile() {
		return this.mobile;
	}
	public void setUsericom(String value) {
		this.usericom = value;
	}
	
	public String getUsericom() {
		return this.usericom;
	}
	public void setEmail(String value) {
		this.email = value;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setOptype(String value) {
		this.optype = value;
	}
	
	public String getOptype() {
		return this.optype;
	}
	public void setIsused(String value) {
		this.isused = value;
	}
	
	public String getIsused() {
		return this.isused;
	}
	public void setOpright(String value) {
		this.opright = value;
	}
	
	public String getOpright() {
		return this.opright;
	}
	public void setUptdate(String value) {
		this.uptdate = value;
	}
	
	public String getUptdate() {
		return this.uptdate;
	}
	public void setBsbsknd(String value) {
		this.bsbsknd = value;
	}
	
	public String getBsbsknd() {
		return this.bsbsknd;
	}
	public void setInpostn(String value) {
		this.inpostn = value;
	}
	
	public String getInpostn() {
		return this.inpostn;
	}
	public void setCstmrtype(String value) {
		this.cstmrtype = value;
	}
	
	public String getCstmrtype() {
		return this.cstmrtype;
	}
	public void setCmpno(String value) {
		this.cmpno = value;
	}
	
	public String getCmpno() {
		return this.cmpno;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("Userno",getUserno())
			.append("Lognm",getLognm())
			.append("Logpwd",getLogpwd())
			.append("Dptno",getDptno())
			.append("Dptnm",getDptnm())
			.append("Rlid",getRlid())
			.append("Rlnm",getRlnm())
			.append("Userrelnm",getUserrelnm())
			.append("Idnum",getIdnum())
			.append("Mobile",getMobile())
			.append("Usericom",getUsericom())
			.append("Email",getEmail())
			.append("Optype",getOptype())
			.append("Isused",getIsused())
			.append("Opright",getOpright())
			.append("Uptdate",getUptdate())
			.append("Bsbsknd",getBsbsknd())
			.append("Inpostn",getInpostn())
			.append("Cstmrtype",getCstmrtype())
			.append("Cmpno",getCmpno())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysUser == false) return false;
		if(this == obj) return true;
		SysUser other = (SysUser)obj;
		return new EqualsBuilder()
			.isEquals();
	}
}

