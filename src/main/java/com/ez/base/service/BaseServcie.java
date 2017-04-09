package com.ez.base.service;

import org.springframework.dao.DataAccessException;

import java.util.List;


public interface BaseServcie<T>{

	public void add(T t) throws DataAccessException;
	public void delete(String id) throws DataAccessException;
	public void modify(T t) throws DataAccessException;
	public T getById(String id) throws DataAccessException;
	/**
	 * 返回所有数据
	 * @return
	 */
	public List<T> queryAll() throws DataAccessException;

}
