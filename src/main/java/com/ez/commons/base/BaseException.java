/**
 * 
 */
package com.ez.commons.base;

import com.ez.commons.util.HttpCode;
import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.ModelMap;

/**
 * 
 * @author chenez
 * @version 2017/6/22  11:06
 */
@SuppressWarnings("serial")
public abstract class BaseException extends RuntimeException {
	public BaseException() {
	}

	public BaseException(Throwable ex) {
		super(ex);
	}

	public BaseException(String message) {
		super(message);
	}

	public BaseException(String message, Throwable ex) {
		super(message, ex);
	}

	public void handler(ModelMap modelMap) {
		modelMap.put("httpCode", getHttpCode().value());
		if (StringUtils.isNotBlank(getMessage())) {
			modelMap.put("msg", getMessage());
		} else {
			modelMap.put("msg", getHttpCode().msg());
		}
		modelMap.put("timestamp", System.currentTimeMillis());
	}

	protected abstract HttpCode getHttpCode();
}
