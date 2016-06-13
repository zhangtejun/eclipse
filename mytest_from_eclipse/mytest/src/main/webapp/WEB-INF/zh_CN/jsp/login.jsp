<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</style>
</head>
<body style="width: 1349px;">
<input type="text" value="<c:out value='${List}'/>">
<input type="text" value="<c:out value='${List1}'/>">
<input type="text" value="<c:out value='${Map}'/>">
<input type="text" value="<c:out value='${Map1}'/>">
<div id="header_container" style="min-height: 90px">
    <div id="logo">
        <div class="header_logo_box">
        <c:out value='${AA}'/><br>
        <c:out value="${BB}"/>
        </div>
    </div>
</div>
<div class="login_container">
	<div class="loginframing"style="height: 425px; margin-bottom: 50px;margin: 50px auto;position: relative;line-height: 1.5;width: 965px;">
	<div class="loginBord" style="display: none;">
                <div class="loginTit" style="padding-bottom: 10px;padding-top: 10px;">
                	<span><b>登录</b></span>
                    <span class="tosignup" style="padding-left: 60px;margin-left: 100px;">还没有账号？<a onclick="toRedirect()" style=" cursor: pointer; ">30秒注册</a></span>
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
                <form id="login-dynamic-form" action="" style="display: block;">
                    <input style="display:none" type="text" name="fakeusernameremembered">
                    <input style="display:none" type="password" name="fakepasswordremembered">
                    <div class="textbox_ui user" style="margin-bottom: 5px;">
                        <input type="text" placeholder="已注册的手机号码" id="add_shadow1" class="add_shadow1" onBlur="remove_shadow(1)" onFocus="add_shadow(1)" autocomplete="off">
                        <div class="focus_text" style="margin-top: 5px;">请输入11位手机号码</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="gtVerifyWrap" style="display: none;">
                        <div class="textbox_ui">
                            <span id="dynamic_gt_verify">
                            	<img src="/i/account/hash_code?from=dynamic_login&amp;1459578352238" style="width: 100px; height: 50px;">
                            </span>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                    </div>
                    <div class="verityWrap" style="display: block;height: 66px;">
                        <span class="textbox_ui" style="float: left;">
                            <input type="text" style="width: 118px;" onFocus="add_shadow(2)"onBlur="remove_shadow(2)" placeholder="验证码" autocomplete="off" id="add_shadow2" maxlength="4">
                            <div class="focus_text" style="padding-top: 5px;">按右图填写，不区分大小写</div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </span>
                        <span style="padding-left: 15px;"><img src="" style="width: 100px; height: 43px;cursor: pointer;"></span>
                    	<span style="position: absolute;padding-top: 13px;padding-left: 10px;cursor: pointer;">换一张</span>
                    </div>
                    <div class="dynamic_pass_wrap" style="height: 66px;padding-top: 5px;">
                        <div class="textbox_ui dynamic_pass pass" style="float: left;">
                            <input type="text" placeholder="动态密码" class="add_shadow3" id="add_shadow3" onBlur="remove_shadow(3)" onFocus="add_shadow(3)"/>
                            <div class="focus_text">请点击获取手机动态密码</div>
                            <div class="hint"></div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                        <a href="javascript:;" id="getPhoneCode" class="phonecode"><strong>获取手机动态密码</strong></a>
                    </div>
                    <p style="padding-top: 15px;padding-bottom: 10px;"> 
                        <label for="dynamic_auto_login" >
                            <input type="checkbox" id="dynamic_auto_login" checked="">
                            &nbsp;自动登录
                        </label>
                    </p>

                    <input class="loginbtn submit_btn" type="submit" value="登 录" style=" display: block;width: 100%;">
                </form>
                <form id="login-user-form" method="post" action="" style="display: none;">
                    <input style="display:none" type="text" name="fakeusernameremembered">
                    <input style="display:none" type="password" name="fakepasswordremembered">
                    <div class="textbox_ui user">
                        <input type="text" placeholder="已验证手机/邮箱/用户名" id="username" onBlur="remove_shadow(4)" onFocus="add_shadow(4)" class="add_shadow1" autocomplete="off" value="">
                        <div class="focus_text">请输入登录名，您注册时用的手机号、邮箱或用户名</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <input type="password" placeholder="密码"  onBlur="remove_shadow(5)" onFocus="add_shadow(5)" style="width: 263px;" id="login_password" class="add_shadow3" autocomplete="off">
                        <div class="focus_text">请输入您注册设置的登录密码！</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="verityWrap" style="display: block;height: 66px;padding-top: 5px;">
                        <span class="textbox_ui" style="float: left;">
                            <input type="text" style="width: 118px;" onFocus="add_shadow(6)"onBlur="remove_shadow(6)" placeholder="验证码" autocomplete="off" id="add_shadow6" maxlength="4">
                            <div class="focus_text" style="padding-top: 5px;">按右图填写，不区分大小写</div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </span>
                        <span style="padding-left: 15px;"><img src="" style="width: 100px; height: 43px;cursor: pointer;"></span>
                    	<span style="position: absolute;padding-top: 13px;padding-left: 10px;cursor: pointer;">换一张</span>
                    </div>
                    <div class="verityWrap" style="display: none;">
                        <div class="textbox_ui">
                            <input type="text" placeholder="验证码" autocomplete="off" id="verify_code" maxlength="4">
                            <div class="focus_text">按右图填写，不区分大小写</div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                        <span id="change_verify_code"><img src="" style=" cursor: pointer; ">换一张</span>
                    </div>
                    <p style="padding-top: 15px;">
                        <a href="/i/account/resetreq?=login" class="fr">忘记密码?</a>
                        <label for="auto_login">
                            <input type="checkbox" id="auto_login" checked="">
                            &nbsp;自动登录
                        </label>
                    </p>
                    <p style="padding-top: 10px;">
                    <input class="loginbtn submit_btn" type="submit" value="登 录" style=" display: block;width: 100%;">
                    </p>
                    <div id="errorMsg"></div>
                </form>

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
                <form id="redirect-user-form" method="post" action="" style="display: block;">
                    <div class="textbox_ui user">
                        <input type="text" placeholder="手机号" id="redirect_username" onBlur="remove_shadow(7)" onFocus="add_shadow(7)" class="add_shadow1" autocomplete="off" value="">
                        <div class="focus_text">请输入11位手机号码</div>
                        <div class="invalid" style="display: none;">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                   <div class="dynamic_pass_wrap" style="height: 66px;padding-top: 5px;">
                        <div class="textbox_ui dynamic_pass pass" style="float: left;">
                            <input type="text" placeholder="手机校验码" class="" id="mobile_phone" onBlur="remove_shadow(8)" onFocus="add_shadow(8)"/>
                            <div class="focus_text">请点击获取手机验证码</div>
                            <div class="hint"></div>
                            <div class="invalid">
                                <i></i>
                                <div class="msg"></div>
                            </div>
                        </div>
                        <a href="javascript:;" style="margin-left: 40px;" id="getPhoneCode" class="phonecode"><strong>获取手机动态密码</strong></a>
                    </div>
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <input type="password" placeholder="密码"  onBlur="remove_shadow(9)" onFocus="add_shadow(9)" style="width: 263px;" id="redirect_password" class="add_shadow3" autocomplete="off">
                        <div class="focus_text">6-16个字符，建议使用字母加数字或符号组合</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <div class="textbox_ui pass" style="padding-top: 5px;">
                        <input type="password" placeholder="确认密码"  onBlur="remove_shadow(10)" onFocus="add_shadow(10)" style="width: 263px;" id="redirect_password2" class="add_shadow3" autocomplete="off">
                        <div class="focus_text">请再次输入密码</div>
                        <div class="invalid">
                            <i></i>
                            <div class="msg"></div>
                        </div>
                    </div>
                    <p style="padding-top: 10px;">
                    <input class="loginbtn submit_btn" type="submit" value="同意协议并注册" style=" display: block;width: 100%;">
                    </p>
                    <div id="errorMsg"></div>
                    <div class="" style="margin-top: 10px;margin-bottom: 10px;"><a style=" cursor: pointer; ">协议</a></div>
                </form>
