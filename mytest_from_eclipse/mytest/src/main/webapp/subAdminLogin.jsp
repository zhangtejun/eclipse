<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%-- <%@ include file="/WEB-INF/zh_CN/common/headforadmin.jsp"%> --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
	<link
	href="./static/js/bootstrapValidator.min.css"
	rel="stylesheet">
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<!-- <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script> -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="./static/jquery.min.js"></script>
<script src="./static/js/bootstrapValidator.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="./static/jquery.serializejson.min.js"></script>
<style type="text/css">
html,body {
	height: 100%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 400px;
	position: absolute;
	top: 50%;
	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
	/*原理很简单：将left和top设置为50%来定位div到浏览器中央(该div的左上角，相当于坐标原点)，
	再将margin-left和margin-top值设置为宽和高的一半，使div居中显示，
	由于居中后div左上角相对于坐标原点要向左上移动，即移动到第二象限里，故要用负数。*/
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	
.form-actions{text-align:center;
}
.form {
	width: 100%;
	max-width:500px;
	height: 400px;overflow: hidden;
	margin: 0px auto 0px auto;
/* 	padding-top: 15px; */
}	
form .form-left {
width: 72%;
}
form .form-right{
float: right;
width: 24%
}
.form-left {
float: left;
}
.login-content {
	height: 400px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
	padding:0 15px;
}		
.input-group {
	margin: 0px 0px 10px 0px !important;
}
.form-control,
.input-group {
	height: 40px;
}
.bottom{
margin-bottom: 0px!important;
}
.form-group {
/* 	margin-bottom: 0px !important; */
	overflow: hidden;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 15px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style>

</head>

<body>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>登录</small></h1>
			</div>
			<div class="login-content">
			<div class="form">
			<form action="adminSub_login.do" method="post" class="form-horizontal" name="form1" id="form1">
				<div class="form-group" style="padding-top: 25px;">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="username" name="username" class="form-control" placeholder="用户名" style="width: 100%!important">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-8">
<!-- 					<div class="form-left"> -->
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-comment"></span></span>
							<input type="text" id="tokenword" name="tokenword"  maxlength="6" class="form-control" style="width: 264px" placeholder="请输入右侧验证码">
<!-- 						</div> -->
						</div>
						</div>
					   <div class="col-xs-4">
					   <div class="input-group">
                        <img class="ccap" src="/getccap?1464144809207">
					</div>
					</div>
                    
				</div>	
				<div class="form-group form-actions">
					<div class="col-xs-12">
						<button type="button" class="btn btn-sm btn-info" onclick="submit()"><span class="glyphicon glyphicon-off"></span> 登录</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回密码</small></a>
						</p>
					</div>
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>还没注册?</small> <a href="subAdminRegister.jsp" ><small>注册</small></a>
						</p>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    $('#form1').bootstrapValidator({
        excluded: [':disabled'],
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
    	            regexp: {
    	                regexp: /^[0-9a-zA-Z]*$/,
    	                message: '用户名数字或字母'
    	            },
    	            stringLength: {
                        min: 5,
                        max: 20,
                        message: '用户名长度5-20'
                    },
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
	            regexp: {
	                regexp: /^\S+$/,
	                message: '不能包含空格'
	            }
//                 identical: {
//                     field: 'rePassword',
//                     message: 'The password and its confirm are not the same'
//                 }
                }
            },
            tokenword: {
                validators: {
                    notEmpty: {
                        message: '验证码不能为空'
                    },
    	            regexp: {
    	                regexp: /^[0-9a-zA-Z]{6}$/,
    	                message: '验证码为6位数字或字母'
    	            }
                }
            }
        }
    });
});
function submit(){
	debugger
	alert(11)
	if($(".has-error").length>0){
		alert("请填写正确的信息");
		return false;
	}else{
		//提交表单
		document.form1.action="adminSub_login.do";
		document.form1.submit();
	}	
}
</script>
</body>
</html>