package com.shop.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.ibatis.SqlMapClientOperations;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.dict.Util;
import com.shop.jdbc.MultiJdbcAccess;
import com.shop.model.user.Customer;
import com.shop.model.user.SubAdmin;
import com.shop.model.user.User;

public class BaseAction extends ActionSupport implements RequestAware,
SessionAware, ApplicationAware,MultiJdbcAccessAware {
	private static final long serialVersionUID = 1L;
	private MultiJdbcAccess multiJdbcAccess;
	protected Logger logger;
	public BaseAction(){
		logger=LoggerFactory.getLogger(getClass());
	}
    public MultiJdbcAccess getMultiJdbcAccess() {
		return multiJdbcAccess;
	}

	public void setMultiJdbcAccess(MultiJdbcAccess multiJdbcAccess) {
		this.multiJdbcAccess = multiJdbcAccess;
	}

	public SqlMapClientOperations getSqlMap()
    {
        return multiJdbcAccess.getSqlMap();
    }

    public SqlMapClientOperations getSqlMap(String jdbcId)
    {
        return multiJdbcAccess.getSqlMap(jdbcId);
    }
	
	
	public void setApplication(Map<String, Object> application) {
		// TODO Auto-generated method stub
		// 获取Map类型的application赋值
		this.application = application;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		// 获取Map类型的session赋值
		this.session = session;
	}

	public void setRequest(Map<String, Object> map) {
		this.request = request;
	}

	// Map类型的request
	protected Map<String, Object> request;
	protected HttpServletRequest httpRequest;
	public void setHttpRequest(HttpServletRequest httpRequest) {
		this.httpRequest = httpRequest;
	}
	// Map类型的session
	protected Map<String, Object> session;
	// Map类型的application
	protected Map<String, Object> application;
	public boolean isLogin(){
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
