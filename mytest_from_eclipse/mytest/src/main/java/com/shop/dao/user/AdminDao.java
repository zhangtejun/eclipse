package com.shop.dao.user;

import java.util.Map;

import com.shop.dao.BaseDao;
import com.shop.model.user.Customer;
import com.shop.model.user.User;

public interface AdminDao extends BaseDao<User> {
	public User login(String username, String password,boolean flag) throws Exception;
	public boolean isUnique(String username)throws Exception;
	public void save(Map map) throws Exception;//保存数据
}