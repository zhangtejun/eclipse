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
<form action="gocart.do" name="gocart" method="post" id="gocart">
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
		<div class="header_searchbox">
			<form action="searchForGoods.do" method="get" name="searchForGoods" id="searchForGoods1" style="margin: 0; padding: 0;">
				<input name="search_input" type="text" class="header_search_input" id="search_input">
				<button type="button" onclick="search()" class="header_search_btn">搜索</button>
			</form>
			<div class="search_result_pop_a" id="top_out_search_pop_div"></div>
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
							<div style="text-align: left;color: #337ab7;">
								首页&nbsp;>&nbsp;女鞋 &nbsp;>&nbsp;休闲鞋 &nbsp;>&nbsp;乐福鞋/小白鞋
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>

				<div class="well" style="border: 1px solid #d9edf7;padding-bottom: 15px;">
				<div class="form-group" >
					<div class="col-4">
						<div class="input-label">
<!-- 							<div style="border: 1px solid red;min-height: 150px;overflow: hidden;max-height: 400px;"> -->
<!-- 								<div id="preview"> -->
<!--                 <div id="spec-n1" class="jqzoom" onclick="window.open('//item.jd.com/bigimage.aspx?id=1736462824')" clstag="shangpin|keycount|product|mainpic_2"> -->
<!--                     <img data-img="1" width="350" height="350" src="//img14.360buyimg.com/n1/jfs/t2227/11/186580544/182417/11e7f051/55f44ed6N057e029d.jpg" alt="" jqimg="//img14.360buyimg.com/n0/jfs/t2227/11/186580544/182417/11e7f051/55f44ed6N057e029d.jpg" style=""> -->
<!--                                                         <div class="jqZoomPup" style="width: 175px; height: 175px; visibility: visible; top: 96.5px; left: 102px;">&nbsp;</div></div><div class="zoomdiv" style="width: 400px; height: 400px; display: block;"><img class="bigimg" src="//img14.360buyimg.com/n0/jfs/t2227/11/186580544/182417/11e7f051/55f44ed6N057e029d.jpg"></div> -->
<!--                                                 <div id="spec-list" clstag="shangpin|keycount|product|lunbotu_2"> -->
<!--                 </div> -->
<!--             </div> -->
<!-- 							</div> -->
						</div>
					</div>
					<div class="col-8">
						<div class="input-value">
							<div style="border: 1px solid #d9edf7;border-right-style: none;min-height: 150px">
								
								
				<div class="form-group" >
					<div class="col-8">
						<div class="input-value">
							<div style="min-height: 150px">
								<div><b style="margin-left: 5px;">卡帝乐鳄鱼 春夏新款休闲皮鞋男士休闲鞋驾车鞋男户外运动板鞋鞋子男</b></div>
								<div style="border-top: 1px dotted #d9edf7;margin: 10px 25px;padding-top: 10px;text-decoration: line-through;">
									原价：203元
								</div>
								<div style="border-top: 1px dotted #d9edf7;margin: 10px 25px;padding-top: 10px;">
									现价：<span style="color: #ed145b">120元</span>
								</div>
								<div style="border-top: 1px dotted #d9edf7;margin: 10px 25px;padding-top: 10px;">
									商品评价：<a>(已有 0 人评价，销量：0)</a>
								</div>
							</div>
							<div>
								<div style="width: 410px;margin:10px 25px;min-height: 45px;overflow: hidden;">
									<div style="float: left;margin-top: 11px;">选择颜色：</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;"><div class="borderdiv">111</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 60px;">11</div>
								</div>
								<div style="width: 410px;margin:0 25px;min-height: 45px">
									<div style="float: left;margin-top: 11px;">选择尺码：</div>
									<div title="棕色" style="margin-top: 7px;margin-left:5px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:5px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:5px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #d9edf7;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
									<div title="棕色" style="margin-top: 7px;margin-left:6px;border: 1px solid #ed145b;float: left;height: 30px;width: 30px;"><div style="margin-top: 5px;margin-left: 6px">35</div></div>
								</div>
						<div style="margin: 10px 25px;overflow: hidden;">
							<div style="float: left;margin-top: 8px;">数量：</div>
								<div class="choose-amount fl ">
                                <div class="wrap-input">
                                    <a class="reduce" href="javascript:;" onclick="setAmount.reduce('#buy-num')">-</a>
                                    <a class="add" href="javascript:;" onclick="setAmount.add('#buy-num')">+</a>
                                    <input class="textnum" id="buy-num" value="1" onkeyup="setAmount.modify('#buy-num');">
                                </div>
                           		</div>
                      	<div class="textCenter" style="margin-top: 4PX;padding-left: 10PX;float: left">
						<button type="button" class="input-text" name="submitBtn" onclick="doBeforeSubmit();" >加入购物车</button>
						<button type="button" class="input-text mglf_but" name="backButton" onclick="doReturnSubmit();" >立即购买</button>
        	  </div>
						</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="input-value">
							<div style="border: 1px solid #d9edf7;border-right-style: none;min-height: 150px">
								<div class="brand-logo">卡帝乐鳄鱼 春夏新款休闲皮鞋男士休闲鞋驾车鞋男户外运动板鞋鞋子男</div>
								<div class="seller-infor">
				                    <a class="name" href="#" target="_blank" title="华硕笔记本京东官方旗舰店">华硕笔记本京东官方旗舰店</a>
				    			</div>
								<div class="seller-infor">
				                    <div class="border" title="进入店铺"><div class="borderdiv">进入店铺</div></div>
				                    <div class="border" title="关注店铺"><div class="borderdiv">关注店铺</div></div>
				    			</div>
								<div class="seller-infor" style="border-bottom: none;">
				                    <div class="borderdiv Float">动态评分：</div>
				                    <div class="borderul">
									<div class="StoreInfo_Grade">
										<li class="Checked"></li>
										<li class="Checked"></li>
										<li class="Checked"></li>
										<li class="Checked"></li>										</ul>
										<li class=""></li>
									</div>
									</div>
				    			</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				</div><!-- end well -->
				<!-- start well -->
				<div class="well" style="border: 1px solid #d9edf7;padding-bottom: 15px;margin-top: 20px;">	                   	 
