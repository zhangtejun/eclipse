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
<form action="submitOrder.do" name="submitOrder" method="post" id="submitOrder">
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
		<div style="float: left;padding-top: 40px;font-size: 20px;">购物车</div>
		<div class="header_searchbox">
			<form action="searchForGoods.do" method="get" name="searchForGoods" id="searchForGoods1" style="margin: 0; padding: 0;">
				<input name="search_input" type="text" class="header_search_input" id="search_input">
				<button type="button" onclick="search()" class="header_search_btn">搜索</button>
			</form>
			<div class="search_result_pop_a" id="top_out_search_pop_div"></div>
		</div>
		<!--     start 购物车 -->
	</div>
	
<!-- body start	 -->
<div class="body_container">
    <div class="body_main" style="min-height: 418px; margin-bottom: 50px;padding: 10px 130px;margin-bottom: 10px;">
							<div style="text-align: left;color: #ed145b;font-size: 16px">
								全部商品&nbsp;<span>1</span>
							</div>
    			<div class="form-group"style="background-color: #d9edf7;">
					<div class="col-6b">
						<div class="input-value">
					<div class="form-group"style="margin-bottom: 0;">								
					<div class="col-5b">
						<div class="input-value">
								<span style="position: relative;top: 1px;margin: 0 10px;"><input type="checkbox" class="box"></span><span>全选</span>
						</div>
					</div>
					<div class="col-7b">
						<div class="input-value">
								<span style="margin: 0 5px;">商品</span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
						</div>
					</div>
					<div class="col-6b">
						<div class="input-value">
					<div class="form-group"style="margin-bottom: 0;">							
					<div class="col-3b">
						<div class="input-value">
								单价(元)
						</div>
					</div>
					<div class="col-3b">
						<div class="input-value">
								数量
						</div>
					</div>
					<div class="col-3b">
						<div class="input-value">
								小计(元)
						</div>
					</div>
					<div class="col-3b">
						<div class="input-value">
								操作
						</div>
					</div>
					<div class="clear"></div>
				</div>								
						</div>
					</div>
					<div class="clear"></div>
				</div>

				<div class="well" style="border: 1px solid #d9edf7;padding-bottom: 15px;">
	<!-- start --><div style="text-align: left;font-size: 14px;margin: 5px 5px;">
					<span style="position: relative;top: 1px;margin: 0 4px;"><input type="checkbox" class="box"></span><span>的肌肤水分丢失</span>
				</div>
			<table width="100%" class="table" border="0" cellpadding="0" cellspacing="0" >
			 <tr class="table-header">
				<td width="5%"><div style="padding-left: 5px;"><input type="checkbox" class="box"></span></div></td>
				<td width="15%"><div class="cart_pic"><img alt="意尔康女鞋 新款时尚坡跟蝴蝶结豆豆鞋5572ZE29688W 米色 38" clstag="clickcart|keycount|xincart|cart_sku_pic" src="//img10.360buyimg.com/cms/s80x80_jfs/t2644/30/388700064/97101/de77640d/57104fc2N32958e41.jpg"></div></td>
				<td width="24%"><div>意尔康女鞋 新款时尚坡跟蝴蝶结豆豆鞋5572ZE29688W 米色 38</div></td>
				<td width="10%"><div>颜色：米色</div><div>尺码：38</div></td>
				<td width="10%"><div><strong>149.00</strong></div></td>
				<td width="12%"><div>
				<div class="quantity-form">
						<a href="javascript:void(0);" class="decrement disabled fl">-</a>
						<input autocomplete="off" type="text" class="itxt" value="1">
						<a href="javascript:void(0);" class="increment">+</a>
					</div>
				</div></td>
				<td width="12%"><div><strong>149.00</strong></div></td>
				<td width="12%"><div><a>删除</a></div></td>
			</tr>
<!-- start --></table>		
	<!-- start --><div style="text-align: left;font-size: 14px;margin: 5px 5px;">
					<span style="position: relative;top: 1px;margin: 0 4px;"><input type="checkbox" class="box"></span><span>的肌肤水分丢失</span>
				</div>
			<table width="100%" class="table" border="0" cellpadding="0" cellspacing="0" >
			 <tr class="table-header">
				<td width="5%"><div style="padding-left: 5px;"><input type="checkbox" class="box"></span></div></td>
				<td width="15%"><div class="cart_pic"><img alt="意尔康女鞋 新款时尚坡跟蝴蝶结豆豆鞋5572ZE29688W 米色 38" clstag="clickcart|keycount|xincart|cart_sku_pic" src="//img10.360buyimg.com/cms/s80x80_jfs/t2644/30/388700064/97101/de77640d/57104fc2N32958e41.jpg"></div></td>
				<td width="24%"><div>意尔康女鞋 新款时尚坡跟蝴蝶结豆豆鞋5572ZE29688W 米色 38</div></td>
				<td width="10%"><div>颜色：米色</div><div>尺码：38</div></td>
				<td width="10%"><div><strong>149.00</strong></div></td>
				<td width="12%"><div>
				<div class="quantity-form">
						<a href="javascript:void(0);" class="decrement disabled fl">-</a>
						<input autocomplete="off" type="text" class="itxt" value="1">
						<a href="javascript:void(0);" class="increment">+</a>
					</div>
				</div></td>
				<td width="12%"><div><strong>149.00</strong></div></td>
				<td width="12%"><div><a>删除</a></div></td>
			</tr>
<!-- start --></table>		
				</div>
<!-- button -->	
    			<div class="form-group"style="background-color: #d9edf7;">
					<div class="col-6b">
						<div class="input-value">
					<div class="form-group"style="margin-bottom: 0;">								
					<div class="col-5b">
						<div class="input-value">
								<span style="position: relative;top: 1px;margin: 0 10px;"><input type="checkbox" class="box"></span><span>全选</span>
						</div>
					</div>
					<div class="col-7b">
						<div class="input-value">
						</div>
					</div>
					<div class="clear"></div>
				</div>
						</div>
					</div>
					<div class="col-6b">
						<div class="input-value">
					<div class="form-group"style="margin-bottom: 0;">							
					<div class="col-9b">
						<div class="input-value">已选择<b class="fontred" id="goodsNum">1</b>件商品&nbsp;总价（不含运费）<b class="fontred" id="talPrice">￥199.00</b>&nbsp;已优惠￥0.00
						</div>
					</div>
					<div class="col-3b">
								<button type="button buttontop" class="input-text" name="submitBtn" onclick="doBeforeSubmit();" >去结算</button>
					</div>
					<div class="clear"></div>
				</div>								
						</div>
					</div>
					<div class="clear"></div>
				</div>			
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
function doBeforeSubmit(){
	document.submitOrder.submit();
}
</script>
</html>