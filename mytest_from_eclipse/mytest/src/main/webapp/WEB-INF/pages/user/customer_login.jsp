<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</style>
</head>
<body style="width: 1349px;">
<div id="header_container">
<!--     头部 -->
<!--     <div id="header_body">11 -->
    
<!--     </div> -->
	<div class="header_title">
		<div class="header_top">
			<div class="header_top_box">
				<!--login-->
				<sh:userPropertyCheck operator="=false" propertyName="logined">
				<ul class="header_top_left">
					<li>欢迎来到XX！</li>
					<li><a href="customer_login.do" rel="nofollow">请登录</a></li>
					<li><a href="#" rel="nofollow">快速注册</a></li>
<!-- 					<li><a href="#"><img src="./static/images/fastpay.png" -->
<!-- 							style="margin-left: -18px;margin-top: 4px;"></a></li> -->
<!-- 					<li><a href="#"><img src="./static/images/qq_login.png" -->
<!-- 							style="margin-left: -18px;margin-top: 6px;"></a></li> -->
				</ul>
				</sh:userPropertyCheck>
				<ul class="header_top_right style="padding-right: 80px;">
					<li><a href="#">正品保证</a></li>
					<li><a href="#">七天退换</a></li>
					<li><a href="#">收藏本站</a><s class="icon_favorite"></s></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">商家入驻</a></li>
				</ul>
				<!--login end-->

			</div>
		</div>
	</div>
</div>
<!-- <div id="header_container" style="min-height: 90px"> -->
<!--     <div id="logo"> -->
<!--         <div class="header_logo_box"> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
<div class="login_container">
	<div class="loginframing"style="height: 425px; margin-bottom: 50px;margin: 50px auto;position: relative;line-height: 1.5;width: 965px;">
	<div class="loginBord" style="display: none;">
                <div class="loginTit" style="padding-bottom: 10px;padding-top: 10px;">
                	<span><b>登录</b></span>
                    <span class="tosignup" style="padding-left: 60px;margin-left: 100px;">还没有账号？<a onclick="toRedirect();" style=" cursor: pointer; ">30秒注册</a></span>
                </div>
                <div class="radio_wrapper" style="display: block;padding-bottom: 10px;padding-top: 10px;">
                    <span>
                        <input name="method" type="radio" rel="login-dynamic-form" value="dynamic" checked="checked" id="radio_dynamic" onclick="select_radio('dynamic')">
                        <label for="radio_dynamic">
                            手机动态密码登录
                        </label>
                    </span>
                    <span style="padding-left: 50px;">
                        <input name="method"  type="radio" rel="login-user-form" value="normal" id="radio_normal" onclick="select_radio('normal')">
                        <label for="radio_normal">
                            普通登录
                        </label>
                    </span>
                </div>
                <s:form id="login-dynamic-form" name="login_dynamic_form" action="customer_login2.do" style="display: block;">
                    <div class="textbox_ui user" style="margin-bottom: 5px;">
