package com.shop.dao.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.shop.action.user.BaseService;
import com.shop.exception.MyException;
import com.shop.model.user.SubAdmin;

public class SubAdminDaoImpl extends BaseService implements SubAdminDao {
	public SubAdmin login(String username, String password,boolean flag) throws MyException {
		if (username != null && password != null) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("UserName", username);
				map.put("PassWord", password);
				List list=new ArrayList();
//				普通方式
				if(flag==true){//手机号登录
					list = this.getSqlMap().queryForList("Shop.qryCustomerForPhone", map);
				}else{//普通方式
					 list = this.getSqlMap().queryForList("Admin.qrySubLogin", map);
				}
				SubAdmin subAdmin = new SubAdmin();
				if (list != null && list.size() > 0) {
					subAdmin.setUsername((String) ((Map) list.get(0)).get("SellerName"));//卖家登录名
					subAdmin.setSellerid(((Map) list.get(0)).get("SellerId")+"");//卖家登录名
					return subAdmin;
				} else {
					return null;
				}
			}
		return null;
	}

	/**
	 * 检查是否用户名唯一 存在true
	 */
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public boolean isUnique(String username) throws MyException{
		// 设置参数对象数组
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("UserName", username);
		List<Map<String,Object>> list =this.getSqlMap().queryForList(
				"Admin.qrySubAdminCount", map);
		
		if (list != null &&(Integer.parseInt(list.get(0).get("ToTal").toString())>0)) {
			return true;// 已存在
		}
		return false;
	}

	public void saveOrUpdate(Object obj) {
		// TODO Auto-generated method stub

	}

	public void update(Object obj) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings({ "deprecation", "unused" })
	public void save(Map map) throws MyException{
		// TODO Auto-generated method stub
		try {
			Object ist= this.getSqlMap().insert("Shop.insertCustomer", map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			throw new MyException("insert error");
		}
		
	}


}
