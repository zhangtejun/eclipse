<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.aa {
	background: rgb(237, 20, 91);
	color: #fff;
}
</style>
</head>
<body style="width: 1349px">
	<form action="login1.do" name="form1" id=""method="post">
	<input type="hidden" name="A" value="1" />
	<input type="hidden" name="B" value="2" />
	<input type="hidden" name="C" value="3" />
	<input type="hidden" name="MemberId" value="1" />
	</form>
	<form  name="form2" method="post">
	<input type="hidden" name="A" value="1" />
	<input type="hidden" name="B" value="2" />
	<input type="hidden" name="C" value="3" />
	</form>
	<div class="header_title">
		<div class="header_top">
			<div class="header_top_box">
				<!--login-->
				<sh:userPropertyCheck operator="=false" propertyName="logined">
				<ul class="header_top_left">
					<li>欢迎来到XX1！<a href="uploadPic.do" class="fr">忘记密码?</a></li>
					<li>欢迎来到XX1！<a href="upload.do" class="fr">1忘记密码?</a></li>
<!-- 					<li>欢迎来到XX1！<a href="retPass.do" class="fr">忘记密码?</a></li> -->
					<li><a href="customer_login.do" rel="nofollow">请登录</a></li>
					<li><a href="customer_rest.do" rel="nofollow">快速注册</a></li>
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

	<div class="header">
		<div class="logo" id="logo_name">
			<span>XX商城</span>
		</div>
		<div class="header_searchbox">
			<form action="search_Goods.do" method="post" name="searchform" id="searchform">
				 <input name="Search" type="text" class="header_search_input" id="search_input" value="22">
				 <input name="Search11" type="hidden" class="header_search_input" value="22">
				<button type="button" onclick="Search1()" class="header_search_btn">搜索</button>
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
						<!--     start 购物车 -->
		<div id="shopping_cart" class="shopping_cart"
			onmouseover="show_cart()" onmouseout="hidden_cart()" style="margin-top: 20px;">
			<a id="cart" class="cart_link" href="#" rel="nofollow"> 
			<img src="http://p0.jmstatic.com/assets/cart.gif" width="28" height="28"class="cart_gif" style="float: left"> 
			<div style="float: left"><span class="text">去购物车结算</span> <span
				class="num" style="display: none;"></span> <s
				class="icon_arrow_down"></s></div>
			</a>

			<div class="cart_content" >
				<i class="cart-icons"></i>
				<div class="cart_content_null" id="cart_content" style="display: none;">
					购物车中还没有商品，快去挑选心爱的商品吧！
				</div>
			<div class="cart_content_all" style="display: none;">
				<div class="form-group" id="cartTip11">
					<div class="col-12">
						<div class="input-value textCenter fontred" id="cartTip">
						</div>
					</div>
					<div class="clear"></div>
				</div>
					<div class="cart_content_center" id="cart_id"></div>
					<div class="con_all">
						<div class="price_whole wd100" style="text-align: left;">
							<span>共<span class="num_all"></span>件商品
							</span>
						</div>
						<div>
						<div class="fll">
							<span class="price_gongji">共计<em>￥</em><span
								class="total_price"></span></span>
						</div>
						<div class="fll"><a href="#" class="cart_btn"rel="nofollow">去购物车结算</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="header_bottom">
		<div class="channel_nav_box">

			<div class="channel_nav_list_wrap">
				<!-- 			left <ul/>标签 -->
				<ul class="channel_nav_list">
					<li class="current" style="padding-right: 60px;"
						onmouseover="show_current()" onmouseout="hidden_current()"><span
						style="padding-left: 30px;">全部商品分类</span><span>
							<div id="show_hidd"
								style="position: absolute; left: 0px; background-color: rgb(224, 224, 224) !important; top: 38px; display: none; border: 1px solid red; width: 190px; min-height: 350px; z-index: 10;">
								<ul class="shop_List">
									<div class="clear"></div>
									<li class="woman shop_line b_g_c" id="woman_id"><i
										class="i"></i>女鞋
										<ul class="small_shop">
											<li><a target="_blank" title="单鞋" href="#">单鞋</a></li>
											<li><a target="_blank" title="短靴" href="#">短靴</a></li>
											<li><a target="_blank" title="马丁靴" href="#">马丁靴</a></li>
											<li><a target="_blank" title="长靴" href="#">长靴</a></li>
											<li><a target="_blank" title="凉拖" href="#">凉拖</a></li>
											<li><a target="_blank" title="凉鞋" href="#">凉鞋</a></li>
											<div class="right_shop_woman"></div>
											<div class="RightCata">
												<div>
													品牌：
													<ul>
														<li><a target="_self" href="#">啸行安</a></li>
														<li><a target="_self" href="#">Red dream lover</a></li>
														<li><a target="_self" href="#">ROBINLO&CO.罗宾诺</a></li>
														<li><a target="_self" href="#">PathFinder</a></li>
														<li><a target="_self" href="#">PLAYBOY</a></li>
													</ul>
												</div>
												<div>
													款式：
													<ul>
														<li><a target="_self" href="#">休闲皮鞋</a></li>
														<li><a target="_self" href="#">单鞋</a></li>
														<li><a target="_self" href="#">靴子</a></li>
														<li><a target="_self" href="#">凉鞋</a></li>
														<li><a target="_self" href="#">凉拖</a></li>
														<li><a target="_self" href="#">短靴</a></li>
														<li><a target="_self" href="#">凉靴</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
													</ul>
												</div>
												<div>
													跟款：
													<ul>
														<li><a target="_self" href="#">休闲皮鞋</a></li>
														<li><a target="_self" href="#">单鞋</a></li>
														<li><a target="_self" href="#">靴子</a></li>
														<li><a target="_self" href="#">凉鞋</a></li>
														<li><a target="_self" href="#">凉拖</a></li>
														<li><a target="_self" href="#">短靴</a></li>
														<li><a target="_self" href="#">凉靴</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
													</ul>
												</div>
												<div>
													热门推荐：
													<ul>
														<li><a target="_self" href="#">休闲皮鞋</a></li>
														<li><a target="_self" href="#">单鞋</a></li>
														<li><a target="_self" href="#">靴子</a></li>
														<li><a target="_self" href="#">凉鞋</a></li>
														<li><a target="_self" href="#">凉拖</a></li>
														<li><a target="_self" href="#">短靴</a></li>
														<li><a target="_self" href="#">凉靴</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
														<li><a target="_self" href="#">布鞋</a></li>
													</ul>
												</div>
											</div>
										</ul></li>
									<li class="man shop_line b_g_c" id="man_id"><i class="i"></i><span>男鞋</span>
										<ul class="small_shop">
											<li><a target="_blank" title="商务休闲" href="#">商务休闲</a></li>
											<li><a target="_blank" title="商务正装" href="#">商务正装</a></li>
											<li><a target="_blank" title="休闲皮鞋" href="#">休闲皮鞋</a></li>
											<li><a target="_blank" title="巴利世家" href="#">巴利世家</a></li>
											<div class="right_shop_man"></div>
										</ul></li>
									<li class="sport shop_line b_g_c" id="sport_id"><i
										class="i"></i>运动休闲
										<ul class="small_shop">
											<li><a target="_blank" title="跑步鞋" href="#">跑步鞋</a></li>
											<li><a target="_blank" title="潮流板鞋" href="#">潮流板鞋</a></li>
											<li><a target="_blank" title="户外鞋" href="#">户外鞋</a></li>
											<li><a target="_blank" title="篮球鞋" href="#">篮球鞋</a></li>
											<li><a target="_blank" title="足球鞋" href="#">足球鞋</a></li>
											<li><a target="_blank" title="常青款" href="#">常青款</a></li>
											<div class="right_shop_sport"></div>
										</ul></li>
								</ul>
							</div></li>
					<li class="gif_301_wrap" style="padding-left: 30px;"><a
						target="_blank" href="#" class="gif_301">首页</a></li>

					<li><a target="_blank" href="#">男鞋</a></li>
					<li class=""><a target="_blank" href="#">女鞋</a></li>
					<li class=""><a target="_blank" href="#">童鞋</a></li>
					<li class=""><a target="_blank" href="#">团购</a></li>
					<li class=""><a target="_blank" href="#">免单</a></li>
				</ul>
				<div class="header_pop_subAtc box-shadow" id="header_pop_subAct"
					style=""></div>
			</div>
		</div>
	</div>


	<div class="screen">
		<div class="screen_body">
			<div class="screen_container" >
				<img alt="" id="imgs" style="width: 100%" src="http://p0.jmstatic.com/banner/3477/68924_1920_350_002-web.jpg?1457677871"/>
			</div>
		</div>
	</div>
	<!-- 	start  advert-->
	<div class="home_top_tab" id="home_top_tab">
		<div class="tab_wrapper">
			<div class="tab_content">
				<div class="tab_box">
					<div class="home_top_ad">
						<div class="home_ad_list clearfix">
						<div style="border-bottom: 2px solid red;margin-bottom: 5px;font-size: 20px;font-weight: bold;"><span class="forhand">团购</span> <span style="position: relative;top:-4px;">.</span><span class="forhand" style="padding-left: 5px;">免单</span><span class="forhand" style="padding-right: 45px;float: right;">更多</span></div>
							<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68702_535_212_002-web.jpg?1457518203"
								border="0"></a> <a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68695_535_212_002-web.jpg?1457517901"
								border="0"></a> 
							<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68702_535_212_002-web.jpg?1457518203"
								border="0"></a> <a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68695_535_212_002-web.jpg?1457517901"
								border="0"></a> 
						<div style="border-bottom: 2px solid red;margin-bottom: 5px;font-size: 20px;font-weight: bold;"><span class="forhand">新款</span> <span style="position: relative;top:-4px;">.</span><span class="forhand" style="padding-left: 5px;">热卖</span><span class="forhand" style="padding-right: 45px;float: right;">更多</span></div>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68694_535_212_001-web.jpg?1457517875"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68722_535_212_002-web.jpg?1457519321"
								border="0"></a>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68694_535_212_001-web.jpg?1457517875"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68722_535_212_002-web.jpg?1457519321"
								border="0"></a>
						<div style="border-bottom: 2px solid red;margin-bottom: 5px;font-size: 20px;font-weight: bold;"><span class="forhand">女鞋馆</span> <span class="forhand" style="padding-right: 45px;float: right;">更多</span></div>		
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68704_535_212_002-web.jpg?1457518271"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68711_535_212_002-web.jpg?1457518541"
								border="0"></a>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68704_535_212_002-web.jpg?1457518271"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68711_535_212_002-web.jpg?1457518541"
								border="0"></a>
						<div style="border-bottom: 2px solid red;margin-bottom: 5px;font-size: 20px;font-weight: bold;"><span class="forhand">男鞋馆</span><span  class="forhand" style="padding-right: 45px;float: right;">更多</span></div>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68723_535_212_001-web.jpg?1457519429"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68539_535_212_002-web.jpg?1457580400"
								border="0"></a>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68723_535_212_001-web.jpg?1457519429"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68539_535_212_002-web.jpg?1457580400"
								border="0"></a>
						<div style="border-bottom: 2px solid red;margin-bottom: 5px;font-size: 20px;font-weight: bold;"><span class="forhand">童鞋管</span> <span class="forhand" style="padding-right: 45px;float: right;">更多</span></div>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68109_535_212_001-web.jpg?1457077941"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68706_535_212_002-web.jpg?1457518342"
								border="0"></a>
								<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68109_535_212_001-web.jpg?1457077941"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3538/68706_535_212_002-web.jpg?1457518342"
								border="0"></a>
						</div>
					</div>
				</div>
				<div class="tab_box" style="display: none">
					<div class="home_top_ad">
						<div class="home_ad_list clearfix">
							<a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68784_535_212_002-web.jpg?1457598776"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68758_535_212_002-web.jpg?1457595993"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68748_535_212_002-web.jpg?1457595055"
								border="0"></a><a
								href="http://hd.jumeiglobal.com/act/8-3-37020-plt_mengwuht_160312.html?from=all_null_index_yure_banner_two&amp;lo=3537&amp;mat=68766&amp;pos=normal_003"
								target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68766_535_212_002-web.jpg?1457597110"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68809_535_212_002-web.jpg?1457600302"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68781_535_212_002-web.jpg?1457598561"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68751_535_212_002-web.jpg?1457595543"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68846_535_212_002-web.jpg?1457605083"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68773_535_212_001-web.jpg?1457597973"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68762_535_212_002-web.jpg?1457596788"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68857_535_212_002-web.jpg?1457606497"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68843_535_212_002-web.jpg?1457604853"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68769_535_212_002-web.jpg?1457597485"
								border="0"></a><a href="%" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68760_535_212_002-web.jpg?1457596573"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68764_535_212_001-web.jpg?1457596998"
								border="0"></a><a href="#" target="_blank"><img
								src="http://p0.jmstatic.com/banner/3537/68756_535_212_002-web.jpg?1457595745"
								border="0"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="foolter" style="width: 1349px;">
	<div class="top">
		<div class="topback">
			<div class="first">
				<ul>
					<li class="them">新手帮助</li>
					<li class="other"><a href="#" title="正品保证" target="_blank"
						rel="nofollow">正品保证</a></li>
					<li class="other"><a href="#" title="售后服务须知" target="_blank"
						rel="nofollow">售后服务须知</a></li>
					<li class="other"><a href="#" title="常见问题" target="_blank"
						rel="nofollow">常见问题</a></li>
					<li class="other"><a href="#" title="优惠指南" target="_blank"
						rel="nofollow">优惠指南</a></li>
				</ul>
			</div>
			<div class="second">
				<ul>
					<li class="them">购物指南</li>
					<li class="other"><a href="#" title="尺码选择" target="_blank"
						rel="nofollow">尺码选择</a></li>
					<li class="other"><a href="#" title="发货时间" target="_blank"
						rel="nofollow">发货时间</a></li>
					<li class="other"><a href="#" title="配送运费" target="_blank"
						rel="nofollow">配送运费</a></li>
					<li class="other"><a href="#" title="签收/验货" target="_blank"
						rel="nofollow">签收/验货</a></li>
				</ul>
			</div>
			<div class="third">
				<ul>
					<li class="them">支付/配送</li>
					<li class="other"><a href="#" title="货到付款" target="_blank"
						rel="nofollow">货到付款</a></li>
					<li class="other"><a href="#" title="网上支付" target="_blank"
						rel="nofollow">网上支付</a></li>
					<li class="other"><a href="#" title="配送时间" target="_blank"
						rel="nofollow">配送时间</a></li>
					<li class="other"><a href="#" title="配送查询" target="_blank"
						rel="nofollow">配送查询</a></li>
				</ul>
			</div>
			<div class="fourth">
				<ul>
					<li class="them">售后服务</li>
					<li class="other"><a href="#" title="退换货政策" target="_blank"
						rel="nofollow">退换货政策</a></li>
					<li class="other"><a href="#" title="退换货办理" target="_blank"
						rel="nofollow">退换货办理</a></li>
					<li class="other"><a href="#" title="退款说明" target="_blank"
						rel="nofollow">退款说明</a></li>
				</ul>
			</div>
			<div class="fifth" style="border-right: 0px #fafafa solid;">
				<ul>
					<li class="them">会员服务</li>
					<li class="other"><a href="#" title="建议反馈" target="_blank"
						rel="nofollow">建议反馈</a></li>
					<li class="other"><a href="#" title="CEO邮箱" target="_blank"
						rel="nofollow">售后服务</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="center">
		<div class="HelpUL">
			<ul>
				<li class="first" style="padding-left: 175px;"><a href="#"
					target="_blank" rel="nofollow">了解XX</a><span class="ft_span">丨</span></li>
				<li><a href="#" target="_blank" rel="nofollow">联系XX</a><span
					class="ft_span">丨</span></li>
				<li><a href="#" target="_blank" rel="nofollow">版权声明</a><span
					class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">友情链接</a><span class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">网店货源网</a><span class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">温州豆花女鞋批发</a><span
					class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">货源哦</a><span class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">温州鞋批发网</a><span class="ft_span">丨</span></li>
				<li><a href="#" target="_blank">投诉与建议</a></li>
			</ul>
		</div>
	</div>
	<div class="bottom">
		<div class="copyright">
			Copyright © 2008 - 2015
			XX网&nbsp;&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;买鞋子&nbsp;&nbsp;上XX&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="#" target="_blank" rel="nofollow">粤ICP备140191aa号</a>
		</div>
	</div>
	</footer>
	<!-- <div class="foot_tt"> -->
	<!-- 	<div class="foot_tit"><span>友情链接</span></div> -->
	<!-- 	<div class="foot_txt"> -->
	<!-- 		&nbsp; -->
	<!-- 		<a href="http://www.114baidu.net" target="_blank">潍坊物流</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.qituan.net" target="_blank">企业福利团购</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.douhua.net" target="_blank">温州豆花女鞋批发</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.168dp.com" target="_blank">网店货源网</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.jumei8.net" target="_blank">温州鞋批发网</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.54086.com/b2b/" target="_blank">b2b网站大全</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.huoyuano.com/" target="_blank">货源哦</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.2vs8.com" target="_blank">28货源导航网</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.huoyuanzhijia.com" target="_blank">货源之家</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.igood.cn" target="_blank">爱多秀母婴分享社区</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.duxiangtuan.com" target="_blank">折800</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.vipconverse.com" target="_blank">converse帆布鞋</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.jiuyuango.com" target="_blank">九块九包邮网</a> -->
	<!-- 		&nbsp;|&nbsp;<a href="http://www.vip800.com" target="_blank">金折800官网</a> -->
	<!-- 			</div> -->
	<!-- 			</div> -->
	<!-- <div class="Ubag_footer_box"> -->
	<!-- 	<div class="Ubag_width950"> -->
	<!-- 		<div class="Ubag_footer"> -->
	<!--         	<p style="margin: 0;"> -->
	<!--             	<a href="#" target="_blank">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">帮助中心</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">隐私申明</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">会员优惠</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">售后服务</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">业务合作</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">网站公告</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">促销信息</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">商城条款</a>&nbsp;&nbsp;|&nbsp;&nbsp; -->
	<!--             	<a href="#" target="_blank">投诉与建议</a> -->
	<!--             </p> -->
	<!--             <p style="margin: 0;color: #fff;"> -->
	<!--             Copyright 2012 - 2015 &nbsp;&nbsp;<a href="http://www.jumei8.net"><b style="color:#fe9c2d;">www.xxxx.com</b>&nbsp;&nbsp;</a> All Rights Reserved &nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn">浙ICP备1301XX56号-1</a> -->
	<!--             &nbsp;&nbsp;<span class="stat_code"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;site=qq&amp;menu=yes"></a> -->
	<!-- <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;site=qq&amp;menu=yes"></a></span>            </p> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- </div> -->
	<!-- <hr> -->
	<!-- JiaThis Button BEGIN -->
	<!-- <div class="jiathis_style"> -->
	<!-- 	<span class="jiathis_txt">分享到：</span> -->
	<!-- 	<a class="jiathis_button_tools_1"></a> -->
	<!-- 	<a class="jiathis_button_tools_2"></a> -->
	<!-- 	<a class="jiathis_button_tools_3"></a> -->
	<!-- 	<a class="jiathis_button_tools_4"></a> -->
	<!-- 	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a> -->
	<!-- 	<a class="jiathis_counter_style"></a> -->
	<!-- </div> -->
	<!-- <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script> -->
	<!-- JiaThis Button END -->














	<!-- <input type="button" class="" value="提交" onclick="submit()"/> -->
	<%-- <zt:mobileTag formName="form1"  leftColSpan="2" rightColSpan="8" logined="false"  /> --%>
	<!-- </form> -->