<!--                         <input type="text" placeholder="已注册的手机号码" name="dynamic_phone" id="add_shadow1" class="add_shadow1" onBlur="remove_shadow(1)" onFocus="add_shadow(1)" > -->
                        <s:textfield type="text" placeholder="已注册的手机号码" name="dynamic_phone"  maxlength="11" id="add_shadow1" class="add_shadow1" onBlur="remove_shadow(1)" onFocus="add_shadow(1)" ></s:textfield>
                        <s:fielderror><s:param name="dynamicUserName">dynamicUserName</s:param></s:fielderror>
                        <div class="focus_text" style="margin-top: 5px;">请输入11位手机号码</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="verityWrap" style="display: block;height: 66px;">
                        <span class="textbox_ui" style="float: left;">
                            <s:textfield type="text" style="width: 118px;" maxlength="6" name="tokenName" onFocus="add_shadow(2)" onBlur="remove_shadow(2)" placeholder="验证码"  id="add_shadow2"></s:textfield>
                            <div id="dynamic_flag" style="position: absolute;">
                            <s:fielderror><s:param name="dynamictokenName">dynamictokenName</s:param></s:fielderror>
                            </div>
                            <div class="focus_text" style="padding-top: 5px;">按右图填写，不区分大小写</div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </span>
                        <span style="padding-left: 15px;"><img src="SecurityCodeImageAction.do" id="Verify1" onclick="changeverify1()"style="width: 100px; height: 43px;cursor: pointer;"></span>
                    	<span style="position: absolute;padding-top: 13px;padding-left: 10px;cursor: pointer;" onclick="changeverify1()">换一张</span>
                    </div>
                    <div class="dynamic_pass_wrap" style="height: 66px;padding-top: 5px;">
                        <div class="textbox_ui dynamic_pass pass">
                            <span style=" float: left; "><s:textfield type="text" placeholder="动态密码" name="phone_password"  maxlength="6" class="add_shadow3" id="add_shadow3" onBlur="remove_shadow(3)" onFocus="add_shadow(3)"/>
                      	 	</span>
                      	  <span id="getPhoneCode" class="phonecode"><strong>获取手机动态密码</strong></span>
                            <div class="focus_text" style="padding-top: 50px;">请点击获取手机动态密码</div>
                           <div id="dynamicpass_flag" style="position: absolute;margin-top: -20px;">
                            <s:fielderror><s:param name="dynamicpassword">dynamicpassword</s:param></s:fielderror>
                           </div>
                            <div class="hint"></div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                    </div>
                    <p style="padding-top: 15px;padding-bottom: 10px;"> 
                        <label for="dynamic_auto_login" >
                            <input type="checkbox" id="dynamic_auto_login" checked="">
                            &nbsp;自动登录
                        </label>
                    </p>

                    <input class="loginbtn submit_btn" type="botton" onclick="submit_dynamic()" value="登 录" style=" display: block;width: 250px;">
                </s:form>
                <s:form id="login-user-form" name="login_user_form" method="post" action="customer_login1.do" style="display: none;">
                    <div class="textbox_ui user">
                        <s:textfield type="text" placeholder="已验证手机/邮箱/用户名" name="username" id="username"  maxlength="16" onBlur="remove_shadow(4)" onFocus="add_shadow(4)" cssClass="add_shadow1"  value=""></s:textfield>
                        <s:fielderror><s:param name="UserName">UserName</s:param></s:fielderror>
                        <div class="focus_text">请输入登录名，您注册时用的手机号、邮箱或用户名</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <s:password type="password" placeholder="密码" name="password"  maxlength="16" onBlur="remove_shadow(5)" onFocus="add_shadow(5)" style="width: 263px;" id="login_password" cssClass="add_shadow3" />
                        <div class="focus_text">请输入您注册设置的登录密码！</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="verityWrap" style="display: block;height: 66px;padding-top: 5px;">
                        <span class="textbox_ui" style="float: left;">
                            <s:textfield type="text" style="width: 118px;" maxlength="6" name="tokenName" onFocus="add_shadow(6)" onBlur="remove_shadow(6)" placeholder="验证码"  id="add_shadow6"/>
                            <div id="normal_flag" style=" position: absolute; "><s:fielderror><s:param name="TokenName">TokenName</s:param></s:fielderror></div>
                            <div class="focus_text" style="padding-top: 5px;">按右图填写，不区分大小写</div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </span>
                        <span style="padding-left: 15px;"><img src="SecurityCodeImageAction.do" id="Verify" onclick="changeverify()" style="width: 100px; height: 43px;cursor: pointer;"></span>
                    	<span style="position: absolute;padding-top: 13px;padding-left: 10px;cursor: pointer;"onclick="changeverify()">换一张</span>
<%--                     	<s:fielderror><s:param name="TokenName">TokenName</s:param></s:fielderror> --%>
                    </div>
