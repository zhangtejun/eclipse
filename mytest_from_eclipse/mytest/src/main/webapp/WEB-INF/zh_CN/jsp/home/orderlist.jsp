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
<form action="orderlist.do" name="orderlist" method="post" id="orderlist">
</form>
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

<div class="header_orderlist">

	<div class="form-group">
		<div class="col-2 top0">
			<div class="input-value">
		<div class="logo mp0" id="logo_name1" style="font-size: 25px;">
			<div style="margin: 17px 20px;">XX商城</div>
<!-- 		<div class="header_searchbox" style="min-height: 40px;padding-top: 0"> -->
<!-- 			<form action="search.do" method="get" name="searchform" id="searchform"> -->
<!-- 				 <input name="Search" type="text" class="header_search_input" id="search_input" value="22"> -->
<!-- 				<button type="button" onclick="Search1()" class="header_search_btn">搜索</button> -->
<!-- 			</form> -->

<!-- 		</div> -->
		</div>
			</div>
		</div>
		<div class="col-1 top0">
			<div class="input-value">
				<div style="margin: 17px 0px;">
				<div>我的商城</div>
				<div>返回商城主页</div>				
				</div>
			</div>
		</div>
		<div class="col-3 top0">
			<div class="input-value">
				<div style="margin: 27px 0px;">
				<div class="fl">首页</div>
				<div class="fl">帐号管理</div>
				<div class="fl">消息</div>
				</div>
			</div>
		</div>
		<div class="col-3 top0">
			<div class="input-label">
				<div style="margin: 23px 0px;">
<div class="form">
					<input type="text" style="height: 25px" onkeydown="javascript:if(event.keyCode==13) search('key');" id="key" class="text" style="color: rgb(153, 153, 153);">
					<button style="height: 29px;width: auto!important;" onclick="search('key');return false;" class="button cw-icon" type="button">搜索</button></div>
				</div>
			</div>
		</div>
		<div class="col-3 top0">
			<div class="input-label">
				<div style="">
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
			</div>
		</div>
		<div class="clear"></div>
	</div>
		<!--     start 购物车 -->
	</div>
	
<!-- body start	 -->
<div class="body_container">
    <div class="body_main" style="min-height: 418px; margin-bottom: 50px;padding: 10px 130px;margin-bottom: 10px;">
		<div class="wells" style="overflow: hidden;">
