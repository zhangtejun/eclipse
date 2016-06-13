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

	<div class="header">
		<div class="logo" id="logo_name">
			<span>XX商城</span>
		</div>
		<div style="float: left;padding-top: 40px;font-size: 20px;">结算页</div>
		<div class="header_searchbox header_order">
<div class="form-group">
                    <div class="col-12">
                    <div id="sflex04" class="stepflex bdtop">
                    <dl class="first" style="border-top-color: #7abd54;">
                        <dt class="s-num" style="background-position: -23px 0;">1</dt>
                        <dd class="s-text" style="color: #7abd54;">我的购物车<s></s><b></b></dd>
                        <dd></dd>
                    </dl>
                    <dl class="two">
                        <dt class="s-num">2</dt>
                        <dd class="s-text">填写核对订单信息<s></s><b></b></dd>
                    </dl>
<!--                     <dl class="three"> -->
<!--                         <dt class="s-num">3</dt> -->
<!--                         <dd class="s-text">订单成功提交<s></s><b></b></dd> -->
<!--                     </dl> -->
                    <dl class="last">
                        <dt class="s-num" style="background-position-x: 46px;">&nbsp;</dt>
                        <dd class="s-text">订单成功提交<s></s><b></b></dd>
                    </dl>
                </div>
                    </div>
                    <div class="clear"></div>
                </div>
		</div>
		<!--     start 购物车 -->
	</div>
	
<!-- body start	 -->
<div class="body_container">
    <div class="body_main" style="min-height: 418px; margin-bottom: 50px;padding: 10px 130px;margin-bottom: 10px;">
		<div class="wells">
		<!-- start 收货人信息 -->
		<div class="">
			<div class="form-group">							
				<div class="col-1 ">
					<div class="input-value">
					</div>
				</div>
				<div class="col-10" style="border: 1px solid #d9edf7;">
					<div class="input-value">
						<div class="margin10 fontred">感谢您，订单提交成功！</div>
						<div class="margin10"style="margin: 5px;">
							<div class="fll" style="border: 1px solid #d9edf7;margin-left: 5px;margin-right: 5px;"><div style="margin: 4px 5px;min-width: 82px;text-align: center;cursor: pointer;" onclick="doSubmit()">查看订单</div></div>
							<div class="fll" style="border: 1px solid #d9edf7;margin-left: 5px;margin-right: 5px;"><div style="margin: 4px 5px;min-width: 82px;text-align: center;cursor: pointer;">再次购买</div></div>
						</div>
						<div class="margin10" style="border: 1px solid #d9edf7;padding: 15px 15px;">
						<span style="margin: 5px;">订单号：</span><span style="margin: 5px;" class="fontred">18915896684</span><span style="margin: 5px;">货到付款：</span><span style="margin: 5px;" class="fontred ">57.40元</span> <span style="margin: 5px;">xx快递</span>
						</div>
						<div class="margin10"><span style="margin: 5px;">重要提醒：xx平台及销售商不会以 </span><span style="margin: 5px;" class="fontred">订单异常、系统升级 </span><span style="margin: 5px;">等为由，要求您点击任何链接进行退款操作。请关注xx平台</span><a>“谨防诈骗公告声明”</a></div>
					</div>
				</div>
			<div class="clear"></div>
		    </div>	
			<div class="form-group">	
			<div class="col-1 ">
					<div class="input-value">
					</div>
					</div>						
				<div class="col-10 ">
					<div class="input-value">
					<span style="margin: 15px;">完成支付后，您可以：</span>
					<a style="margin: 5px;">继续购物 </a>
					<a style="margin: 5px;">问题反馈</a>
					</div>
				</div>
			<div class="clear"></div>
		    </div>	
			<div class="form-group-margin0">	
			<div class="col-1 ">
					<div class="input-value">
					</div>
					</div>						
				<div class="col-10 ">
					<div class="input-value">
					<span style="margin: 15px;">购买了同样商品的顾客还购买了</span>

					</div>
				</div>
			<div class="clear"></div>
		    </div>	
<!-- 		    给你推荐  start-->
			<div class="form-group" >	
			<div class="col-1 ">
					<div class="input-value">
					</div>
					</div>						
				<div class="col-10 "style="border: 1px solid #d9edf7">
					<div class="input-value">
