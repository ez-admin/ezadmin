package com.ez.commons.exception;

import com.alibaba.fastjson.JSONObject;
import com.ez.commons.util.HttpCode;
import com.ez.commons.util.WebTool;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by chenez on 2017/8/19.
 */
public class MyExceptionHandler implements HandlerExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(MyExceptionHandler.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {
        //是否异步请求
        boolean isAsyn=!(request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With")!= null && request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1));
        if (isAsyn) {
            Map<String, Object> map = new HashMap<String, Object>();
            /**根据不同错误转向不同页面*/
            //日期类型转换异常
            if (ex instanceof DataParseException) {
                map.put("httpCode", HttpCode.DATEPARSE_ERROR.value());
                map.put("message","日期类型出错，请联系系统管理员！");
                logger.info("DataParseException+异常代码,异常信息",HttpCode.DATEPARSE_ERROR.value(),ex.getMessage());
            } else if( ex instanceof AuthenticationException){
                System.out.println("我进入AuthenticationException异常了");
                map.put("httpCode", HttpCode.LOGIN_FAIL.value());
                map.put("message",ex.getMessage());
            } else {
                logger.info("");
                map.put("httpCode", HttpCode.INTERNAL_SERVER_ERROR.value());
                map.put("message","系统出错，请联系系统管理员！");
            }
            return new ModelAndView("/error/error", map);
        }else{
            JSONObject jsonObject=new JSONObject();
            //日期类型转换异常
            if (ex instanceof DataParseException) {
                jsonObject.put("message","日期类型出错，请联系系统管理员！");
            } else {
                jsonObject.put("message","系统出错，请联系系统管理员！");
            }
            WebTool.writeJson(jsonObject.toString(), response);
            return null;
        }
    }
}
