package com.ez.base.service;

import com.ez.util.PageView;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;


public interface BaseServcie<T>{

	public void add(T t) throws DataAccessException;
	public void delete(String id) throws DataAccessException;
	public void modify(T t) throws DataAccessException;
	public T getById(String id) throws DataAccessException;
	/**
	 * 返回分页后的数据
	 * @param pageView
	 * @param t
	 * @return
	 */
	public List<T> query(@Param("pageView") PageView pageView, @Param("t") T t) throws DataAccessException;
	/**
	 * 返回所有数据
	 * @param t
	 * @return
	 */
	public List<T> queryAll() throws DataAccessException;

}