<!--                     <div class="verityWrap" style="display: none;"> -->
<!--                         <div class="textbox_ui"> -->
<!--                             <input type="text" placeholder="验证码"  id="verify_code"> -->
<!--                             <div class="focus_text">按右图填写，不区分大小写</div> -->
<!--                             <div class="invalid"> -->
<!--                                 <i></i> -->
<!--                                 <div class="msg"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<%--                         <span id="change_verify_code"><img src="" style=" cursor: pointer; ">换一张</span> --%>
<!--                     </div> -->
                    <p style="padding-top: 15px;">
                        <a href="retPass.do" class="fr">忘记密码?</a>
                        <label for="auto_login">
                            <input type="checkbox" id="auto_login" checked="">
                            &nbsp;自动登录
                        </label>
                    </p>
                    <p style="padding-top: 10px;">
                    <input class="loginbtn submit_btn" onclick="submit_normal()" type="button" value="登 录" style=" display: block;width: 100%;">
                    </p>
                    <div id="errorMsg"></div>
                </s:form>

                <div class="iconAccout" style="padding-top: 10px;">
                    <div>你也可以使用以下账号登录</div>
                    <p style="padding-top: 5px;padding-bottom: 5px;">
                        <a href="#" class="a1" title="QQ">QQ</a>
                        <a href="#" class="a2" title="支付宝">支付宝</a>
                        <a href="#" class="a3" title="新浪微博">新浪微博</a>
                        <a href="#" class="a4" title="360">360</a>
                        <a href="#" class="a5" title="百度">百度</a>
                        <span style="padding-left: 20px;">更多<i></i></span>
                    </p>
                    <p class="icon-p" style="display: none;">
                        <a href="#" class="a6" title="微信">微信</a>
                        <a href="#" class="a7" title="人人">人人</a>
                        <a href="#" class="a8" title="蘑菇街">蘑菇街</a>
                        <a href="#" class="a9" title="团800">团800</a>
                        <a href="#" class="a10" title="迅雷">迅雷</a>
                    </p>
                </div>
                <div class="shadow_l"></div>
                <div class="shadow_r"></div>
            </div>
<!-- 	redirect -->
	<div class="loginBord1" style="display: block;">
	<!--                 start -->
		                <div class="loginTit" style="padding-bottom: 10px;padding-top: 10px;">
                	<span><b>注册</b></span>
                    <span class="tosignup" style="padding-left: 60px;margin-left: 100px;">已有账号&nbsp;<a onclick="toLogin()" style=" cursor: pointer; ">点此登录</a></span>
                </div>
                <s:form name="redirect_form" id="redirect_form" method="post" action="customer_register.do" style="display: block;">
                    <div class="textbox_ui user">
                        <s:textfield type="text" placeholder="手机号"   maxlength="11" name="mobile" id="redirect_username" onBlur="remove_shadow(7)" onFocus="add_shadow(7)" class="add_shadow1"/>
                        <s:fielderror><s:param name="mobile">mobile</s:param></s:fielderror>
                        <div class="focus_text">请输入11位手机号码</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                       <div class="dynamic_pass_wrap" style="height: 66px;padding-top: 5px;">
                        <div class="textbox_ui dynamic_pass pass">
                            <span style=" float: left; "><s:textfield type="text" placeholder="手机校验码" maxlength="6" name="phone_pass" id="mobile_phone" onBlur="remove_shadow(8)" onFocus="add_shadow(8)"/>
                      	 	</span>
                      	  <span id="getPhoneCode" class="phonecode"><strong>获取手机动态密码</strong></span>
                            <div class="focus_text" style="padding-top: 50px;">请点击获取手机动态密码</div>
                           <div id="redirect_flag" style="position: absolute;margin-top: -24px;">
                            <s:fielderror><s:param name="phonergt">phonergt</s:param></s:fielderror>
                           </div>
                            <div class="hint"></div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                    </div>
