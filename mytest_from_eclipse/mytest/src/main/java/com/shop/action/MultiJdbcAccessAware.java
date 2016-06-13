package com.shop.action;

import com.shop.jdbc.MultiJdbcAccess;

public interface MultiJdbcAccessAware {
	public abstract void setMultiJdbcAccess(MultiJdbcAccess multijdbcaccess);
}
