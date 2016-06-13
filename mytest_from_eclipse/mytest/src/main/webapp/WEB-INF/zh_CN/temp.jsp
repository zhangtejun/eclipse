<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp" %>
<title></title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form action="" name="form1">
		<input type="text" value="1231" name="username"> <input
			type="text" value="www" name="aa">
		<div class="header_title">
			<div class="header_top">
				<div class="header_top_box">
					<!--login-->
					<sh:userPropertyCheck operator="=false" propertyName="logined">
						<ul class="header_top_left">
							<li>欢迎来到XX！<a href="retPass.do" class="fr">忘记密码?</a></li>
							<li><a href="customer_login.do" rel="nofollow">请登录</a></li>
							<li><a href="customer_rest.do" rel="nofollow">快速注册</a></li>
							<li><a href="#"><img src="./static/images/fastpay.png"
									style="margin-left: -18px; margin-top: 4px;"></a></li>
							<li><a href="#"><img src="./static/images/qq_login.png"
									style="margin-left: -18px; margin-top: 6px;"></a></li>
						</ul>
					</sh:userPropertyCheck>
					<sh:userPropertyCheck operator="=true" propertyName="logined">
						<ul class="header_top_left">
							<li>欢迎来到XX！</li>
							<li><a href="#" rel="nofollow"><c:out value="${UName}" /></a></li>
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

		<div class="header">
			<div class="logo" id="logo_name">
				<span>XX商城</span>
			</div>
			<div class="header_searchbox">
				<form action="" method="get"
					onsubmit="return mall_search_validate(this)"
					style="margin: 0; padding: 0;">
					<input name="filter" type="hidden" value="0-11-1"> <input
						name="search" type="text" class="header_search_input"
						id="search_input" default_val="补水" autocomplete="off"
						x-webkit-speech="" x-webkit-grammar="builtin:search" lang="zh">
					<input name="from" type="hidden"> <input name="cat"
						type="hidden">
					<button type="button" onclick="search()" class="header_search_btn">搜索</button>
				</form>
				<div class="search_result_pop_a" id="top_out_search_pop_div"></div>

				<ul class="hot_word">
					<li><a href="#" target="">热门搜索：</a></li>
					<li><a target="" href="#">面膜</a><s class="line"></s></li>
					<li><a target="" href="#">洗面奶</a><s class="line"></s></li>
					<li><a target="" href="#">补水</a><s class="line"></s></li>
					<li><a target="" href="#">香水</a><s class="line"></s></li>
					<li><a target="" href="#">眼霜</a><s class="line"></s></li>
					<li><a target="" href="#">口红</a><s class="line"></s></li>
					<li><a target="" href="#">护肤套装</a></li>
				</ul>
			</div>
			<!--     start 购物车 -->
			<div id="shopping_cart" class="shopping_cart"
				onmouseover="show_cart()" onmouseout="hidden_cart()">
				<a id="cart" class="cart_link" href="#" rel="nofollow"> <img
					src="http://p0.jmstatic.com/assets/cart.gif" width="28" height="28"
					class="cart_gif"> <span class="text">去购物车结算</span> <span
					class="num" style="display: none;"></span> <s
					class="icon_arrow_down"></s>
				</a>

				<div class="cart_content" id="cart_content">
					<i class="cart-icons"></i>
					<div class="cart_content_null" style="display: none;">
						购物车中还没有商品，<br>快去挑选心爱的商品吧！
					</div>
					<div class="cart_content_all" style="display: none;">
						<!--                 <div class="cart_left_time">已超过购物车商品保留时间，请尽快结算。</div> -->
						<div class="cart_content_center">
							<div class="cart_con_over cart_con_single">
								<div class="single_pic">
									<a href="#" target="_blank" alt="番茄红素 纤体美容Plus酵素"><img
										src="http://p4.jmstatic.com/product/002/349/2349664_std/2349664_60_60.jpg"></a>
								</div>
								<div class="single_info">
									<div calss="price1">
										<a href="#" target="_blank" alt="番茄红素 纤体美容Plus酵素" class="name">番茄红素
											纤体美容Plus酵素</a>
									</div>
									<div class="price">￥199.00</div>
									<div class="price_plus">x</div>
									<div class="price_num">1</div>
								</div>
							</div>
							<div class="cart_con_over cart_con_single">
								<div class="single_pic">
									<a href="#" target="_blank" alt="fatblaster覆盆子纤体燃脂水"><img
										src="http://p4.jmstatic.com/product/002/283/2283414_std/2283414_60_60.jpg"></a>
								</div>
								<div class="single_info">
									<div calss="price1">
										<a href="#" target="_blank" alt="fatblaster覆盆子纤体燃脂水"
											class="name">fatblaster覆盆子纤体燃脂水</a>
									</div>
									<div class="price">￥118.00</div>
									<div class="price_plus">x</div>
									<div class="price_num">1</div>
								</div>
							</div>
						</div>
						<div class="con_all">
							<div class="price_whole">
								<span>共<span class="num_all">2</span>件商品
								</span>
							</div>
							<div>
								<span class="price_gongji">共计<em>￥</em><span
									class="total_price">69</span></span><a href="#" class="cart_btn"
									rel="nofollow">去购物车结算</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="body_container">
			<div class="body_main"
				style="min-height: 418px; margin-bottom: 50px;">
				<p>111</p>
				<%--    <sh:mobileTag formName="form1"  leftColSpan="4" rightColSpan="8" logined="true" autoSendFlag="false"/> --%>
			</div>
		</div>

		<!-- <div id="footer_container" class="footer_white" style="padding-top:5px;background: none;border-top: none;"> -->
		<!--     <div class="footer_body" id="footer_body"> -->

		<!--     </div> -->
		<!-- </div> -->
	</form>
	<div class="form-group">
		<div class="col-12">
			<div class="input-label"></div>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>