<!--                    <div class="dynamic_pass_wrap" style="height: 66px;padding-top: 5px;"> -->
<!--                         <div class="textbox_ui dynamic_pass pass" style="float: left;"> -->
<%--                             <s:textfield type="text" placeholder="手机校验码" maxlength="6" name="phone_pass" id="mobile_phone" onBlur="remove_shadow(8)" onFocus="add_shadow(8)"/> --%>
<%--                             <s:fielderror><s:param name="phonergt">phonergt</s:param></s:fielderror> --%>
<!--                             <div class="focus_text">请点击获取手机验证码</div> -->
<!--                             <div class="hint"></div> -->
<!--                             <div class="invalid"> -->
<!--                                 <i></i> -->
<!--                                 <div class="msg"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<%--                         <a href="javascript:;" style="margin-left: 40px;" id="getPhoneCode" class="phonecode"><strong>获取手机动态密码</strong></a> --%>
<!--                     </div> -->
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <s:password type="password" placeholder="密码" name="mobile_password"  maxlength="16" onBlur="remove_shadow(9)" onFocus="add_shadow(9)" style="width: 263px;" id="redirect_password" class="add_shadow3" />
                        <s:fielderror><s:param name="mobile_password">mobile_password</s:param></s:fielderror>
                        <div class="focus_text">6-16个字符，建议使用字母加数字或符号组合</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <s:password type="password" placeholder="确认密码" name="mobile_repassword"  maxlength="16" onBlur="remove_shadow(10)" onFocus="add_shadow(10)" style="width: 263px;" id="redirect_password2" class="add_shadow3" />
                        <div class="focus_text">请再次输入密码</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <p style="padding-top: 10px;">
                    <input class="loginbtn submit_btn" onclick="submit_redirect()" type="button" value="同意协议并注册" style=" display: block;width: 100%;"/>
                    </p>
                    <div id="errorMsg"></div>
                    <div class="" style="margin-top: 10px;margin-bottom: 10px;"><a style=" cursor: pointer; ">协议</a></div>
                </s:form>
<!--                 end -->
	</div>
</div>
</div>
<div class="clear"></div>
<script type="text/javascript">
$(function (){
	debugger;
	var hdFlage="<c:out value='${hiddenFlage}'/>";
	if(!isUndefinedOrNull(hdFlage)&&hdFlage=="redirect"){
		$(".loginBord").css("display","none");
		$(".loginBord1").css("display","block");
	}
	
	if(!isUndefinedOrNull(hdFlage=="normal")||hdFlage=="dynamic"){
		if(hdFlage=="dynamic"){
			$("input[name='method'][value='dynamic']").attr("checked","checked");
		}else{
			
		$("input[name='method'][value='normal']").attr("checked","checked");
		}
		
		$(".loginBord1").css("display","none");
		$(".loginBord").css("display","block");
	}
	if(isUndefinedOrNull(hdFlage)){
		$(".loginBord1").css("display","none");
		$(".loginBord").css("display","block");
	}
	
	var test=$("input[name='method']:checked").val();
	if(test=="dynamic"){
		$("#login-user-form").css("display","none");
		$("#login-dynamic-form").css("display","block");
	}
	if(test=="normal"){
		$("#login-user-form").css("display","block");
		$("#login-dynamic-form").css("display","none");
	}
	//错误信息处理
	debugger;
	var flagMess=$(".errorMessage li span");
	if(!isUndefinedOrNull(flagMess)&&flagMess.length){
		for(var i=0;i<flagMess.length;i++){
			
		$($(".errorMessage")[i]).next("div").remove();
		}
	}
});


