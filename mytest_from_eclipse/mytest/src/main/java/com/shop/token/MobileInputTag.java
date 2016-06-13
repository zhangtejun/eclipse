package com.shop.token;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.shop.dict.Util;
import com.shop.model.user.User;

public class MobileInputTag extends TagSupport{
	private final static Log logger = LogFactory.getLog(MobileInputTag.class);
	
	private String leftColSpan;
	private String rightColSpan;
	private String formName;
	private String labelCss;
	private String offsetColSpan;
	private boolean logined = true;
	private boolean autoSendFlag = true;
	private String onclickMethod;
	/**默认开启验证动态密码保护，是否生成动态密码输入框*/
	private boolean withOutCheckProtect=false;
	/**是否自定义动态密码输入框   默认使用标签生成输入框*/
	private boolean createInputField=true;
	public void setLeftColSpan(String leftColSpan) {
		this.leftColSpan = leftColSpan;
	}
	public void setRightColSpan(String rightColSpan) {
		this.rightColSpan = rightColSpan;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public void setLabelCss(String labelCss) {
		this.labelCss = labelCss;
	}
	public void setOffsetColSpan(String offsetColSpan) {
		this.offsetColSpan = offsetColSpan;
	}
	public void setLogined(boolean logined) {
		this.logined = logined;
	}
	public void setAutoSendFlag(boolean autoSendFlag) {
		this.autoSendFlag = autoSendFlag;
	}
	public void setOnclickMethod(String onclickMethod) {
		this.onclickMethod = onclickMethod;
	}
	public void setWithOutCheckProtect(boolean withOutCheckProtect) {
		this.withOutCheckProtect = withOutCheckProtect;
	}
	public void setCreateInputField(boolean createInputField) {
		this.createInputField = createInputField;
	}
	public MobileInputTag() {
		formName="form1";
		labelCss="input-label";
		offsetColSpan="0";
		onclickMethod="";
	}
	public int doStartTag() throws JspException {
		
//		LocalizationContext localizationcontext =
//				TagUtil.getLocalizationContext(pageContext);
//			ResourceBundle resourcebundle = localizationcontext.getResourceBundle();
		String synamicPassword="手机动态密码";
		String synamicPasswordTip = "手机动态密码";
		String sendMobileTip ="点击获取";
		String reSendMobileTip ="重新获取";
		try{
//			synamicPassword = resourcebundle.getString(Dict.MOBILESYNAMICPASSWORD);
//			sendMobileTip = resourcebundle.getString(Dict.MOBILESYNAMICGET);
			synamicPasswordTip = synamicPassword;
		}catch(Exception e){
			logger.info("can not found the mobileTag message of MobileSynamicPassword ,user default");
		}
		sendMobileTip = autoSendFlag?reSendMobileTip:sendMobileTip;
//		if(logined){
//			User user = (User) pageContext.getAttribute("_USER",PageContext.SESSION_SCOPE);
//			if(user == null)return 0;
			
			//判断页面是否要添加动态密码，如果是证书版，而且设置为不需要验证。
//			if (!this.withOutCheckProtect
//					&&!user.isNeedProtect()
//					&&user.getSelectedAuthType().equals(Constants.USER_TYPE_CERT))
//				return 0;
//		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<div class=\"form-group\">");
		buffer.append("<div class=\"col-").append(leftColSpan).append(" col-offset-").append(offsetColSpan).append("\">")
					.append("<div class=\""+labelCss+"\">").append(synamicPassword).append("</div>")
				.append("</div>");
		buffer.append("<div class=\"col-").append(rightColSpan).append("\">")
			//动态密码输入框
			.append("<input name='MobilePasswd' type='text' id='MobilePasswd' size='8' maxlength='6' class='input-text input-text-sm'/>");
		if(Util.isNullOrEmpty(onclickMethod)){
			buffer.append("&nbsp;&nbsp;<input type='button' name='SendPasswd' id='SendPasswd' class='bigcmd' onclick=\"document."+formName+".MobilePasswd.value='';resendMobilePwdByAjax(document."+formName+")\" value='"+sendMobileTip+"' />");
		}else{
			buffer.append("&nbsp;&nbsp;<input type='button' name='SendPasswd' id='SendPasswd' class='bigcmd' onclick=\"document."+formName+".MobilePasswd.value='';"+onclickMethod+"\" value='"+sendMobileTip+"' />");
		}
		//直接在页面输出tip代码
		buffer.append("<span id='MobilePasswdtip' class='normaltip'></span>");
		
		buffer.append("<script language='javascirpt' type='text/javascript'>var MobilePasswd=new formEle(true,'MobilePasswd','")
		  .append(synamicPasswordTip).append("','password',null,null,'MobilePasswdtip',MobilePasswdInfo,false);initForm('MobilePasswd');");
		//页面展示后台发送动态密码结果
		Map<String,Object> messageExtend = (Map<String,Object>) pageContext.getSession().getAttribute("mobileMessageExtend");
		if(messageExtend==null){
			messageExtend=new HashMap();
			pageContext.getSession().setAttribute("mobileMessageExtend",messageExtend);
		}
		//短信已发送自你的绑定手机
//		String ResponseMsg = (String)messageExtend.get("ResponseMsg");
		String ResponseMsg = "短信已发送自你的绑定手机";
		String BackEndFlag = "1";
//		String BackEndFlag = (String)messageExtend.get("BackEndFlag");
		//重置计数标志
		messageExtend.put("BackEndFlag", "0");
		if(Util.isNullOrEmpty(ResponseMsg)){
			ResponseMsg="";
		}
		//非前台自动发送，后台发送发送，进行按钮计时和信息提示
		if(autoSendFlag){
			if("1".equals(BackEndFlag)){
				buffer.append(" $(function(){ var responseMsg = '"+ResponseMsg+"'; setCount(responseMsg);});");
			}
		}
		
		buffer.append("</script>");
		//请输入xxx的动态密码，手机尾号xxxx.
//		String TipMsg = (String)(String)messageExtend.get("TipMsg");
		String TipMsg = "请输入xxx的动态密码，手机尾号xxxx.";
//		Object mobileMsg = this.pageContext.getSession().getAttribute("mobileMessage");
		Object mobileMsg = "aaa";
		
		if(Util.isNullOrEmpty(TipMsg) || Util.isNullOrEmpty(mobileMsg)){
			TipMsg="";
		}
		buffer.append("<div id='MsgTip' class='normaltip lightred'>").append(TipMsg).append("</div>")
			  .append("</div>")
			  .append("<div class=\"clear\"></div>");
	    buffer.append("</div>");
		
		JspWriter out = pageContext.getOut();
		try {
			out.print(buffer.toString());
		} catch (IOException ioexception) {
			logger.error(ioexception);
			throw new JspException(ioexception.getMessage());
		}
		return 0;
	}
}
