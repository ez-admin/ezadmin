package com.ez.commons.util;

/**
 * @author by chenez
 * @datetime 2018/2/9 9:26
 * @description 系统常量设置
 */
public class PubConstants {
	/**系统名称*/
	public static final String SYSNAME = "SYSNAME";
	/**不对匹配该值的访问路径拦截（正则）*/
	public static final String NO_INTERCEPTOR_PATH = ".*/((front)|(loginsession)|(login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)).*";
	/**登录地址*/
	public static final String LOGIN = "/login_toLogin.do";
	/**登录成功*/
	public static final String LOGININDEX = "/index.do";
	/**日志类型 0正常 1异常*/
	public static final String LOGTYPE_NORMAL="0";
	public static final String LOGTYPE_EXCEPTION="1";

	/**角色权限*/
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	/**全部菜单*/
	public static final String SESSION_allmenuList = "allmenuList";
	/**权限菜单 用户已有菜单权限的菜单*/
	public static final String SESSION_MENULIST= "menulist";
	/**用户对象*/
	public static final String SESSION_SYSUSER = "sysuser";
	/**用户名*/
	public static final String SESSION_LOGNM = "lognm";
	/**系统分页每页显示数*/
	public static final String SESSION_SYSTEMBACKPAGESIZE="systemBackPageSize";
	/**登录成功记录*/
	public static final String SESSION_SYSLOG = "syslog";

	/**停用启用开关 1启用 0锁定*/
	public static final String OPEN = "1";
	public static final String CLOSE = "0";
	/**是否开关 1是 0否*/
	public static final String YES = "1";
	public static final String NO = "0";
	/**成功失败 true成功  false失败*/
	public static final boolean TRUE =true;
	public static final boolean FALSE =false;

	/**
	 * 登陆返回类型
	 *  -1未知客户
	 *  0不存在该客户
	 *  1登陆成功
	 *  2停用
	 *  3密码错误
	 *  4多名操作员拥有相同的登录名和密码
	 *  5用户没有登陆认证
	 *  6用户没有登陆认证
	 */
	public static final int LOGIN_NOTEXIST = 0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_NOTINUSE = 2;
	public static final int LOGIN_STTCPWDERR = 3;
	public static final int LOGIN_MULTIUSER = 4;
	public static final int LOGIN_ISAUTHEN = 5;
	public static final int LOGIN_ISLOGINED = 6;
	public static final int LOGIN_UNKNOWN = -1;
	/**
	 * 菜单类型
	 * 0 开发类型菜单
	 * 1 系统管理菜单
	 * 2 业务系统菜单
	 * 3 业务系统菜单
	 * */
	public static final String MENU_DEVELOPER= "0";
	public static final String MENU_SUPERADMIN = "1";
	public static final String MENU_OPERATOR = "2";
	public static final String MENU_FRONT = "3";
	/**
	 * 角色类型
	 * 0 开发者角色
	 * 1 系统管理角色
	 * 2 业务管理角色
	 * */
	public static final String ROLE_DEVELOPER= "0";
	public static final String ROLE_SUPERADMIN = "1";
	public static final String ROLE_OPERATOR = "2";
	/**
	 * 操作员类型
	 * 1 系统前台会员
	 * 0 系统后台用户
	 * */
	public static final String OPTYPE_FRONT="1";
	public static final String OPTYPE_SYSTEM="0";

	/**页面处理类型 VIEW查看 EDIT编辑*/
	public static final String PAGE_TYPE_VIEW = "VIEW";
	public static final String PAGE_TYPE_EDIT = "EDIT";

}
