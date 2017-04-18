package com.ez.base.service;

import com.github.pagehelper.Page;
import org.springframework.dao.DataAccessException;

import java.util.List;


public interface BaseService<T>{
	/**
	 * 新增
	 * @param t
	 * @throws DataAccessException
	 */
	void add(T t) throws DataAccessException;

	/**
	 * 批量新增
	 * @param t
	 * @throws DataAccessException
	 */
	void addAll(T t) throws DataAccessException;

	/**
	 * 根据主键删除
	 * @param id
	 * @throws DataAccessException
	 */
	void delete(String id) throws DataAccessException;

	/**
	 * 根据主键修改
	 * @param t
	 * @throws DataAccessException
	 */
	void modify(T t) throws DataAccessException;

	/**
	 * 根据主键查询对象
	 * @param id
	 * @return
	 * @throws DataAccessException
	 */
	T getById(String id) throws DataAccessException;

	/**
	 * 分页查询对象集合
	 * @param page
	 * @param t
	 * @return
	 * @throws DataAccessException
	 */
	List<T> query(Page<T> page, T t) throws DataAccessException;

	/**
	 * 根据对象查询对象集合
	 * @param t
	 * @return
	 * @throws DataAccessException
	 */
	List<T> queryAll(T t) throws DataAccessException;

	/**
	 * 查询对象集合
	 * @return
	 * @throws DataAccessException
	 */
	List<T> findAll() throws DataAccessException;
}
