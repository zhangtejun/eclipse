<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>找回密码</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 <form action="customer_retPass.do"  name="form1" method="post"> 
 <input type="" name="Flage"/>
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
<div class="body_container">
    <div class="body_main" style="height: 418px; margin-bottom: 50px;">
                <div class="form-group">
                    <div class="col-12">
                    <div id="sflex04" class="stepflex ">
                    <dl class="first" style="border-top-color: #7abd54;">
                        <dt class="s-num" style="background-position: -23px 0;">1</dt>
                        <dd class="s-text" style="color: #7abd54;">填写账户名<s></s><b></b></dd>
                        <dd></dd>
                    </dl>
                    <dl class="two">
                        <dt class="s-num">2</dt>
                        <dd class="s-text">验证身份<s></s><b></b></dd>
                    </dl>
                    <dl class="three">
                        <dt class="s-num">3</dt>
                        <dd class="s-text">设置新密码<s></s><b></b></dd>
                    </dl>
                    <dl class="last">
                        <dt class="s-num" style="background-position-x: 46px;">&nbsp;</dt>
                        <dd class="s-text">完成<s></s><b></b></dd>
                    </dl>
                </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-group">
                    <div class="col-4">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-8">
                        <div class="input-value">
					<s:fielderror><s:param name="Flage">Flage</s:param></s:fielderror>
						</div>
                    </div>
                    <div class="clear"></div>
                </div>
          <div id="retfirst">      
                <div class="form-group">
                    <div class="col-5">
                        <div class="input-label">账户名</div>
                    </div>
                    <div class="col-3">
                        <div><input type="text"  placeholder="已验证手机/邮箱/用户名" name="username" maxlength="16" class="input-text" /></div>
                    </div>
                    <div class="col-4">
                        <div class="input-value"><s:fielderror><s:param name="UserName">UserName</s:param></s:fielderror></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-group">
                    <div class="col-5">
                        <div class="input-label">验证码</div>
                    </div>
                    <div class="col-3">
                        <div><input type="text" name="tokenName" maxlength="6" class="input-text" /></div>
                    </div>
                    <div class="col-4">
                       <div class="input-value"><s:fielderror><s:param name="tokenName">tokenName</s:param></s:fielderror></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><img src="SecurityCodeImageAction.do" id="Verify" onclick="changeverify()"></span><span style="position: absolute;padding-top: 13px;padding-left: 10px;cursor: pointer;" onclick="changeverify()">换一张</span></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div class="input-value"><button  type="button" onclick="befsubmit()" class="input-text">下一步</button></div>
                    </div>
                    <div class="clear"></div>
                </div>
           </div>
                
<!--                 two -->
		 <div id="rettwo" style="display: none">
		      <div class="form-group">
                    <div class="col-5 col-input">
                        <div class="input-label">请选择验证方式</div>
                    </div>
                    <div class="col-7">
                        	<select class="input-select" onchange="changsend()" id="selectsend">
                        		<c:forEach items="${ListForselect}" var="item">
                        			<option value="<c:out value='${item}'/>">
                        				<c:out value='${item}'/>
                        			</option>
                        		</c:forEach>
                        	</select>
                    </div>
                    <div class="clear"></div>
                </div>
		      <div class="form-group" id="retmobile">
                    <div class="col-5">
                        <div class="input-label">点击发送手机动态密码</div>
                    </div>
                    <div class="col-7">
                        <div>
                        	<button type="button" onclick="sendphone()" class="input-text">发送短信</button>
						</div>
                    </div>
                    <div class="clear"></div>
                </div>
		      <div class="form-group" id="retemail" style="display: none">
                    <div class="col-5">
                        <div class="input-label">点击发送邮件按钮，将会发送一封有验证码的邮件至邮箱</div>
                    </div>
                    <div class="col-7">
                        <div>
							<button type="button" onclick="sendemail()" class="input-text">发送邮件</button>
						</div>
                    </div>
                    <div class="clear"></div>
                </div>
		      <div class="form-group">
                    <div class="col-5">
                        <div class="input-label">验证码</div>
                    </div>
                    <div class="col-3">
                        <div><input placeholder="手机验证码或邮箱验证码" name="phonepass" type="text" maxlength="6" class="input-text"/></div>
                    </div>
                    <div class="col-4">
                        <div><s:fielderror><s:param name="PhonePass">PhonePass</s:param></s:fielderror></div>
                    </div>
                    <div class="clear"></div>
                </div>
		      <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><button type="button" onclick="submittwo()" class="input-text">下一步</button></div>
                    </div>
                    <div class="clear"></div>
                </div>
		 </div>
	<div id="retthree" style="display: none;">
	
			      <div class="form-group">
			         <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div class="input-value">请重设您的帐号密码</div>
                    </div>
                    <div class="clear"></div>
                </div>
			      <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><input placeholder="请输入新密码" name="password" type="password" maxlength="16" class="input-text"/></div>
                    </div>
                    <div class="clear"></div>
                </div>
			      <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><input placeholder="请输入确定密码" name="repassword" type="password" maxlength="16" class="input-text"/></div>
                    </div>
                    <div class="clear"></div>
                </div>
			      <div class="form-group">
			           <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div class="input-value">密码长度8~16位，数字、字母、字符至少包含两种</div>
                    </div>
                    <div class="clear"></div>
                </div>
            <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><button type="button" onclick="submitthree()" class="input-text">提交</button></div>
                    </div>
                    <div class="clear"></div>
                </div>
	</div>
		 <div id="retlast" style="display: none;">
		 
		             <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"><img src="./static/images/retpass.png"/></div>
                    </div>
                    <div class="col-7">
                        <div class="input-value">密码修改成功！</div>
                    </div>
                    <div class="clear"></div>
                </div>
                            <div class="form-group">
                    <div class="col-5">
                        <div class="input-label"></div>
                    </div>
                    <div class="col-7">
                        <div><button type="button" onclick="submitreturn()" class="input-text">返回首页</button></div>
                    </div>
                    <div class="clear"></div>
                </div>
		 </div>
		 
    </div>
