package com.shop.model.user;

import java.io.Serializable;

import com.shop.dao.user.BaseUser;
public class Customer implements BaseUser{
	private static final long serialVersionUID = 1L;
	private Integer id;// 用户编号
	private String username;// 用户名
	private String password;// 密码
	private String realname;// 真实姓名
	private String email;// 邮箱
	private String address;// 住址
	private String mobile;// 手机
	private boolean loginflage=false;// 登录标志
	protected boolean logined = false;
	protected boolean logout = false;
	public Integer getId() {
		return id;
	}
	public boolean isLoginflage() {
		return loginflage;
	}
	public void setLoginflage(boolean loginflage) {
		this.loginflage = loginflage;
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
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
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
	
}