<!--                 end -->
	</div>
</div>
</div>
<div class="clear"></div>
<script type="text/javascript">
function add_shadow(item){
	debugger;
	switch(item){
	case 1:
		$("#add_shadow1").addClass("box-shadow");
		$("#add_shadow1").next().css("visibility","visible");
		break;
	case 2:
		$("#add_shadow2").addClass("box-shadow");
		$("#add_shadow2").next().css("visibility","visible");
		break;
	case 3:
		$("#add_shadow3").addClass("box-shadow");
		$("#add_shadow3").next().css("visibility","visible");
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
		$("#add_shadow6").next().css("visibility","visible");
		break;
	case 7:
		$("#redirect_username").addClass("box-shadow");
		$("#redirect_username").next().css("visibility","visible");
		break;
	case 8:
		$("#mobile_phone").addClass("box-shadow");
		$("#mobile_phone").next().css("visibility","visible");
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
	$("#add_shadow2").next().css("visibility","hidden");
	$("#add_shadow3").removeClass("box-shadow");
	$("#add_shadow3").next().css("visibility","hidden");
	$("#add_shadow6").removeClass("box-shadow");
	$("#add_shadow6").next().css("visibility","hidden");
	$("#login_password").removeClass("box-shadow");
	$("#login_password").next().css("visibility","hidden");
	$("#username").removeClass("box-shadow");
	$("#username").next().css("visibility","hidden");
	$("#redirect_username").removeClass("box-shadow");
	$("#redirect_username").next().css("visibility","hidden");
	$("#mobile_phone").removeClass("box-shadow");
	$("#mobile_phone").next().css("visibility","hidden");
	$("#redirect_password").removeClass("box-shadow");
	$("#redirect_password").next().css("visibility","hidden");
	$("#redirect_password2").removeClass("box-shadow");
	$("#redirect_password2").next().css("visibility","hidden");
}


$(function(){
	var test=$("input[name='method']:checked").val();
	if(test=="dynamic"){
		$("#login-user-form").css("display","none");
		$("#login-dynamic-form").css("display","block");
	}
	if(test=="normal"){
		$("#login-user-form").css("display","block");
		$("#login-dynamic-form").css("display","none");
	}
});
function select_radio(test){
	if(test=="dynamic"){
		$("#login-user-form").css("display","none");
		$("#login-dynamic-form").css("display","block");
	}
	if(test=="normal"){
		$("#login-user-form").css("display","block");
		$("#login-dynamic-form").css("display","none");
	}
}
function toLogin(){
	$(".loginBord1").css("display","none");
	$(".loginBord").css("display","block");
}
function toRedirect(){
	$(".loginBord").css("display","none");
	$(".loginBord1").css("display","block");
}
</script>
</body>
</html>