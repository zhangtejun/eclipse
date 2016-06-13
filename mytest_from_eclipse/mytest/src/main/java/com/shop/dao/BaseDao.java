package com.shop.dao;

import java.util.Map;


public interface BaseDao<T> {
	//基本数据库操作方法
	public void save(Map map) throws Exception;//保存数据
	public void saveOrUpdate(Object obj);//保存或修改数据
	public void update(Object obj);//修改数据
//	public void delete(Serializable ... ids);//删除数据
}
