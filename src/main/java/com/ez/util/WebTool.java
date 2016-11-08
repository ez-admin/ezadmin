package com.ez.util;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * 这是一个分页工具
 * 主要用于显示页码
 *　pagecode　要获得记录的开始索引　即　开始页码
 *  pageNow 　当前页
 *　pageCount 总页数
 *
 *  这个工具类　返回的是页索引　PageIndex
 * @version 1.0v
 */
public class WebTool {
	
  public static PageIndex getPageIndex(long pagecode, int pageNow, long pageCount){
		long startpage = pageNow-(pagecode%2==0? pagecode/2-1 : pagecode/2);
		long endpage = pageNow+pagecode/2;
		if(startpage<1){
			startpage = 1;
			if(pageCount>=pagecode) endpage = pagecode;
			else endpage = pageCount;
		}
		if(endpage>pageCount){
			endpage = pageCount;
			if((endpage-pagecode)>0) startpage = endpage-pagecode+1;
			else startpage = 1;
		}
		return new PageIndex(startpage, endpage);		
  }
  
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
	  

}
