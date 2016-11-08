package com.ez.util;

public class PubConstants {
	/*系统相关配置*/

	public static final String SYSNAME = "ez后台管理系统";//系统名称
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*";	//不对匹配该值的访问路径拦截（正则）
	public static final String LOGIN = "/login_toLogin.do";				//登录地址

	/*session相关配置*/
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	public static final String SESSION_QX = "QX";
	public static final String SESSION_SYSUSER = "sysuser";				//用户对象
	public static final String SESSION_LOGNM = "lognm";			//用户名

	/*停用启用开关*/
	public static final String OPEN = "1";//启用
	public static final String CLOSE = "2";//停用
	/*登陆返回类型*/
	public static final int LOGIN_SUCCESS = 1;//登陆成功
	public static final int LOGIN_NOTEXIST = 0;//不存在该客户
	public static final int LOGIN_NOTINUSE = 2;//停用
	public static final int LOGIN_STTCPWDERR = 3;//密码错误
	public static final int LOGIN_MULTIUSER = 4;//多名操作员拥有相同的登录名和密码
	public static final int LOGIN_ISAUTHEN = 5;//用户没有登陆认证
	public static final int LOGIN_UNKNOWN = -1;
	/**操作员类型*/
	public static final String OPTYPE_DEVELOPER= "0";//开发人员
	public static final String OPTYPE_SUPERADMIN = "1";//管理员

	public static final String OPTYPE_CHECK = "1";//财务
	public static final String OPTYPE_GODHAND= "3";//超级管理员
	

}
