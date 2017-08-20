package com.ez.commons.base.service;

import com.github.pagehelper.Page;

import java.util.List;


public interface BaseService<T>{
	/**
	 * 新增
	 * @param t
	 */
	void add(T t);

	/**
	 * 批量新增
	 * @param t
	 */
	void addAll(T t);

	/**
	 * 根据主键删除
	 * @param id
	 */
	void delete(String id);

	/**
	 * 根据主键修改
	 * @param t
	 */
	void modify(T t);

	/**
	 * 根据主键查询对象
	 * @param id
	 * @return
	 */
	T getById(String id);

	/**
	 * 分页查询对象集合
	 * @param page
	 * @param t
	 * @return
	 */
	List<T> query(Page<T> page, T t);

	/**
	 * 不分页查询对象集合
	 * @param t
	 * @return
	 */
	List<T> queryAll(T t);

	/**
	 * 查询对象集合
	 * @return
	 */
	List<T> findAll();
}