function add_shadow(item){
	debugger;
	switch(item){
	case 1:
		$("#add_shadow1").addClass("box-shadow");
		$("#add_shadow1").next().css("visibility","visible");
		break;
	case 2:
		$("#add_shadow2").addClass("box-shadow");
		if($("#dynamic_flag .errorMessage").length==0){
			
		}else{
			$("#dynamic_flag").children("ul").remove();
		}
		$("#add_shadow2").next().next().css("visibility","visible");
		break;
	case 3:
		$("#add_shadow3").addClass("box-shadow");
		if($("#dynamicpass_flag .errorMessage").length==0){
			
		}else{
			$("#dynamicpass_flag").children("ul").remove();
		}
		$("#add_shadow3").parent().next().next().css("visibility","visible");
		break;
	case 4:
		$("#username").addClass("box-shadow");
		$("#username").next().css("visibility","visible");
		break;
	case 5:
		$("#login_password").addClass("box-shadow");
		$("#login_password").next().css("visibility","visible");
		break;
	case 6:
		$("#add_shadow6").addClass("box-shadow");
		if($("#normal_flag .errorMessage").length==0){
		
		}else{
			$("#normal_flag").children("ul").remove();
		}
		$("#add_shadow6").next().next().css("visibility","visible");
		break;
	case 7:
		$("#redirect_username").addClass("box-shadow");
		$("#redirect_username").next().css("visibility","visible");
		break;
	case 8:
		$("#mobile_phone").addClass("box-shadow");
		if($("#redirect_flag .errorMessage").length==0){
			
		}else{
			$("#redirect_flag").children("ul").remove();
		}
		$("#mobile_phone").parent().next().next().css("visibility","visible");
		break;
	case 9:
		$("#redirect_password").addClass("box-shadow");
		$("#redirect_password").next().css("visibility","visible");
		break;
	case 10:
		$("#redirect_password2").addClass("box-shadow");
		$("#redirect_password2").next().css("visibility","visible");
		break;
	}
}
function remove_shadow(){
	$("#add_shadow1").removeClass("box-shadow");
	$("#add_shadow1").next().css("visibility","hidden");
	$("#add_shadow2").removeClass("box-shadow");
	if($("#dynamic_flag .errorMessage").length==0){
	$("#add_shadow2").next().next().css("visibility","hidden");
		}
	$("#add_shadow3").removeClass("box-shadow");
	if($("#dynamicpass_flag .errorMessage").length==0){
	$("#add_shadow3").parent().next().next().css("visibility","hidden");
			}
	$("#add_shadow6").removeClass("box-shadow");
	if($("#normal_flag .errorMessage").length==0){
	$("#add_shadow6").next().next().css("visibility","hidden");
	}
	$("#login_password").removeClass("box-shadow");
	$("#login_password").next().css("visibility","hidden");
	$("#username").removeClass("box-shadow");
	$("#username").next().css("visibility","hidden");
	$("#redirect_username").removeClass("box-shadow");
	$("#redirect_username").next().css("visibility","hidden");
	$("#mobile_phone").removeClass("box-shadow");
	if($("#redirect_flag .errorMessage").length==0){
		$("#mobile_phone").parent().next().next().css("visibility","hidden");
		}
	$("#mobile_phone").next().css("visibility","hidden");
	$("#redirect_password").removeClass("box-shadow");
	$("#redirect_password").next().css("visibility","hidden");
	$("#redirect_password2").removeClass("box-shadow");
	$("#redirect_password2").next().css("visibility","hidden");
}


