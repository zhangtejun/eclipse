package com.shop.dict;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.shop.model.user.Customer;
import com.shop.model.user.SubAdmin;
import com.shop.model.user.User;

public class Util {
	/**
	 * 判断一个Object是否为空 修改为支持List ,Map ,String
	 * @param obj
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isNullOrEmpty(Object obj) {
		if (obj instanceof Object[]) {
			Object[] o = (Object[]) obj;
			if(o==null || o.length==0){
				return true;
			}
			return false;
		} else {
			if(obj instanceof String){
				if ((obj == null) || (("").equals(((String)obj).trim()))) {
					return true;
				}
				return false;
			}
			if(obj instanceof List){
				List objList = (List)obj;
				if(objList==null || objList.isEmpty()){
					return true;
				}
				return false;
			}
			if(obj instanceof Map){
				Map objMap = (Map)obj;
				if(objMap==null || objMap.isEmpty()){
					return true;
				}
				return false;
			}
			if ((obj == null) || (("").equals(obj))) {
				return true;
			}
		}
		return false;
	}
	/**
	 * 当前日期  格式为2009-01-01 00:00:00
	 */
	public static final String getNowDate() {
        java.util.Date date = new java.util.Date();
            SimpleDateFormat simpledateformat = new SimpleDateFormat();
            simpledateformat.applyPattern("yyyy-MM-dd HH:mm:ss");
            return simpledateformat.format(date);
	}
	/**
	 * 判断是否登录，传入session  Map类型。未登录返回false
	 * @param session
	 * @return
	 */
	public static boolean isLogin( Map session){
		if(isNullOrEmpty(session)){
			return false;
		}
		Object obj=session.get("_USER");
		if(!Util.isNullOrEmpty(obj)){
			if(obj instanceof SubAdmin){//卖家
				if(((SubAdmin)obj).isLogined()){
					return true;
				}
				return false;
			}
			if(obj instanceof User){//管理
				if(((User)obj).isLogined()){
					return true;
				}
				return false;
			}
			if(obj instanceof Customer){//会员买家
				if(((Customer)obj).isLogined()){
					return true;
				}
				return false;
			}
			return false;
		}
		return false;
	}
}
