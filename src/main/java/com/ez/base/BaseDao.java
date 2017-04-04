package com.ez.base;

import org.springframework.dao.DataAccessException;

import java.util.List;


/**
 * 集合持久层的公用的增，删，改，查接口
 * <T> 表示传入实体类
 * @author xujiuhua
 * 2014-11-11
 * @Email: xujiuhua798@foxmail.com
 * @version 1.0v
 * @param <T>
 */
public interface BaseDao<T> {
	void add(T t) throws DataAccessException;
	void delete(String id) throws DataAccessException;
	void modify(T t) throws DataAccessException;
	T getById(String id) throws DataAccessException;
	List<T> query(T t) throws DataAccessException;
	//public List<T> query(@Param("pageView") PageView pageView, @Param("t") T t) throws DataAccessException;
	void addAll(T t) throws DataAccessException;
}
