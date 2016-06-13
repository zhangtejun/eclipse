package com.shop.action.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shop.dict.Dict;
import com.shop.dict.Util;

public class AdminLoginInteceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();// 获取ActionContext
		HttpServletRequest request =(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String path=request.getServletPath();
		if(Util.isNullOrEmpty(path)){
			return "error";
		}
		Map<String, Object> session = context.getSession();// 获取Map类型的session
		if(Util.isLogin(session)){// 根据session,判断用户是否登录 
			return invocation.invoke();// 调用执行方法
		}
		if(path.startsWith("customer_")){
			return Dict.CUSTOMER_LOGIN;// 返回登录
		}
		if(path.startsWith("admin_")){
			return "subAdminLogin";// 返回登录
		}
		if(path.startsWith("adminSub_")){
			return "subAdminLogin";// 返回登录
		}
		return "error";
	}

}
