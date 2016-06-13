package com.shop.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientOperations;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.action.BaseAction;
import com.shop.jdbc.MultiJdbcAccess;
import com.shop.jdbc.SqlExecutor;

public class login1 extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Override
	public String execute() throws Exception {
		ActionContext context=ActionContext.getContext();    
        Map  parameterMap=context.getParameters(); 
		
		
		// TODO Auto-generated method stub
		System.err.println("11111111111");
		SqlMapClientOperations ss =this.getSqlMap();
		Object s = ss.getClass();
		List list=ss.queryForList("Hello.hello");
		return super.execute();
	}
}
