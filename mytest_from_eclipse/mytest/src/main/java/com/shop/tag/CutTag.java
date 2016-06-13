package com.shop.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;

import com.shop.dict.Util;


@SuppressWarnings("serial")
public class CutTag extends TagSupport {
	
	private String headNum;//开始位置
//	private String hiddenFieldName;//是否生成隐藏域
	private String shieldType;//隐藏类型
	public String getShieldType() {
		return shieldType;
	}

	public void setShieldType(String shieldType) {
		this.shieldType = shieldType;
	}

	private String value;//参数

	public String getHeadNum() {
		return headNum;
	}

	public void setHeadNum(String headNum) {
		this.headNum = headNum;
	}

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
		//生产Hidden域
//		if(hiddenFieldName != null && !("".equals(hiddenFieldName))){
//			sb.append("<input type=\"hidden\" name=\""+hiddenFieldName+"\" value=\""+TagUtil.escapeXml(valueStr)+"\" />");
//		}
		
		//隐藏函数
		String shieldValue = replaceField(valueStr,Integer.parseInt(headNum),shieldType);
		sb.append("<span>"+TagUtil.escapeXml(shieldValue)+"</span>");
		
		//输出
		try {
			pageContext.getOut().print(sb.toString());
		} catch (IOException e) {
			throw new JspException("http.tag_fail_to_write", e);
		}
		return super.doStartTag();
	}
	
	private String replaceField(String src,int hno,String shieldType){
		StringBuffer valueSB = new StringBuffer();
		if(Util.isNullOrEmpty(src) || src.length()<= hno){
			return src;
		}
		if(Util.isNullOrEmpty(shieldType)){
			shieldType = "..";
		}
		if("A".equals(shieldType)){
			return valueSB.append(src.substring(0, src.length()>19 ? 19 :src.length())).toString();
		}
		return valueSB.append(src.substring(0, hno)).append(shieldType).toString();
	}
	
}
