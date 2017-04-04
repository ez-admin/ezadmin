package com.ez.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * springBean 工具类 用于取得Bean
 * @Description TODO
 * @author wudawei 356110537@qq.com
 * @date 2016-11-20
 *
 */
public class SpringBeanUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	public static ApplicationContext getApplicationContext() {
		checkApplicationContext();
		return applicationContext;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringBeanUtil.applicationContext = applicationContext;
	}

	/**
	 * 通过名称获取Bean
	 * @param name
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String name) {
		checkApplicationContext();
		return (T) applicationContext.getBean(name);
	}

	/**
	 * 能过类型获取Bean
	 * @param clazz
	 * @return
	 */
	public static <T> T getBean(Class<T> clazz) {
		checkApplicationContext();
		Map<String, T> beanMap = applicationContext.getBeansOfType(clazz);  
        Collection<T> valueSet = beanMap.values();  
        List<T> valueList = new ArrayList<T>(valueSet);  
        return valueList.get(0);
	}

	public static void cleanApplicationContext() {
		applicationContext = null;
	}

	private static void checkApplicationContext() {
		if (applicationContext == null) {
			throw new IllegalStateException(
					"applicaitonContext未注入,请在applicationContext.xml中定义SpringBeanUtil");
		}
	}
}
