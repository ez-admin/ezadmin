package com.ez.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Map;

/**
 *  这个工具类　
 * @version 1.0v
 */
public class WebTool {

	public static void writeJson(String result, HttpServletResponse response) {
		PrintWriter writer = null;
		try {
			response.setContentType("application/json;charset=UTF-8");
			writer = response.getWriter();
			writer.write(result);
			writer.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void writeHtml(String result, HttpServletResponse response) {
		PrintWriter writer = null;
		try {
			response.setContentType("text/html;charset=UTF-8");
			writer = response.getWriter();
			writer.write(result);
			writer.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String getErrorMsg(String message) {
		String msg = "";
		if(message!= null){
			String[] msgs = message.split(":");
			msg = msgs[msgs.length - 1];
		}
		return msg;
	}
	//获取session中的权限
	public static Map<String, String> getSessionQx(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(PubConstants.SESSION_QX);
	}

}
