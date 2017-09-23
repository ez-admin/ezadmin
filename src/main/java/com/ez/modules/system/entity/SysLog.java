/*
 * Powered By [chenen_genetrator]
 * version 1.0
 * Since 2016 - 2016
 */

package com.ez.modules.system.entity;


import com.ez.commons.base.BaseEntity;
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

public class SysLog extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "系统日志表";
	public static final String ALIAS_ID = "编号";
	public static final String ALIAS_MEHTODDESCRIPTION = "方法描述";
	public static final String ALIAS_EXCEPTION_CODE = "异常代码";
	public static final String ALIAS_LOGTYPE = "日志类型 0正常 1 异常";
	public static final String ALIAS_EXCEPTION_DETAIL = "异常信息";
	public static final String ALIAS_METHOD = "方法";
	public static final String ALIAS_PARAMS = "参数";
	public static final String ALIAS_CMPNO = "公司ID";
	public static final String ALIAS_USERNO = "使用者";
	public static final String ALIAS_CREATE_DATE = "创建日期";
	public static final String ALIAS_REQUEST_IP = "请求ip";
	
	//date formats
	
	public SysLog(){
	}

	public SysLog(
		Integer id
	){
		this.id = id;
	}

	
	//columns START
	/**编号==>db_column: id*/
	private Integer id;
	/**方法描述==>db_column: mehtoddescription*/
	private String mehtoddescription;
	/**异常代码==>db_column: exceptionCode*/
	private String exceptionCode;
	/**日志类型 0正常 1 异常==>db_column: logtype*/
	private String logtype;
	/**异常信息==>db_column: exceptionDetail*/
	private String exceptionDetail;
	/**方法==>db_column: method*/
	private String method;
	/**参数==>db_column: params*/
	private String params;
	/**公司ID==>db_column: cmpno*/
	private String cmpno;
	/**使用者编号==>db_column: userno*/
	private String userno;
	/**创建日期==>db_column: createDate*/
	private String createDate;
	/**请求ip==>db_column: requestIp*/
	private String requestIp;
	//columns END
	//表外字段
	/**使用者姓名==>db_column: usernm*/
	private String usernm;

	public String getUsernm() {
		return usernm;
	}

	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setMehtoddescription(String value) {
		this.mehtoddescription = value;
	}
	
	public String getMehtoddescription() {
		return this.mehtoddescription;
	}
	public void setExceptionCode(String value) {
		this.exceptionCode = value;
	}
	
	public String getExceptionCode() {
		return this.exceptionCode;
	}
	public void setLogtype(String value) {
		this.logtype = value;
	}
	
	public String getLogtype() {
		return this.logtype;
	}
	public void setExceptionDetail(String value) {
		this.exceptionDetail = value;
	}
	
	public String getExceptionDetail() {
		return this.exceptionDetail;
	}
	public void setMethod(String value) {
		this.method = value;
	}
	
	public String getMethod() {
		return this.method;
	}
	public void setParams(String value) {
		this.params = value;
	}
	
	public String getParams() {
		return this.params;
	}
	public void setCmpno(String value) {
		this.cmpno = value;
	}
	
	public String getCmpno() {
		return this.cmpno;
	}
	public void setUserno(String value) {
		this.userno = value;
	}
	
	public String getUserno() {
		return this.userno;
	}
	public void setCreateDate(String value) {
		this.createDate = value;
	}
	
	public String getCreateDate() {
		return this.createDate;
	}
	public void setRequestIp(String value) {
		this.requestIp = value;
	}
	
	public String getRequestIp() {
		return this.requestIp;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Mehtoddescription",getMehtoddescription())
			.append("ExceptionCode",getExceptionCode())
			.append("Logtype",getLogtype())
			.append("ExceptionDetail",getExceptionDetail())
			.append("Method",getMethod())
			.append("Params",getParams())
			.append("Cmpno",getCmpno())
			.append("Userno",getUserno())
			.append("CreateDate",getCreateDate())
			.append("RequestIp",getRequestIp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysLog == false) return false;
		if(this == obj) return true;
		SysLog other = (SysLog)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

