/**
 * 
 */
package com.ez.commons.base;

import com.alibaba.fastjson.JSONObject;
import com.ez.commons.util.HttpCode;
import com.ez.commons.util.WebTool;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 控制器基类
 *
 * 不同异常会到不同页面
 * @author chenez
 * @version 2016年5月20日 下午3:47:58
 */
public abstract class BaseController {
	protected final Logger logger = LogManager.getLogger(this.getClass());

	/** binder用于bean属性的设置 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	/**
	 * 不同异常会到不同页面
	 * @auther chenez
	 * @description
	 * @date 2017/6/22  11:07
	 * @param model
	 * @param request
	 * @param response
	 * @param ex
	 * @return
	 * @throws Exception
	 */
	/*@ExceptionHandler(Exception.class)
	public String exceptionHandler(Model model,HttpServletRequest request, HttpServletResponse response, Exception ex)
			throws Exception {
		JSONObject jsonObject=new JSONObject();
		//是否异步请求
		if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request
				.getHeader("X-Requested-With")!= null && request
				.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
			// 根据不同错误转向不同页面
			if (ex instanceof DataParseException) {//日期类型转换异常
				model.addAttribute("httpCode", HttpCode.DATEPARSE_ERROR.value());
				model.addAttribute("message","日期类型出错，请联系系统管理员！");
			} else if( ex instanceof ExpiredSessionException){
				System.out.println("我进入session 失效异常了");
			} else {
				model.addAttribute("httpCode", HttpCode.INTERNAL_SERVER_ERROR.value());
				model.addAttribute("message","系统出错，请联系系统管理员！");
			}
			return "/error/error";
		}else{
			if (ex instanceof DataParseException) {//日期类型转换异常
				jsonObject.put("message","日期类型出错，请联系系统管理员！");
			} else {
				jsonObject.put("message","系统出错，请联系系统管理员！");
			}
			WebTool.writeJson(jsonObject.toString(), response);
			return null;
		}
	}*/


}
