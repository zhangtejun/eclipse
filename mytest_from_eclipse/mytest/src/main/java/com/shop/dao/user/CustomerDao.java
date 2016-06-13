package com.shop.dao.user;

import java.util.Map;

import com.shop.dao.BaseDao;
import com.shop.exception.MyException;
import com.shop.model.user.Customer;

public interface CustomerDao extends BaseDao<Customer> {
	public Customer login(String username, String password,boolean flag) throws MyException;
	public boolean isUnique(String username)throws MyException;
	public void save(Map map) throws MyException;//保存数据
}