<div class="form-group">
	<div class="col-2 ">
		<div class="input-value"
			style="margin: 1PX 5PX; border: 1PX SOLID #d9edf7;">
			<div style="margin: 10px 35px;border: 1px solid #d9edf7;padding: 5px 17px;">订单中心</div>
			<div style="margin: 10px 35px;border: 1px solid #d9edf7;padding: 5px 17px;">我的订单</div>
		</div>

	</div>
	<div class="col-9 ">
		<!-- 					<div class="input-value"> -->
		<!-- 					</div> -->
		<div class="form-group" style="border: 1px solid #d9edf7;">
			<div class="col-4">
				<span class="spanfor">全部订单 </span> <span class="spanfor">待付款
				</span> <span class="spanfor">待评价 </span> <span class="spanfor">待收货
				</span>
			</div>
			<div class="col-4">
				<div class="input-label">订单回收站</div>
			</div>
			<div class="col-4">
				<div class="">
					<input type="text" class="" style="height: 25px;color: rgb(204, 204, 204);" value="商品名称/商品编号/订单号">
				<button style="height: 29px;width: auto!important;" onclick="search('key');return false;" class="button cw-icon" type="button">查询</button>
				</div>
			</div>
			<div class="clear"></div>
		</div>


		<div class="form-group"
			style="border: 1px solid #d9edf7; background-color: #d9edf7;">
			<div class="col-2">
				<div class="input-label">近三个月订单</div>
			</div>
			<div class="col-4">
				<div class="input-label textCenter">订单详情</div>
			</div>
			<div class="col-2">
				<div class="input-label textCenter">收货人</div>
			</div>
			<div class="col-1">
				<div class="input-label">金额</div>
			</div>
			<div class="col-2">
				<div class="input-label">全部状态</div>
			</div>
			<div class="col-1">
				<div class="input-label">操作</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!-- end  -->
		<!-- start 内容  -->
		
		<div class="form-group"style="border: 1px solid #d9edf7">
	<div class="form-group-magin0" style="overflow: hidden;min-height: 38px;background-color: #d9edf7;">
		<div class="col-3">
			<div class="input-value">2016-05-12 16:37:31</div>
		</div>
		<div class="col-3">
			<div class="input-value">订单号：18915896684</div>
		</div>
		<div class="col-5">
			<div class="input-value"></div>
		</div>
		<div class="col-1">
			<div class="input-label">删除</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="form-group">
			<div class="col-2">
				<div class="input-label">
				<div style="min-height: 70px;">
		<a href="//item.jd.com/11800599.html" target="_blank">
      <img class="" style="border: 1px solid #d9edf7;" src="//img10.360buyimg.com/N6/s60x60_jfs/t2368/313/1231103465/313412/47c41ce/564ec9a6Nfa710c73.jpg" title="超实用的Node.js代码段" data-lazy-img="done" width="60" height="60">
        </a>	</div>			
				</div>
			</div>
			<div class="col-3">
				<div class="input-value" style="word-wrap: break-word;word-break: break-all;height: 39px;overflow: hidden;margin: 10px;font-size: 12px">
				<a href="//item.jd.com/2375276.html" class="a-link" clstag="click|keycount|orderinfo|order_product" target="_blank" title="联想(Lenovo)小新700电竞版 ISK 15.6英寸超薄游戏本（i5-6300HQ 4G 500G GTX950M FHD IPS屏 Win10）黑">联想(Lenovo)小新700电竞版 ISK 15.6英寸超薄游戏本（i5-6300HQ 4G 500G GTX950M FHD IPS屏 Win10）黑</a>
				</div>
			</div>
			<div class="col-1">
				<div class="input-label"><div class="margin10">x<span>2</span></div></div>
			</div>
			<div class="col-2">
				<div class="input-label">
					<div class="margin10">zhangtrjun</div>
				</div>
			</div>
			<div class="col-2">
				<div class="input-label"><div class="margin10">1999999.00</div></div>
			</div>
			<div class="col-2">
				<div class="input-label"><div class="margin10">再次购买</div></div>
			</div>
		<div class="clear"></div>
	</div>
			
			

			<div class="clear"></div>
		</div>		
		<!-- start 内容  -->
		
		<div class="form-group"style="border: 1px solid #d9edf7">
	<div class="form-group-magin0" style="overflow: hidden;min-height: 38px;background-color: #d9edf7;">
		<div class="col-3">
			<div class="input-value">2016-05-12 16:37:31</div>
		</div>
		<div class="col-3">
			<div class="input-value">订单号：18915896684</div>
		</div>
		<div class="col-5">
			<div class="input-value"></div>
		</div>
		<div class="col-1">
			<div class="input-label">删除</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="form-group">
			<div class="col-2">
				<div class="input-label">
				<div style="min-height: 70px;">
		<a href="//item.jd.com/11800599.html" target="_blank">
      <img class="" style="border: 1px solid #d9edf7;" src="//img10.360buyimg.com/N6/s60x60_jfs/t2368/313/1231103465/313412/47c41ce/564ec9a6Nfa710c73.jpg" title="超实用的Node.js代码段" data-lazy-img="done" width="60" height="60">
        </a>	</div>			
				</div>
			</div>
			<div class="col-3">
				<div class="input-value" style="word-wrap: break-word;word-break: break-all;height: 39px;overflow: hidden;margin: 10px;font-size: 12px">
				<a href="//item.jd.com/2375276.html" class="a-link" clstag="click|keycount|orderinfo|order_product" target="_blank" title="联想(Lenovo)小新700电竞版 ISK 15.6英寸超薄游戏本（i5-6300HQ 4G 500G GTX950M FHD IPS屏 Win10）黑">联想(Lenovo)小新700电竞版 ISK 15.6英寸超薄游戏本（i5-6300HQ 4G 500G GTX950M FHD IPS屏 Win10）黑</a>
				</div>
			</div>
			<div class="col-1">
				<div class="input-label"><div class="margin10">x<span>2</span></div></div>
			</div>
			<div class="col-2">
				<div class="input-label">
					<div class="margin10">zhangtrjun</div>
				</div>
			</div>
			<div class="col-2">
				<div class="input-label"><div class="margin10">1999999.00</div></div>
			</div>
			<div class="col-2">
				<div class="input-label"><div class="margin10">再次购买</div></div>
			</div>
		<div class="clear"></div>
	</div>
			
			

			<div class="clear"></div>
		</div>		
	</div>
</div>
				

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- start 收货人信息 -->
	</div>	<!-- end wells --><div class="fll" style="border: 1px solid #d9edf7;margin-left: 5px;margin-right: 5px;"><div style="margin: 4px 5px;min-width: 82px;text-align: center;cursor: pointer;" onclick="doSubmit()">查看订单</div></div>		
<%--    <sh:mobileTag formName="form1"  leftColSpan="4" rightColSpan="8" logined="true" autoSendFlag="false"/> --%>
    </div>
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
function doSubmit(){
	document.orderlist.submit();
}
$(function(){
	Ftwo();//显示2，浅化1
	Fthree();
// 	$(".three").css("border-top-color","#caecb6");
// 	$(".three .s-num").css("background-position-x","-46px");
// 	$(".three .s-text").css("border-top-color","#caecb6");
	$(".last").css("border-top-color","#7abd54");
	$(".last .s-num").css("background-position-x","-91px");
	$(".last .s-text").css("border-top-color","#7abd54");
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
// 	$(".three").css("border-top-color","#7abd54");
// 	$(".three .s-num").css("background-position-x","-23px");
// 	$(".three .s-text").css("border-top-color","#7abd54");
}
</script>
</html>