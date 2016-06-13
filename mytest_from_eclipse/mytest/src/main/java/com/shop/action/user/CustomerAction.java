package com.shop.action.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.shop.action.BaseAction;
import com.shop.dao.user.CustomerDao;
import com.shop.dict.Dict;
import com.shop.dict.Util;
import com.shop.dict.Validator;
import com.shop.exception.MyException;
import com.shop.exception.ValidationException;
import com.shop.model.user.Customer;

public class CustomerAction extends BaseAction{
	private CustomerDao customerDao;
	
	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	private static final long serialVersionUID = 1L;
	public String login() throws MyException{
		return Dict.CUSTOMER_LOGIN;
	}
	public String rest() throws MyException{
		HttpServletRequest request =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
    	request.setAttribute("hiddenFlage", "redirect");
    	return Dict.CUSTOMER_LOGIN;//返回会员注册页面
	}
	
	public void validatelogin1() {
		HttpServletRequest httpRequest =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String username=httpRequest.getParameter("username").trim();    
        String password=httpRequest.getParameter("password").trim();  
        if(!Validator.validatePhone(username)||!Validator.validateEmail(username)){
        	addFieldError("username", "用户名输入错误！");
        }if(!Validator.validateNum(password)){
        	addFieldError("password", "密码错误！");
        }
	}
	/**
	 * 用户登录  普通登录方式
	 * @return
	 * @throws Exception
	 */
	public String login1() throws MyException{
		//普通登录方式
		//取得页面参数，校验密码
		ActionContext context=ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
        String username=request.getParameter("username").trim();    
        String password=request.getParameter("password").trim().replaceAll("&lt;", "<").replaceAll("&gt;", ">");  
        String token=request.getParameter("tokenName").trim();  
        
        //校验验证码
        if(Util.isNullOrEmpty(session1)||!token.equalsIgnoreCase((String) session1.get("token_flage"))){
        	request.setAttribute("hiddenFlage", "normal");
        	addFieldError("TokenName", "验证码输入错误！");//返回错误信息
        	return Dict.CUSTOMER_LOGIN;//返回会员登录页面
//        	throw new MyException("验证码输入有误！");
        }
        //校验成功，置为空
        session.put("token_flage","");
		//验证用户名和密码是否正确
		Customer loginCustomer = customerDao.login(username, password,false);
		if(loginCustomer != null){//如果通过验证
			//更新登录标志
			loginCustomer.setLoginflage(true);
			loginCustomer.setLogined(true);
//			session.put("_USERcustomer", loginCustomer);//将登录会员信息保存在Session中
			session1.put("_USER", loginCustomer);//将登录会员信息保存在Session中
			setSession(session1);//登录会员信息保存在Session中
			//用户名过长，用..代替
			String UName = loginCustomer.getUsername();
			if(UName.length()>8){
				UName=UName.substring(0, 7)+"..";
			}
			session1.put("UName", UName);//将登录会员信息保存在Session中
		}else{//验证失败
			request.setAttribute("hiddenFlage", "normal");
			addFieldError("UserName", "用户名或密码不正确！");//返回错误信息
			return Dict.CUSTOMER_LOGIN;//返回会员登录页面
		}
		return Dict.INDEX;//返回网站首页
	}
	public void validatelogin2() {
		HttpServletRequest httpRequest =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
    	String DynamicPhone=httpRequest.getParameter("dynamic_phone").trim();    
		String PhonePassword=httpRequest.getParameter("phone_password").trim();  
        if(!Validator.validatePhone(DynamicPhone)){
        	addFieldError("dynamic_phone", "手机号输入错误！");
        }if(!Validator.validateNum(PhonePassword)){
        	addFieldError("phone_password", "密码错误！");
        }
	}
	/**
	 * 用户登录  s手机号方式
	 * @return
	 * @throws Exception
	 */
	public String login2() throws MyException{
		//取得页面参数，校验密码
		ActionContext context=ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		String DynamicPhone=request.getParameter("dynamic_phone").trim();    
		String PhonePassword=request.getParameter("phone_password").trim();  
		String token=request.getParameter("tokenName").trim();  
		
		//校验验证码
		if(Util.isNullOrEmpty(session1)||!token.equalsIgnoreCase((String) session1.get("token_flage"))){
			request.setAttribute("hiddenFlage", "dynamic");
			addFieldError("dynamictokenName", "验证码输入错误！");//返回错误信息
			return Dict.CUSTOMER_LOGIN;//返回会员登录页面
//        	throw new MyException("验证码输入有误！");
		}
		
		//验证用户名和密码是否正确
		//校验手机号验证码，验证通过继续登录
        if(Util.isNullOrEmpty(session1)||!PhonePassword.equals(session1.get(""))){
        	request.setAttribute("hiddenFlage", "dynamic");
        	addFieldError("dynamicpassword", "动态密码输入错误！");//返回错误信息
        	return Dict.CUSTOMER_LOGIN;//返回会员注册页面
//        	throw new MyException("验证码输入有误！");
        }
		Customer loginCustomer = customerDao.login(DynamicPhone, PhonePassword,true);
		if(loginCustomer != null){//如果通过验证
			//更新登录标志
//			loginCustomer.setLoginflage(true);
			loginCustomer.setLogined(true);
//			session.put("_USERcustomer", loginCustomer);//将登录会员信息保存在Session中
			session1.put("_USERcustomer", loginCustomer);//将登录会员信息保存在Session中
			setSession(session1);//登录会员信息保存在Session中
			//用户名过长，用..代替
			String UName = loginCustomer.getUsername();
			if(UName.length()>8){
				UName=UName.substring(0, 7)+"..";
			}
			session1.put("UName", UName);//将登录会员信息保存在Session中
		}else{//验证失败
			request.setAttribute("hiddenFlage", "dynamic");
			addFieldError("dynamicUserName", "用户名或密码不正确！");//返回错误信息
			return Dict.CUSTOMER_LOGIN;//返回会员登录页面
		}
		return Dict.INDEX;//返回网站首页
	}
	
	
	public void validateRegister() {
		HttpServletRequest httpRequest =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String PassWord=httpRequest.getParameter("mobile_password").trim();
        String Mobile=httpRequest.getParameter("mobile").trim();
        if(!Validator.validatePhone(Mobile)){
        	addFieldError("mobile", "手机号格式有误！");
        }if(!Validator.validateNum(PassWord)){
        	addFieldError("mobile_password", "密码不符合规则！");
        }
	}
	/**
	 * 用户注册
	 * @return
	 * @throws Exception
	 */
	public String register() throws MyException{
		//取得页面参数，校验密码
		ActionContext context=ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		
		Map<String,Object> map = new HashMap<String, Object>();
        String PassWord=request.getParameter("mobile_password").trim();
        String RePassWord=request.getParameter("mobile_repassword").trim();
        String Mobile=request.getParameter("mobile").trim();
        String PhonePass=request.getParameter("phone_pass").trim();//验证码
        //检查是否为空
        if(Util.isNullOrEmpty(PassWord)||Util.isNullOrEmpty(RePassWord)||Util.isNullOrEmpty(Mobile)){
        	throw new ValidationException("密码和确定密码不一致！");
        }
        String UserName=request.getParameter("username"); //默认为空   
        if(UserName==null||("").equals((UserName).trim())){
        	UserName="shop"+Mobile;//此处有问题
        }
//        //校验手机验证码
//        if(Util.isNullOrEmpty(session1)||!PhonePass.equalsIgnoreCase((String) session1.get(""))){
//        	request.setAttribute("hiddenFlage", "redirect");
//        	addFieldError("phonergt", "动态密码输入有误！");
//        	return Dict.CUSTOMER_LOGIN;//返回会员注册页面
//        	throw new MyException("验证码输入有误！");
//        }
//        map.put("UserName", UserName);自动生成
        map.put("RePassWord", RePassWord);
        map.put("PassWord", PassWord);
        map.put("MemberPaypwd", PassWord);//支付密码
        map.put("MemberState", "1");
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String MemberAddtime=format.format(date);
        
        if(!RePassWord.equals(PassWord)){
        	
        	return Dict.CUSTOMER_LOGIN;//返回会员注册页面
        }
        map.put("Mobile", Mobile);
		boolean unique = customerDao.isUnique(UserName);//判断用户名是否可用
		if(unique){//如果用户名可用
			
			customerDao.save(map);//保存注册信息
			//注册成功，向会员扩展表插入数据，member_grade 默认A,注册时间 member_addtime
			
			
			map.put("MemberAddtime", MemberAddtime);
			map.put("MemberGrade", "A");
			try {
				this.logger.info("------------------->>>>>>注册成功,准备向会员扩展表插入数据");
				List<Map<String,Object>> list =(this.getSqlMap().queryForList("Shop.selectForret", map));
				map.put("MemberId", list.get(0).get("MemberId"));
				this.getSqlMap().insert("Shop.insertCustomerkz", map);
				this.logger.info("------------------->>>>>>向会员扩展表插入数据成功");
			} catch (Exception e) {
				// 会员扩展表,操作失败
				this.logger.info("------------------->>>>>>向会员扩展表插入数据失败");
			}
			return Dict.CUSTOMER_LOGIN;//返回会员登录页面
		}else{
        	addFieldError("mobile", "该手机号已注册！");
        	return Dict.CUSTOMER_LOGIN;//返回会员注册页面
//			throw new MyException("此用户名不可用");//否则返回页面错误信息
		}
	}
	/**
	 * 用户退出
	 * @return String
	 * @throws Exception
	 */
	public String logout() throws MyException{
//		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		if(session != null && session.size() > 0){
			session.clear();
		}
		return Dict.INDEX;
	}
	/**
	 * 重置密码
	 * @return String
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String retPass() throws Exception{
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		ActionContext context=ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		String Flagfor=request.getParameter("Flage").trim();
		Map<String,Object> map = new HashMap<String, Object>();
		String token=request.getParameter("tokenName").trim();
		if(Util.isNullOrEmpty(Flagfor)){
			request.setAttribute("retFlage", "");
			addFieldError("Flage", "非法参数请求！");
			return Dict.RESETPASS;
		}else if(Flagfor.equals("first")){//用户存在，进行选中验证方式页面
			if(Util.isNullOrEmpty(session1)||!token.equalsIgnoreCase((String) session1.get("token_flage"))){
				//验证码错误
				addFieldError("tokenName", "验证码错误");
				return Dict.RESETPASS;
			}
			String UserName=request.getParameter("username").trim();
			map.put("UserName", UserName);
			//校验成功，置为空
	        session.put("token_flage","");
	        //查询数据库
	        List<Map<String,Object>> list=new ArrayList();
	        if(Validator.validateEmail(UserName)){
	        	 list=  getSqlMap().queryForList("Shop.restpassFemail", map);
	        }else if(Validator.validatePhone(UserName)){
	        	 list=  getSqlMap().queryForList("Shop.restpassFphone", map);
	        }else{
	        	 list=  getSqlMap().queryForList("Shop.restpass", map);
	        }
	      if(list==null||list.size()<1){
	    	  addFieldError("UserName", "无此用户,请重新输入！");
				return Dict.RESETPASS;
	      }
	      session1.put("UpdataUserName", list.get(0).get("UserName").toString());//供下一步操作 
	     List list1=new ArrayList();
	      if(list.get(0).get("Mobile").toString().length()==11){
	    	  list1.add(list.get(0).get("Mobile").toString().substring(0, 3)+"*****"+list.get(0).get("Mobile").toString().substring(8, 11));
	    	  request.setAttribute("Mobile",list.get(0).get("Mobile").toString().substring(0, 3)+"*****"+list.get(0).get("Mobile").toString().substring(8, 11));
	    	  session1.put("MobilePhone", list.get(0).get("Mobile").toString());//供下一步操作
	      }
	      if(list.get(0).get("Email").toString().length()>3){
	    	  list1.add(list.get(0).get("Email"));
	    	  session1.put("Email", list.get(0).get("Email").toString());//供下一步操作
	      }
	      if(list1.size()<1){
	    	  addFieldError("UserName", "无此用户,请重新输入！");
				return Dict.RESETPASS;  
	      }
			request.setAttribute("ListForselect",list1);
			request.setAttribute("retFlage", "two");
			return Dict.RESETPASS;
		}else if(Flagfor.equals("two")){//下一步
			
			String phonepass=request.getParameter("phonepass").trim();//验证码
			//判断phonepass和session的是否一样
			if(false){
				addFieldError("PhonePass", "验证码错误");
				request.setAttribute("retFlage", "two");
				return Dict.RESETPASS;
			}
			//验证成功 删除session验证码
			session1.put("", "");
			
			request.setAttribute("retFlage", "three");
			return Dict.RESETPASS;
			
		}else if(Flagfor.equals("three")){
			String UserName=(String) session1.get("UpdataUserName");
			String PassWord=request.getParameter("password").trim();
//			Validator格式判断
			map.put("PassWord", PassWord);
			map.put("UserName", UserName);
			this.getSqlMap().update("Shop.updateCustomer", map);//更新密码
			request.setAttribute("retFlage", "last");
			return Dict.RESETPASS;
		}
		//修改成功，清空session
		session1.clear();
		request.setAttribute("retFlage", "");
		return Dict.RESETPASS;
	}
}