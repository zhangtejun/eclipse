package com.shop.action.user;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.ibatis.SqlMapClientOperations;

import com.shop.action.MultiJdbcAccessAware;
import com.shop.jdbc.MultiJdbcAccess;

public class BaseService {
		private static final long serialVersionUID = 1L;
		private MultiJdbcAccess multiJdbcAccess;
		protected Logger logger;
		public BaseService(){
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
}
