package com.shop.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.orm.ibatis.SqlMapClientOperations;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.action.BaseAction;
import com.shop.jdbc.MultiJdbcAccess;
import com.shop.jdbc.SqlExecutor;

public class login extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Override
	public String execute() throws Exception {
		ActionContext context=ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
        String bookName=request.getParameter("A");    
        String bookPrice=request.getParameter("B");  
		// TODO Auto-generated method stub
		System.err.println("11111111111"+bookName+bookPrice);
		List list=getSqlMap().queryForList("Hello.hello");
		Map map = new HashMap();
		map.put("A", 1);
		map.put("A1", 2);
		map.put("A2", 3);
		request.setAttribute("AA", "111");
		request.setAttribute("List", list);
		request.setAttribute("Map", map);
		
		
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		session1.put("BB", "2222");
		session1.put("List1", list);
		session1.put("Map1", map);
		return super.execute();
	}
}
