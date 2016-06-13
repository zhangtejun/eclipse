package com.shop.tag;

import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.shop.dao.user.BaseUser;
import com.shop.dict.Util;
import com.shop.model.user.Customer;
import com.shop.model.user.SubAdmin;
import com.shop.model.user.User;

public class UserPropertyCheckTag extends TagSupport {
	private static final long serialVersionUID = 7502622670110029795L;
	
	public static Log log = LogFactory.getLog(UserPropertyCheckTag.class);

	private String propertyName;
	private String operator;
	
	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public UserPropertyCheckTag() {
		super();
	}
	public int doStartTag() throws javax.servlet.jsp.JspException {
	try {
		Object obj = pageContext.getAttribute("_USER",PageContext.SESSION_SCOPE);
		BaseUser userA=null;
		if(!Util.isNullOrEmpty(obj)){
			if(obj instanceof SubAdmin){//卖家
				userA = (SubAdmin) obj;
				}
			if(obj instanceof User){//管理
				userA = (User) obj;
			}
			if(obj instanceof Customer){//会员买家
				userA = (Customer) obj;
			}
		}
		if(userA==null||!userA.isLogined()||userA.isLogout()){//未登录显示false
			if(propertyName.equals("logined")){
				if("=false".equals(operator))
					return EVAL_BODY_INCLUDE;
				return SKIP_BODY;
			}
			return super.doStartTag();
		}
		//已登录
		if(operator.startsWith("=")){
			String tmpStr=operator.substring(1).trim();//true
			if("true".equals(tmpStr))
				return EVAL_BODY_INCLUDE;
			return SKIP_BODY;
		}
		return SKIP_BODY;
	}catch (Exception e) {
		e.printStackTrace();
		return Tag.SKIP_BODY;
	}
	
	}
}
