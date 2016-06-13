package com.shop.action.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.shop.action.BaseAction;
import com.shop.dao.user.SubAdminDao;
import com.shop.dict.Dict;
import com.shop.dict.Util;
import com.shop.exception.MyException;
import com.shop.model.user.SubAdmin;

public class AdminSubRetAction extends BaseAction {
	private static final long serialVersionUID = 3166119817452430418L;

	/**
	 * 是否校验验证码
	 */
	private static boolean ischek = false;
	private SubAdminDao subAdminDao;
	public SubAdminDao getSubAdminDao() {
		return subAdminDao;
	}
	public void setSubAdminDao(SubAdminDao subAdminDao) {
		this.subAdminDao = subAdminDao;
	}
	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Map session = (Map) ActionContext.getContext().get(
				ActionContext.SESSION);
		//注册页面过来
		String Flag = request.getParameter("Flag");
		if(Util.isNullOrEmpty(Flag)||!Flag.equals("RET")){
			return "error";// 返回会员登录页面
		}
		String username = request.getParameter("username");
		request.setAttribute("username", username);
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		// String Email=request.getParameter("Email");
		String phone = request.getParameter("phone");
		String token = request.getParameter("tokenword"); // 验证码
		request.setAttribute("password", password);
		if (ischek) {
			// 校验验证码
			if (Util.isNullOrEmpty(session)
					|| !token.equalsIgnoreCase((String) session
							.get("token_flage"))) {
				addFieldError("TokenName", "验证码输入错误！");// 返回错误信息
				return "error";// 返回卖家注册页面
				// throw new MyMyException("验证码输入有误！");
			}
			// 校验成功，置为空
			session.put("token_flage", "");
		}
		if (Util.isNullOrEmpty(username) || Util.isNullOrEmpty(password)) {
			return "error";// 返回会员登录页面
		}
		Map map =new HashMap();
		map.put("username", username);
		map.put("password", password);
		map.put("phone", phone);
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String MemberAddtime=format.format(new Date());
        map.put("retTime", MemberAddtime);
		// 验证用户名是否可用
		boolean isret = false;
		try {
			isret = subAdminDao.isUnique(username);
			if (!isret) {// 如果通过验证,进行注册
				//
				String StoreGourl="http://www."+username+".com";
				map.put("StoreGourl", StoreGourl);
				this.getSqlMap().insert("Admin.insertSubAdmin1", map);logger.info("######insertSubAdmin1成功+++++");
				List list=	this.getSqlMap().queryForList("Admin.qrySubAdminID", map);
				map.put("SellerId", ((Map) list.get(0)).get("SellerId"));
				this.getSqlMap().insert("Admin.insertSubAdmin2", map);logger.info("######insertSubAdmin2成功+++++");
				this.getSqlMap().insert("Admin.insertSubAdmin3", map);logger.info("######insertSubAdmin3成功+++++");
				
			} else {// 验证失败
				request.setAttribute("hiddenFlage", "normal");
				addFieldError("username", "用户名已存在！");// 返回错误信息
				return "error";// 返回会员登录页面
			}
		} catch (MyException e) {
			// TODO Auto-generated catch block
			logger.error("######注册失败+++++检测是否存在error");
			request.setAttribute("errmsg", "网络连接错误！请稍后再试");// 返回错误信息
			return SUCCESS;// 返回会员登录页面
		}
		return SUCCESS;// 返回管理首页

	}
}
