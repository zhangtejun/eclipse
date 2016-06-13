package com.shop.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.shop.action.BaseAction;
import com.shop.dao.user.SubAdminDao;
import com.shop.dict.Dict;
import com.shop.dict.Util;
import com.shop.exception.MyException;
import com.shop.model.user.SubAdmin;

public class AdminSubAction extends BaseAction{
	private static final long serialVersionUID = 3166119817452430418L;

	/**
	 * 是否校验验证码
	 */
	private static boolean ischek = false;
	private SubAdminDao subAdminDao;
	public SubAdminDao getSubAdminDao() {
		return subAdminDao;
	}
	public void setSubAdminDao(SubAdminDao subAdminDao) {
		this.subAdminDao = subAdminDao;
	}
	/**
	 * 跳转登录页面
	 * @return
	 * @throws MyException
	 */
	public String index() throws MyException{
		if(isLogin()){
			return "BaseInfo";//已登录，返回主页
		}
		return "subadminLogin";
	}
	/**
	 * 基本信息查询
	 * @return
	 * @throws MyException
	 */
	public String baseInfo() throws MyException{
		if(!isLogin()){
			return "subadminLogin";//未登录，返回主页
		}
		HttpServletRequest request =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//		String SellerName=request.getParameter("SellerName");
		String SellerName=((SubAdmin) session.get("_USER")).getUsername();
		List list=null;
		try {
			list = this.getSqlMap().queryForList("Admin.qrybaseInfo",SellerName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("mysql error");
			return Dict.BASEINFO;//基本信息页面
		}
		if(!Util.isNullOrEmpty(((Map)list.get(0)).get("StoreName"))){
			request.setAttribute("StoreNameFlag",true);//是否可以修改店铺名，开关
		}
		request.setAttribute("Result", (Map)list.get(0));
    	return Dict.BASEINFO;//基本信息页面
	}
	public String updateInfo() throws MyException{
		if(!isLogin()){
			return "subadminLogin";//未登录，返回主页
		}
		HttpServletRequest request =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String SellerName=((SubAdmin) session.get("_USER")).getUsername();
		String SellerId=((SubAdmin) session.get("_USER")).getSellerid();
		String Flsg=request.getParameter("Flag");
		if(Util.isNullOrEmpty(Flsg)){
			 return Dict.BASEINFO;
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put(Dict.SELLERNAME, SellerName);
		map.put("SellerId", SellerId);//从帐号中拿
		map.put("SellerIdcard", request.getParameter("SellerIdcard"));
		map.put("SellerMobile", request.getParameter("SellerMobile"));
		map.put("SellerTruename", request.getParameter("SellerTruename"));//not null
		map.put("SellerEmail", request.getParameter("SellerEmail"));
		map.put("StoreDescribe", request.getParameter("StoreDescribe"));
		map.put("StoreUrl", request.getParameter("StoreUrl"));
		map.put("StoreName", request.getParameter("StoreName"));//not null
		try {
			if(Flsg.equals("A")){
				this.getSqlMap().update("Admin.updateSeller", map);	
			}else{
				//检查店铺名称 是否可用
				this.getSqlMap().update("Admin.updateStore", map);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("mysql error");
			return Dict.BASEINFO;
		}	
		
		return Dict.BASEINFO;
	}
	/**
	 * 登录
	 * 
	 * 
	 */
	public String login() throws MyException{
		HttpServletRequest request =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		Map session=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		if(isLogin()){
			return "BaseInfo";//已登录，返回主页
		}
		String username=request.getParameter("username");
		request.setAttribute("username", username);
		String password=request.getParameter("password");
//		String Email=request.getParameter("Email");
//		String Phone=request.getParameter("Phone");
		String token=request.getParameter("tokenword"); //验证码
		request.setAttribute("password", password);
		if(ischek){
	        //校验验证码
	        if(Util.isNullOrEmpty(session)||!token.equalsIgnoreCase((String) session.get("token_flage"))){
	        	request.setAttribute("hiddenFlage", "normal");
	        	addFieldError("TokenName", "验证码输入错误！");//返回错误信息
	        	return Dict.SUBADMIN_LOGIN;//返回卖家登录页面
	//        	throw new MyMyException("验证码输入有误！");
	        }
	        //校验成功，置为空
	        session.put("token_flage","");
        }
		if(Util.isNullOrEmpty(username)||Util.isNullOrEmpty(password)){
			return Dict.SUBADMIN_LOGIN;//返回会员登录页面
		}
		//验证用户名和密码是否正确
		SubAdmin loginsubAdmin=null;
		try {
			loginsubAdmin = subAdminDao.login(username, password,false);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			logger.error("######验证用户名和密码失败");
			request.setAttribute("errmsg", "网络连接错误！请稍后再试");//返回错误信息
			return Dict.SUBADMIN_LOGIN;//返回会员登录页面
		}
		if(loginsubAdmin != null){//如果通过验证
			//更新登录标志
			loginsubAdmin.setLogined(true);
//			loginsubAdmin.setUsername(username);
			session.put("_USER", loginsubAdmin);//将登录会员信息保存在Session中
			setSession(session);//登录会员信息保存在Session中
			//更新当前日期
			Map map=new HashMap();
			map.put("loginTime", Util.getNowDate());
			map.put("UserName", username);
			this.getSqlMap().update("Admin.updateLogin", map);
		}else{//验证失败
			request.setAttribute("hiddenFlage", "normal");
			addFieldError("username", "用户名或密码不正确！");//返回错误信息
			return Dict.SUBADMIN_LOGIN;//返回会员登录页面
		}
        return Dict.BASEINFO;//返回管理首页
	}
	/**
	 * 用户退出
	 * @return String
	 * @throws MyException
	 */
	public String logout() throws MyException{
//		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		if(session != null && session.size() > 0){
			session.clear();
		}
		return Dict.SUBADMIN_LOGIN;//返回会员登录页面
	}
	/**
	 * 商品信息页面
	 * @return String
	 * @throws MyException
	 */
	public String goodsinfo() throws MyException{
		if(!isLogin()){
			return "subadminLogin";//未登录，返回主页
		}
		return "Goods";//返回会员登录页面
	}
	/**
	 * 商品添加
	 * @return String
	 * @throws MyException
	 */
	public String add() throws MyException{
		if(!isLogin()){
			return "subadminLogin";//未登录，返回主页
		}
		return "GoodsAdd";//返回会员登录页面
	}
	
}