<script type="text/javascript">
	function Search1(){
		debugger;
		var a =document.searchform.Search11.value;
		if(a=="22"){
		
		}else{
			document.searchform.action="search_Store.do";
		}document.searchform.submit();
	}
	function tologin(){
		document.form1.submit();
	}
	function logout(){
		document.form2.submit();
	}
	
	
		$(function() {
			window.top.document.getElementById("top_title").innerHTML = "首页";
			$(".shop_line").hover(function() {
				// 						debugger;
				$(this).addClass("shop_show");

				if ($(this).attr("id") == "man_id") {
					$("#span_line").addClass("span_line");
					$(".right_shop_man").addClass("right_shop_blod");
					$(".shop_id_man").css("display", "block");
				}
				if ($(this).attr("id") == "woman_id") {
					$("#span_line").addClass("span_line");
					$(".right_shop_woman").addClass("right_shop_blod");
					$(".RightCata").css("display", "block");
				}
				if ($(this).attr("id") == "sport_id") {
					$("#span_line").addClass("span_line");
					$(".right_shop_sport").addClass("right_shop_blod");
					$(".shop_id_woman").css("display", "block");
				}
			}, function() {
				debugger;
				$(this).removeClass("shop_show");
				if ($(this).attr("id") == "man_id") {
					$("#span_line").removeClass("span_line");
					$(".right_shop_man").removeClass("right_shop_blod")
					$(".shop_id_man").css("display", "none");
				}
				if ($(this).attr("id") == "woman_id") {
					$("#span_line").removeClass("span_line");
					$(".right_shop_woman").removeClass("right_shop_blod");
					$(".RightCata").css("display", "none");
				}
				if ($(this).attr("id") == "sport_id") {
					$("#span_line").removeClass("span_line");
					$(".right_shop_sport").removeClass("right_shop_blod")
					$(".shop_id_sport").css("display", "none");
				}
			});
		});
		//end
		function changeCity(obj) {
			debugger;
			if (isUndefinedOrNull(obj) || obj == "") {
				$(".city").removeClass("aa");
				$(".add-default-city").html("上海");
				$(".header-city-list").css("display", "none");
				$(("#shanghai")).addClass("aa");
			} else {
				var d = document.getElementById(obj).innerText;
				if (!isUndefinedOrNull(d) && d != "") {
					$(".city").removeClass("aa");
					$(".add-default-city").html(d);
					$(".header-city-list").css("display", "none");
					$(("#" + obj)).addClass("aa");
				} else {
					$(".city").removeClass("aa");
					$(".add-default-city").html("上海");
					$(".header-city-list").css("display", "none");
					$(("#shanghai")).addClass("aa");
				}
			}
		}


		
		//图片切换
		var timeInterval=3000; 
		var arr=new Array();
		var curIndex=0;
		arr[0]="./static/images/2.jpg";
		arr[1]="./static/images/1.jpg";
		arr[2]="http://p0.jmstatic.com/banner/3477/68924_1920_350_002-web.jpg?1457677871";
		function changeimages(){
			debugger;
			var obj=document.getElementById("imgs"); 
			if (curIndex==arr.length-1) 
			{ 
			curIndex=0; 
			} 
			else 
			{ 
			curIndex+=1; 
			} 
			var url=arr[curIndex];
// 			$("#imgs");
			obj.src=arr[curIndex]; 
		}
// 		setInterval(changeimages,timeInterval); 
		
		
	</script>
</body>
</html>