package com.ez.commons.util;

public class PubConstants {
	/*系统相关配置*/
	public static final String SYSNAME = "SYSNAME";//系统名称
	public static final String NO_INTERCEPTOR_PATH = ".*/((front)|(loginsession)|(login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*";	//不对匹配该值的访问路径拦截（正则）
	public static final String LOGIN = "/login_toLogin.do";				//登录地址
	public static final String LOGININDEX = "/index.do";				//登录成功
	/*日志类型 0正常 1 异常*/
	public static final String LOGTYPE_NORMAL="0";
	public static final String LOGTYPE_EXCEPTION="1";

	/*session相关配置*/
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	//public static final String SESSION_FIRSTMENULIST= "firstmenulist";  //一级菜单
	public static final String SESSION_SYSUSER = "sysuser";				//用户对象
	public static final String SESSION_LOGNM = "lognm";			//用户名
	public static final String SESSION_SYSTEMBACKPAGESIZE="systemBackPageSize";//系统分页每页显示数

	/*停用启用开关*/
	public static final String OPEN = "1";//启用
	public static final String CLOSE = "0";//停用
	/*是否开关*/
	public static final String YES = "1";//是
	public static final String NO = "0";//否

	/*登陆返回类型*/
	public static final int LOGIN_SUCCESS = 1;//登陆成功
	public static final int LOGIN_NOTEXIST = 0;//不存在该客户
	public static final int LOGIN_NOTINUSE = 2;//停用
	public static final int LOGIN_STTCPWDERR = 3;//密码错误
	public static final int LOGIN_MULTIUSER = 4;//多名操作员拥有相同的登录名和密码
	public static final int LOGIN_ISAUTHEN = 5;//用户没有登陆认证
	public static final int LOGIN_ISLOGINED = 6;//用户没有登陆认证
	public static final int LOGIN_UNKNOWN = -1;
	/*菜单类型*/
	public static final String MENU_DEVELOPER= "0";//开发类型菜单
	public static final String MENU_SUPERADMIN = "1";//系统管理菜单
	public static final String MENU_OPERATOR = "2"; //业务系统菜单
	public static final String MENU_FRONT = "3"; //业务系统菜单
	/*角色类型*/
	public static final String ROLE_DEVELOPER= "0";//开发者角色
	public static final String ROLE_SUPERADMIN = "1";//系统管理角色
	public static final String ROLE_OPERATOR = "2"; //业务管理角色
	/*操作员类型*/
	public static final String OPTYPE_FRONT="1";//系统前台会员
	public static final String OPTYPE_SYSTEM="0";//系统后台用户


	//页面处理类型 查看、编辑 - xjh
	public static final String PAGE_TYPE_VIEW = "VIEW";
	public static final String PAGE_TYPE_EDIT = "EDIT";

}
