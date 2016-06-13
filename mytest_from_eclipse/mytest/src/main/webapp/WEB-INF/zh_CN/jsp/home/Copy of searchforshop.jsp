<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp" %>
<title></title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- <form action="" name="form1"> -->
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
			<form action="searchForGoods.do" method="get" name="searchForGoods" id="searchForGoods1" style="margin: 0; padding: 0;">
				<input name="search_input" type="text" class="header_search_input" id="search_input">
				<button type="button" onclick="search()" class="header_search_btn">搜索</button>
			</form>
			<div class="search_result_pop_a" id="top_out_search_pop_div"></div>

<!-- 			<ul class="hot_word"> -->
<!-- 				<li><a href="#" target="">热门搜索：</a></li> -->
<!-- 				<li><a target="" href="#">面膜</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">洗面奶</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">补水</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">香水</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">眼霜</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">口红</a><s class="line"></s></li> -->
<!-- 				<li><a target="" href="#">护肤套装</a></li> -->
<!-- 			</ul> -->
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
					<li class="current" style="padding-right: 60px;height: 28px;"
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
	
<!-- body start	 -->
<div class="body_container">
    <div class="body_main" style="min-height: 418px; margin-bottom: 50px;padding: 10px 130px;margin-bottom: 10px;">
    			<div class="form-group" >
					<div class="col-12">
						<div class="input-label">
							<div style="text-align: left;color: #337ab7">
								所以结果：
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
    				<div class="form-group" style="border: 1px solid #d9edf7;">
					<div class="col-12">
						<div class="input-label">
							<div style="text-align: left;">
							<span class="divfor" style="color: #9a9a9a;">你是不是想找:</span>
							<span class="divfor">休闲鞋</span>
							<span class="divfor">运动鞋</span>
							<span class="divfor">休闲鞋</span>
							<span class="divfor">运动鞋</span>
							<span class="divfor">休闲鞋</span>
							<span class="divfor">运动鞋</span>
							<span class="divfor">休闲鞋</span>
							<span class="divfor">运动鞋</span>
							<span class="divfor">休闲鞋</span>
<!-- 							</div> -->
<!-- 							<div style="float: left;width: 50%;"> -->
<!-- 							<span class="divfor">店铺类型</span> -->
<!-- 							<span class="divfor">所在地</span> -->
<!-- 							<span class="divfor">好评率</span> -->
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="form-group" style="border: 1px solid #d9edf7;background-color: #d9edf7;">
					<div class="col-12">
						<div class="input-label">
							<div style="text-align: left;">
							<span class="divfor" style="color: #ed145b;">综合排序</span>
							<span class="divfor">销量</span>
							<span class="divfor"> 信用</span>
<!-- 							</div> -->
<!-- 							<div style="float: left;width: 50%;"> -->
							<span class="divfor">人气</span>
							<span class="divfor">价格</span>
							<span class="divfor">好评率</span>
							<span class="divfor">所在地</span>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="well" style="border: 1px solid #d9edf7;padding-bottom: 15px;">
				<div class="form-group" >
					<div class="col-12">
						<div class="input-label">
							<div style="border-bottom: 1px solid red;min-height: 150px">
								1111
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="form-group" >
					<div class="col-12">
						<div class="input-label">
							<div style="border-bottom: 1px solid red;min-height: 150px">
								222
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

				</div><!-- end well -->
			
    
    </div>
<%--    <sh:mobileTag formName="form1"  leftColSpan="4" rightColSpan="8" logined="true" autoSendFlag="false"/> --%>
    </div>
    				<div class="form-group"style="text-align: center;padding-left: 300px;padding-right: 300px;">
							<div style="height: 100%;width: 749px;position: absolute;">
							<div class="clear"></div>
		<div class="divfor" style="float: left;border: 1px solid #eee;background-color: #eee;margin-left: 20px;margin-right: 20px;height: 40px;"><div style="padding-top: 10px;">shangyiye</div></div>
		<div class="divfor" style="float: left;border: 1px solid #eee;background-color: #eee;margin-left: 20px;margin-right: 20px;height: 40px;"><div style="padding-top: 10px;">111</div></div>
		<div class="divfor" style="float: left;border: 1px solid #eee;background-color: #eee;margin-left: 20px;margin-right: 20px;height: 40px;"><div style="padding-top: 10px;">下一页</div></div>
							</div>
					<div class="clear"></div>
				</div>
<!-- 		<div class="textRight" style="text-align: right!important"> -->
<%-- 			<pe:pageable list="${LoopResult}" pageSize="${QueryNumber}" currentIndex="${BeginNumber}" total="${SpdTotalNo}"	formName="form1" /> --%>
<!-- 		<span>111</span> -->
<!-- 		<span>111</span> -->
<!-- 		<span>111</span> -->
<!-- 		</div> -->
<!--       	<div class="button-group textCenter"> -->
<!--             <button type="button" name="submitButton" class="button" onclick="check()">提交</button> -->
<!--         </div>   -->
   	<div>
</div>
<!-- <div id="footer_container" class="footer_white" style="padding-top:5px;background: none;border-top: none;"> -->
<!--     <div class="footer_body" id="footer_body"> -->
        
<!--     </div> -->
<!-- </div> -->
	<footer class="foolter" style="width: 1349px;padding-top: 10px;">
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
<!-- </form> -->
</body>
<script type="text/javascript">
function search(){
	document.searchForGoods.submit();
}
</script>
</html>