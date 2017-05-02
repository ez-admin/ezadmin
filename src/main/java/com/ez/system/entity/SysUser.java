/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.system.entity;


import com.ez.base.BaseEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

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
	public static final String ALIAS_COMPANYNO = "所属公司编号";
	public static final String ALIAS_SEX = "性别";
	public static final String ALIAS_AGE = "年龄";
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
	public static final String ALIAS_LASTLOGIN = "最近一次登陆时间";
	public static final String ALIAS_LOGINIP = "登陆ip";
	public static final String ALIAS_LOGINLOCATION = "登陆地区";
	
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
	/**所属公司编号==>db_column: COMPANYNO*/
	private String companyno;
	/**性别==>db_column: SEX*/
	private java.lang.Integer sex;
	/**年龄==>db_column: AGE*/
	private java.lang.Integer age;
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
	/**最近一次登陆时间==>db_column: LASTLOGIN*/
	private String lastlogin;
	/**登陆ip==>db_column: LOGINIP*/
	private String loginip;
	/**登陆地区==>db_column: LOGINLOCATION*/
	private String loginlocation;
	//columns END

	private String dptnm;
	private String companynm;
	private String rlid;

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

	public String getCompanyno() {
		return companyno;
	}

	public void setCompanyno(String companyno) {
		this.companyno = companyno;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public String getLoginip() {
		return loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	public String getLoginlocation() {
		return loginlocation;
	}

	public void setLoginlocation(String loginlocation) {
		this.loginlocation = loginlocation;
	}

	public String getDptnm() {
		return dptnm;
	}

	public void setDptnm(String dptnm) {
		this.dptnm = dptnm;
	}

	public String getCompanynm() {
		return companynm;
	}

	public void setCompanynm(String companynm) {
		this.companynm = companynm;
	}

	public String getRlid() {
		return rlid;
	}

	public void setRlid(String rlid) {
		this.rlid = rlid;
	}

	@Override
	public String toString() {
		return "SysUser{" +
				"userno='" + userno + '\'' +
				", lognm='" + lognm + '\'' +
				", logpwd='" + logpwd + '\'' +
				", dptno='" + dptno + '\'' +
				", companyno='" + companyno + '\'' +
				", sex='" + sex + '\'' +
				", age='" + age + '\'' +
				", userrelnm='" + userrelnm + '\'' +
				", idnum='" + idnum + '\'' +
				", mobile='" + mobile + '\'' +
				", usericom='" + usericom + '\'' +
				", email='" + email + '\'' +
				", optype='" + optype + '\'' +
				", isused='" + isused + '\'' +
				", opright='" + opright + '\'' +
				", uptdate='" + uptdate + '\'' +
				", bsbsknd='" + bsbsknd + '\'' +
				", lastlogin='" + lastlogin + '\'' +
				", loginip='" + loginip + '\'' +
				", loginlocation='" + loginlocation + '\'' +
				'}';
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

