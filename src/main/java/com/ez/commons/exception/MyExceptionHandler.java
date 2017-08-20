package com.ez.commons.exception;

import com.alibaba.fastjson.JSONObject;
import com.ez.commons.base.DataParseException;
import com.ez.commons.util.HttpCode;
import com.ez.commons.util.WebTool;
import org.apache.shiro.session.ExpiredSessionException;
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

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {
        //是否异步请求
        if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request
                .getHeader("X-Requested-With")!= null && request
                .getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {

            Map<String, Object> map = new HashMap<String, Object>();
            // 根据不同错误转向不同页面
            if (ex instanceof DataParseException) {//日期类型转换异常
                map.put("httpCode", HttpCode.DATEPARSE_ERROR.value());
                map.put("message","日期类型出错，请联系系统管理员！");
            } else if( ex instanceof ExpiredSessionException){
                System.out.println("我进入session 失效异常了");
                map.put("httpCode", HttpCode.DATEPARSE_ERROR.value());
                map.put("message","我进入了失效session异常了");
            } else {
                map.put("httpCode", HttpCode.INTERNAL_SERVER_ERROR.value());
                map.put("message","系统出错，请联系系统管理员！");
            }
            return new ModelAndView("/error/error", map);
        }else{

            JSONObject jsonObject=new JSONObject();
            if (ex instanceof DataParseException) {//日期类型转换异常
                jsonObject.put("message","日期类型出错，请联系系统管理员！");
            } else {
                jsonObject.put("message","系统出错，请联系系统管理员！");
            }
            WebTool.writeJson(jsonObject.toString(), response);
            return null;
        }
    }
}