</div>
<div id="footer_container" class="footer_white" style="padding-top:5px;background: none;border-top: none;">
    <div class="footer_body" id="footer_body">
    </div>
</div>
</form>  
</body>

<script type="text/javascript">
	$(function() {
		debugger
		window.top.document.getElementById("top_title").innerHTML = "找回密码";
		var retFlage="<c:out value='${Mobile}'/>";
		if(retFlage.length<11){
			$("#retmobile").css("display","none");
			$("#retemail").css("display","block");
		}
	});
	$(function() {
		debugger;
		var Flag="<c:out value='${retFlage}'/>";
		if(Flag=="two"){
			Ftwo();//显示2，浅化1
			$("#retfirst").css("display","none");
			$("#rettwo").css("display","block");
		}
		if(Flag=="three"){
			Ftwo();//显示2，浅化1
			Fthree();//显示3，浅化2
			$("#retfirst").css("display","none");
			$("#rettwo").css("display","none");
			$("#retthree").css("display","block");
			
		}
		if(Flag=="last"){
			$("#retfirst").css("display","none");
			$("#rettwo").css("display","none");
			$("#retthree").css("display","none");
			$("#retlast").css("display","block");
			//结果页
			Ftwo();//显示2，浅化1
			Fthree();//显示3，浅化2
			$(".three").css("border-top-color","#caecb6");
			$(".three .s-num").css("background-position-x","-46px");
			$(".three .s-text").css("border-top-color","#caecb6");
			$(".last").css("border-top-color","#7abd54");
			$(".last .s-num").css("background-position-x","-91px");
			$(".last .s-text").css("border-top-color","#7abd54");
		}
	});
	function Ftwo(){
		$(".first").css("border-top-color","#caecb6");
		$(".first .s-num").css("background-position","-47px 0");
		$(".first .s-text").css("border-top-color","#caecb6");
		$(".two").css("border-top-color","#7abd54");
		$(".two .s-num").css("background-position","-23px 0");
		$(".two .s-text").css("border-top-color","#7abd54");
	}
	function Fthree(){
		$(".two").css("border-top-color","#caecb6");
		$(".two .s-num").css("background-position-x","-46px");
		$(".two .s-text").css("border-top-color","#caecb6");
		$(".three").css("border-top-color","#7abd54");
		$(".three .s-num").css("background-position-x","-23px");
		$(".three .s-text").css("border-top-color","#7abd54");
	}
	function befsubmit(){
		var aa=document.form1.username.value;
		if(isUndefinedOrNull(document.form1.username.value)){
			document.form1.username.focus();
			document.form1.username.select();
			alert("用户名不能为空!");
			return false;
		}
		if(isUndefinedOrNull(document.form1.tokenName.value)){
			document.form1.tokenName.focus();
			document.form1.tokenName.select();
			alert("验证码为空!");
			return false;
		}
		document.form1.Flage.value="first";
		document.form1.submit();
	}
	function submitthree(){
		var aa=document.form1.password.value;
		if(isUndefinedOrNull(document.form1.password.value)){
			document.form1.password.focus();
			document.form1.password.select();
			alert("密码为空!");
			return false;
		}
		if(isUndefinedOrNull(document.form1.repassword.value)){
			document.form1.repassword.focus();
			document.form1.repassword.select();
			alert("确认密码为空!");
			return false;
		}
		if(document.form1.password.value!==document.form1.repassword.value){
			alert("2次密码输入不一致,请重新输入！");
			return false;
		}
		document.form1.Flage.value="three";
		document.form1.submit();
	}
	function submittwo(){
		debugger;
		if(isUndefinedOrNull(document.form1.phonepass.value)){
			document.form1.phonepass.focus();
			document.form1.phonepass.select();
			alert("验证码为空!");
			return false;
		}
		document.form1.Flage.value="two";
		document.form1.submit();
	}
	function submitreturn(){
		document.form1.action="index.do";
		document.form1.submit();
	}
	function changsend(){
		if(($("#selectsend").val().indexOf("@"))>0){
			$("#retmobile").css("display","none");
			$("#retemail").css("display","block");
		}else{
			$("#retemail").css("display","none");
			$("#retmobile").css("display","block");
		}
	}
	function changeverify(){
		//点击图片更换验证码  
		$("#Verify").attr("src","SecurityCodeImageAction.do?timestamp="+new Date().getTime());
	}
	function changeverify1(){
		//点击图片更换验证码  
		$("#Verify1").attr("src","SecurityCodeImageAction.do?timestamp="+new Date().getTime());
	}
	

</script>
</html>