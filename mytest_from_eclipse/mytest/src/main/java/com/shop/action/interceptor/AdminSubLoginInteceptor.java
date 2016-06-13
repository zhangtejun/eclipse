package com.shop.action.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.shop.dict.Util;

public class AdminSubLoginInteceptor extends AbstractInterceptor{
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();// 获取ActionContext
		Map<String, Object> session = context.getSession();// 获取Map类型的session
		if(Util.isLogin(session)){// 根据session,判断用户是否登录 
			return invocation.invoke();// 调用执行方法
		}
		return "subadminLogin";// 返回登录
	}

}
