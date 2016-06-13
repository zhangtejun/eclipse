package com.shop.dao.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import com.shop.action.BaseAction;
import com.shop.action.user.BaseService;
import com.shop.exception.MyException;
import com.shop.exception.ValidationException;
import com.shop.jdbc.MultiJdbcAccess;
import com.shop.model.user.User;

public class AdminDaoImpl extends BaseService implements AdminDao {
	public User login(String username, String password,boolean flag) throws Exception {
		// TODO Auto-generated method stub
		if (username != null && password != null) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("UserName", username);
				map.put("PassWord", password);
				// List<Customer> list = find(-1, -1, where, queryParams).getList();
				List list=new ArrayList();
//				普通方式
				if(flag==true){//手机号登录
					list = this.getSqlMap().queryForList("Shop.qryCustomerForPhone", map);
				}else{//普通方式
					 list = this.getSqlMap().queryForList("Shop.qryCustomer", map);
				}
				// List<Customer> list=null;
				User user = new User();
				if (list != null && list.size() > 0) {
					user.setUsername((String) ((Map) list.get(0))
							.get("UserName"));
//					customer.setAddress((String) ((Map) list.get(0)).get("Address"));
//					customer.setMobile((String) ((Map) list.get(0)).get("Mobile"));
					// customer.setLoginflage("true");
					return user;
				} else {
					return null;
				}
			}
		return null;
	}

	/**
	 * 检查是否用户名唯一 存在false
	 */
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public boolean isUnique(String username) throws Exception{
		// 设置参数对象数组
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("UserName", username);
		List<Map<String,Object>> list =this.getSqlMap().queryForList(
				"Shop.qryCustomerCount", map);
		
		if (list != null &&(Integer.parseInt(list.get(0).get("ToTal").toString())>0)) {
			return false;// 已存在
		}
		return true;
	}

	public void saveOrUpdate(Object obj) {
		// TODO Auto-generated method stub

	}

	public void update(Object obj) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings({ "deprecation", "unused" })
	public void save(Map map) throws Exception{
		// TODO Auto-generated method stub
		try {
			Object ist= this.getSqlMap().insert("Shop.insertCustomer", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			throw new ValidationException("insert error");
		}
		
	}


}
