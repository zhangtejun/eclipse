package com.shop.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;

import com.shop.dict.Util;
import com.shop.model.user.Customer;
import com.shop.model.user.SubAdmin;
import com.shop.model.user.User;


@SuppressWarnings("serial")
public class UserInfoTag extends TagSupport {
	private String value;//参数

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public int doStartTag() throws JspException {
		
		StringBuffer sb = new StringBuffer();
		
		//获取传入参数
		String valueStr =(String) ExpressionUtil.evalNotNull("value", "value",
				(String) value, String.class, this,pageContext);
		//输出
		try {
			Object obj = pageContext.getAttribute("_USER",
					PageContext.SESSION_SCOPE);
			if(!Util.isNullOrEmpty(obj)){
				if(obj instanceof SubAdmin){//卖家
					sb.append(((SubAdmin) obj).getUsername());
					}
				if(obj instanceof User){//管理
					sb.append(((User) obj).getUsername());
				}
				if(obj instanceof Customer){//会员买家
					sb.append(((Customer) obj).getUsername());
				}
			}
			pageContext.getOut().print(sb.toString());
		} catch (IOException e) {
			throw new JspException("http.tag_fail_to_write", e);
		}
		return super.doStartTag();
	}
}
