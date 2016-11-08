package com.ez.base;

import com.ez.util.PageView;
import org.apache.ibatis.annotations.Param;
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
	 * 返回不分页的数据
	 * @param t
	 * @return
	 * @throws DataAccessException
	 */
	public List<T> queryAll(T t) throws DataAccessException;
	public void addAll(T t) throws DataAccessException;
}