function select_radio(test){
	if(test=="dynamic"){
		$("#login-user-form").css("display","none");
		$("#login-dynamic-form").css("display","block");
		changeverify1();
	}
	if(test=="normal"){
		$("#login-user-form").css("display","block");
		$("#login-dynamic-form").css("display","none");
		changeverify();
	}
}
function toLogin(){
	$(".loginBord1").css("display","none");
	$(".loginBord").css("display","block");
	changeverify();
}
function toRedirect(){
	$(".loginBord").css("display","none");
	$(".loginBord1").css("display","block");
}
//普通登录
function submit_normal(){
	if(isUndefinedOrNull(document.login_user_form.username.value)){
		document.login_user_form.username.focus();
		document.login_user_form.username.select();
		alert("用户名不能为空!");
		return false;
	}
	//
	if(!mustNumAndCode(document.login_user_form.username.value)){
		document.login_user_form.username.focus();
		document.login_user_form.username.select();
		alert("用户名只能是数字或字母!");
		return false;
	}
	if(isUndefinedOrNull(document.login_user_form.password.value)){
		document.login_user_form.password.focus();
		document.login_user_form.password.select();
		alert("密码不能为空!");
		return false;
	}
	//checkpass
	if(!checkPass(document.login_user_form.password.value)){
		alert("密码非法,请重新输入!");
		return false;
	}else{
		var obj=document.login_user_form.password.value;
			obj=obj.replace(/</g,"&lt;");
			obj=obj.replace(/>/g,"&gt;");
			document.login_user_form.password.value=obj;
	}
	
	if(isUndefinedOrNull(document.login_user_form.tokenName.value)){
		document.login_user_form.tokenName.focus();
		document.login_user_form.tokenName.select();
		alert("验证码为空!");
		return false;
	}
	
	document.login_user_form.submit();
}
//手机号登录
function submit_dynamic(){
	debugger;
	if(isUndefinedOrNull(document.login_dynamic_form.dynamic_phone.value)){
		document.login_dynamic_form.dynamic_phone.focus();
		document.login_dynamic_form.dynamic_phone.select();
		alert("手机号不能为空!");
		return false;
	}
	if(!mustNum(document.login_dynamic_form.dynamic_phone.value)){
		document.login_dynamic_form.dynamic_phone.focus();
		document.login_dynamic_form.dynamic_phone.select();
		alert("手机号格式有误!");
		return false;
	}
	if(document.login_dynamic_form.dynamic_phone.value!=11){
		document.login_dynamic_form.dynamic_phone.focus();
		document.login_dynamic_form.dynamic_phone.select();
		alert("手机号需为11位数字!");
		return false;
	}
	if(isUndefinedOrNull(document.login_dynamic_form.tokenName.value)){
		document.login_dynamic_form.tokenName.focus();
		document.login_dynamic_form.tokenName.select();
		alert("图片验证码不能为空!");
		return false;
	}
	if(isUndefinedOrNull(document.login_dynamic_form.phone_password.value)){
		document.login_dynamic_form.phone_password.focus();
		document.login_dynamic_form.phone_password.select();
		alert("短信验证码不能为空!");
		return false;
	}
	//短信验证码控制
	
	document.login_dynamic_form.submit();
}
// 注册
function submit_redirect(){
	if(isUndefinedOrNull(document.redirect_form.mobile.value)){
		document.redirect_form.mobile.focus();
		document.redirect_form.mobile.select();
		alert("手机号不能为空!");
		return false;
	}
	if(!mustNum(document.redirect_form.mobile.value)){
		document.redirect_form.mobile.focus();
		document.redirect_form.mobile.select();
		alert("手机号格式有误!");
		return false;
	}
	if(document.redirect_form.mobile.value.length!=11){
		document.redirect_form.mobile.focus();
		document.redirect_form.mobile.select();
		alert("手机号需为11位数字!");
		return false;
	}
	if(isUndefinedOrNull(document.redirect_form.phone_pass.value)){
		document.redirect_form.phone_pass.focus();
		document.redirect_form.phone_pass.select();
		alert("手机验证码不能为空!");
		return false;
	}
	if(isUndefinedOrNull(document.redirect_form.mobile_password.value)){
		document.redirect_form.mobile_password.focus();
		document.redirect_form.mobile_password.select();
		alert("密码不能为空!");
		return false;
	}
	if(isUndefinedOrNull(document.redirect_form.mobile_repassword.value)){
		document.redirect_form.mobile_repassword.focus();
		document.redirect_form.mobile_repassword.select();
		alert("确认密码不能为空!");
		return false;
	}
	if(!checkPass(document.redirect_form.mobile_password.value)){
		alert("密码非法,请重新输入!");
		return false;
	}else{
		if(document.redirect_form.mobile_password.value!==document.redirect_form.mobile_repassword.value){
			alert("输入密码和确认密码不一致!");
			return false;
		}
		var obj=document.redirect_form.mobile_password.value;
			obj=obj.replace(/</g,"&lt;");
			obj=obj.replace(/>/g,"&gt;");
			document.redirect_form.mobile_password.value=obj;
	}
	document.redirect_form.submit();
}
function changeverify(){
	//点击图片更换验证码  
	$("#Verify").attr("src","SecurityCodeImageAction.do?timestamp="+new Date().getTime());
}
function changeverify1(){
	//点击图片更换验证码  
	$("#Verify1").attr("src","SecurityCodeImageAction.do?timestamp="+new Date().getTime());
}
//检查密码



// $(function () { 
// 	//点击图片更换验证码  
// 	$("#Verify").click(function(){ 
// 		$(this).attr("src","SecurityCodeImageAction.do?timestamp="+new Date().getTime());
// 		 });
// 	});
</script>
</body>
</html>