<div id="search_result">
		<div class="search_content">
			<div class="search_content_left" style="margin-top: 5px;">
				<div class="search_content_left1">
					<div>
						<div class="form-group backgroundcolor forall">
							<div class="col-2">
								<div class="input-label"></div>
							</div>
							<div class="col-10">
								<div class="input-value fontred">所有类别</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div>
						<div class="form-group backgroundcolor" onclick="show_hid('0')">
							<div class="col-2">
								<div class="input-label"><div class="forGoods_man wk"></div></div>
							</div>
							<div class="col-10">
								<div class="input-value">男鞋</div>
							</div>
							<div class="clear"></div>
						</div><div style="display: block;" id="sh0">
					<div class="forClass">运动鞋 (9)</div>
					<div class="forClass">豆豆鞋 (4)</div>
					<div class="forClass">帆布鞋 (1)</div>
					<div class="forClass">小白鞋/板鞋 (17)</div>
					<div class="forClass">休闲鞋 (19)</div>
					<div class="forClass">牛津鞋 (2)</div>
					<div class="forClass">商务正装 (5)</div>
					<div class="forClass">沙滩鞋 (9)</div>						
					</div>
					</div>
					<div>
						<div class="form-group backgroundcolor" onclick="show_hid('1')">
							<div class="col-2">
								<div class="input-label"><div class="forGoods_woman"></div></div>
							</div>
							<div class="col-10">
								<div class="input-value">女鞋</div>
							</div>
							<div class="clear"></div>
						</div>
				<div style="display: none;" id="sh1">
					<div class="forClass">运动鞋 (9)</div>
					<div class="forClass">豆豆鞋 (4)</div>
					<div class="forClass">帆布鞋 (1)</div>
					<div class="forClass">小白鞋/板鞋 (17)</div>
					<div class="forClass">休闲鞋 (19)</div>
					<div class="forClass">牛津鞋 (2)</div>
					<div class="forClass">商务正装 (5)</div>
					<div class="forClass">沙滩鞋 (9)</div>								
					</div>
					</div>
					<div>
						<div class="form-group backgroundcolor" onclick="show_hid('2')">
							<div class="col-2">
								<div class="input-label"><div class="forGoods_child"></div></div>
							</div>
							<div class="col-10">
								<div class="input-value">童鞋</div>
							</div>
							<div class="clear"></div>
						</div><div style="display: none;" id="sh2">
					<div class="forClass">运动鞋 (9)</div>
					<div class="forClass">豆豆鞋 (4)</div>
					<div class="forClass">帆布鞋 (1)</div>
					<div class="forClass">小白鞋/板鞋 (17)</div>
					<div class="forClass">休闲鞋 (19)</div>
					<div class="forClass">牛津鞋 (2)</div>
					<div class="forClass">商务正装 (5)</div>
					<div class="forClass">沙滩鞋 (9)</div>								
					</div>
					</div>
				</div>
			</div>
			<div class="search_content_right" style="margin-top: 5px;">
				<div class="search_content_right_content">
						<div class="form-group" style="background-color:#d9edf7;overflow: hidden;">
							<div class="col-2">		
								<div class="input-label clr" style="color: #ed145b">商品介绍</div>
							</div>
							<div class="col-2">		
								<div class="input-value clr">累计评价&nbsp;112</div>
							</div>
						<div class="clear"></div>
						</div>				
						<div class="form-group-margin0 form_group_line">
							<div class="col-2a">
								<div class="input-label font_cl">产品参数：</div>
							</div>
							<div class="col-10a">
								<div class="input-value fontred">
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="form-group-margin0 form_group_line">
							<div class="col-2a">
								<div class="input-label font_cl">上市时间：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">2016年春季</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">闭合方式：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">系带</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">性别：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">男子</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="form-group-margin0 form_group_line">
							<div class="col-2a">
								<div class="input-label font_cl">帮面材质：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">牛皮二层革/织物</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">鞋底材质：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">橡胶</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">鞋码：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding"> 39&nbsp;40 </div>
								</div>
							</div>
						</div>
						<div class="form-group-margin0 form_group_line">
							<div class="col-2a">
								<div class="input-label font_cl">鞋帮高度：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">低帮</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">适用对象：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">青年（12-44岁）</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">鞋头：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">圆头</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="form-group-margin0 form_group_line">
							<div class="col-2a">
								<div class="input-label font_cl">颜色分类：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">黑色，黄色，其他</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">适用对象：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">青年（12-44岁）</div>
								</div>
							</div>
							<div class="col-2a">
								<div class="input-label font_cl">鞋头：</div>
							</div>
							<div class="col-2a">
								<div class="input-value fontred">
									<div class="spanpadding">圆头</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<!-- end -->
						<div class="form-group-margin0 form_group_line_last">
							<div class="col-12a">
								<div class="input-value font_cl nothuanhuang">内里材dsadasdadadsadsaddssssddd质2131313大开发科高考</div>
							<div class="clear"></div>
						</div>
				</div>
			</div>
		</div>
	</div>				
				</div><!-- end well -->		
    
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
function doReturnSubmit(){
	document.gocart.submit();
}
</script>
</html>