<div class="form-group" >
							<div class="col-12">
								<div class="gdlist">
									<div class="goods_id">
										<a target="iframe" href="goodsdetil.do"><img class="lazy" alt="" src="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" data-original="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" style="display: inline;"></a></div>
									<div class="goods_name"style="margin: 5px 5px;"><a target="_blank" href="/Home/Goods/4309086" class="search_list_text"  goods_id="4309086">春夏季底帮透气帆布鞋女休闲鞋韩版运动版鞋 <em style="color:#db2929;"></em></a>
									</div>
									<div class="search_list_rmbs">
										<em class="search_list_oldrmb"><s>¥ 99.00</s></em>
									</div>
									<div  class="goods_price" style="font-size:20px;color: #ed145b;margin-left: 5px;"><em class="search_list_yuanrmb">¥<em id="sales_price" style="font-size:20px;font-family:Arial;padding-left: 2px">40.00</em>
									</em></div>
								</div>
								<div class="gdlist">
									<div class="goods_id">
										<a target="_blank" href="/Home/Goods/4309086"><img class="lazy" alt="" src="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" data-original="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" style="display: inline;"></a></div>
									<div class="goods_name"style="margin: 5px 5px;"><a target="_blank" href="/Home/Goods/4309086" class="search_list_text"  goods_id="4309086">春夏季底帮透气帆布鞋女休闲鞋韩版运动版鞋 <em style="color:#db2929;"></em></a>
									</div>
									<div class="search_list_rmbs">
										<em class="search_list_oldrmb"><s>¥ 99.00</s></em>
									</div>
									<div  class="goods_price" style="font-size:20px;color: #ed145b;margin-left: 5px;"><em class="search_list_yuanrmb">¥<em id="sales_price" style="font-size:20px;font-family:Arial;padding-left: 2px">40.00</em>
									</em></div>
								</div>
								<div class="gdlist">
									<div class="goods_id">
										<a target="_blank" href="/Home/Goods/4309086"><img class="lazy" alt="" src="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" data-original="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" style="display: inline;"></a></div>
									<div class="goods_name"style="margin: 5px 5px;"><a target="_blank" href="/Home/Goods/4309086" class="search_list_text"  goods_id="4309086">春夏季底帮透气帆布鞋女休闲鞋韩版运动版鞋 <em style="color:#db2929;"></em></a>
									</div>
									<div class="search_list_rmbs">
										<em class="search_list_oldrmb"><s>¥ 99.00</s></em>
									</div>
									<div  class="goods_price" style="font-size:20px;color: #ed145b;margin-left: 5px;"><em class="search_list_yuanrmb">¥<em id="sales_price" style="font-size:20px;font-family:Arial;padding-left: 2px">40.00</em>
									</em></div>
								</div>
								<div class="gdlist">
									<div class="goods_id">
										<a target="_blank" href="/Home/Goods/4309086"><img class="lazy" alt="" src="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" data-original="http://img.zhuyun.cn/M00/48/4D/wKgJNFcvaoyAbGtfAAXjV8QbUSE509.png" style="display: inline;"></a></div>
									<div class="goods_name"style="margin: 5px 5px;"><a target="_blank" href="/Home/Goods/4309086" class="search_list_text"  goods_id="4309086">春夏季底帮透气帆布鞋女休闲鞋韩版运动版鞋 <em style="color:#db2929;"></em></a>
									</div>
									<div class="search_list_rmbs">
										<em class="search_list_oldrmb"><s>¥ 99.00</s></em>
									</div>
									<div  class="goods_price" style="font-size:20px;color: #ed145b;margin-left: 5px;"><em class="search_list_yuanrmb">¥<em id="sales_price" style="font-size:20px;font-family:Arial;padding-left: 2px">40.00</em>
									</em></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			<div class="clear"></div>
		    </div>	
		</div>	<!-- end 地址下边框 -->		
	</div>	<!-- end wells -->		
<%--    <sh:mobileTag formName="form1"  leftColSpan="4" rightColSpan="8" logined="true" autoSendFlag="false"/> --%>
    </div>
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