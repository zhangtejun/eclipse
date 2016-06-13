package com.shop.dao.user;

import java.io.Serializable;

public interface BaseUser extends Serializable{

	public abstract boolean isLogined();
	public abstract boolean isLogout();

}
