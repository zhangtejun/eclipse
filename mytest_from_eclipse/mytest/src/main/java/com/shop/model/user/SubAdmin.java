package com.shop.model.user;

import java.io.Serializable;

import com.shop.dao.user.BaseUser;

public class SubAdmin implements BaseUser{
	private static final long serialVersionUID = 1L;
	// 编号
	private Integer id;
	// 用户名
	private String username;
	private String sellerid;
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	// 密码
	private String password;
	protected boolean logined = false;
	protected boolean logout = false;
	public boolean isLogined() {
		return logined;
	}
	public void setLogined(boolean logined) {
		this.logined = logined;
	}
	public boolean isLogout() {
		return logout;
	}
	public void setLogout(boolean logout) {
		this.logout = logout;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
