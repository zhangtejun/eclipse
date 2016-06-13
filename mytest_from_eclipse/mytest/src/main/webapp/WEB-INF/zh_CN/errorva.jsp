<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp" %>
<title>error here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="header_title">
		<div class="header_top">
			<div class="header_top_box">
				<!--login-->
				<sh:userPropertyCheck operator="=false" propertyName="logined">
				<ul class="header_top_left">
					<li>欢迎来到XX！</li>
					<li><a href="customer_login.do" rel="nofollow">请登录</a></li>
					<li><a href="customer_rset.do" rel="nofollow">快速注册</a></li>
					<li><a href="#"><img src="./static/images/fastpay.png"
							style="margin-left: -18px;margin-top: 4px;"></a></li>
					<li><a href="#"><img src="./static/images/qq_login.png"
							style="margin-left: -18px;margin-top: 6px;"></a></li>
				</ul>
				</sh:userPropertyCheck>
				<sh:userPropertyCheck operator="=true" propertyName="logined">
				<ul class="header_top_left">
					<li>欢迎来到XX！</li>
					<li><a href="#" rel="nofollow"><c:out value="${UName}"/></a></li>
					<li><a href="customer_logout.do" onclick="logout()">退出1</a></li>
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
	<div style=" text-align: center;margin: 50px;color: #ed145b;font-size: 20px">
	
		<p style="margin: 10px;">网络错误，请稍后重试!</p>
		<%--<s:property value="exception.message"/> --%>
		<%--       <s:property value="exceptionStack"/>输出异常信息和异常堆栈信息 --%>
		<sh:userPropertyCheck operator="=true" propertyName="logined">
		<div style="margin: 10px;">
		<a style="font-size: 16px;" href="index.do">点击进入主页</a>
		</div>
		</sh:userPropertyCheck>
		<sh:userPropertyCheck operator="=flase" propertyName="logined">
		<div style="margin: 10px;">
		<a style="font-size: 16px;" href="login.do">点击进入登录页</a>
		</div>
		</sh:userPropertyCheck>
	</div>
</body>
</html>