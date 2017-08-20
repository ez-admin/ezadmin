package com.ez.commons.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

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

	/**
	 * 目前只支持英文
	 * @param filename
	 * @param wb
	 * @param response
	 */
	public static void writeExcel(String filename,HSSFWorkbook wb, HttpServletResponse response){
		try {
			OutputStream output=response.getOutputStream();
			response.reset();
			response.setContentType("application/msexcel");
			response.setHeader("content-disposition","attachment;filename="+filename);

			wb.write(output);
			output.close();
		} catch (IOException e) {
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
