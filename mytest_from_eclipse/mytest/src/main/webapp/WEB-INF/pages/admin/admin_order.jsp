<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/headforadmin.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<%-- <%@ include file="/WEB-INF/zh_CN/common/meta.jsp" %> --%>
<!-- <title></title> -->
<%-- <%@ include file="/WEB-INF/zh_CN/common/head.jsp"%> --%>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<style type="text/css">
.fora{
padding: 0 5px 0 5px;
cursor: pointer;
}
</style>
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">后台管理</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">欢迎你！</a></li>
					<li><a href="#">退出</a></li>
					<li><a href="admin.do">基础设置 <span class="sr-only"></span></a></li>
					<li><a href="admin_member.do">我的会员</a></li>
					<li><a href="admin_enter.do">入驻商家</a></li>
					<li><a href="admin_tuig.do">推广管理</a></li>
					<li class="active"><a href="admin_order.do">订单管理</a></li>
					<li><a href="admin_capital.do">资金管理</a></li>
					<li><a href="admin_goods.do">商品管理</a></li>
					<li><a href="admin_market.do">销售管理</a></li>
					<li><a href="admin_sreport.do">销售报表</a></li>
					<li><a href="admin_system.do">系统管理</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
						  <div class="col-md-2">
								<div class="panel panel-default" style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading" >订单管理</div>
								  <table class="table">
								    <tr><td>订单明显</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">订单投诉</div>
								  <table class="table">
								    <tr><td>投诉单据</td></tr>
								    <tr><td>订单评论</td></tr>
								  </table>
								</div>
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：订单管理</div>
							  <div class="panel-body">
								<form class="form-inline" style="margin-bottom: 5px;">
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
									  	<input type="radio" aria-label="...">&nbsp;所有状态订单&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;未付款订单&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;待发货订单&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;已完成发货订单&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;已完成订单&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;取消的订单&nbsp;&nbsp;
									  	
									  </div>
									</div>
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-1">
									  	<div class="input-group" style="margin-top: 5px">
										      <input type="checkbox">
										</div>
									  </div>
									  <div class="col-md-5" style="padding-left: 0;padding-right: 0;">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">下单时间:</span>
										  <input type="text" class="form-control" placeholder="输入开始时间" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-6">
									   	<div class="input-group">
										  <input type="text" class="form-control" placeholder="输入结束时间" aria-describedby="basic-addon1">
										</div>
									  </div>
									</div>
									  </div>
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-6">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">订单号：</span>
											<input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-6">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">买家账号：</span>
											<input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									</div>
									  </div>
									</div>
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-1">
									  	<div class="input-group">
										</div>
									  </div>
									  <div class="col-md-5" style="padding: 0;">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">发票抬头:</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-6">
									   	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">收货电话:</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									</div>
									  </div>
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-6">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">优惠卡ID：</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-6">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">商品名称：</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>

									</div>
									  </div>
									</div>
									<div class="row" style="padding-bottom: 5px;">
										<div class="col-md-3">
									  	<div class="input-group">
											订单类型:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">PC</option>
										          <option value="2">手机</option>
										        </select>
											</div>
										</div>
									  </div>	
									  <div class="col-md-3">
									  	<div class="input-group">
											支付方式:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">在线支付</option>
										          <option value="2">线下支付</option>
										        </select>
											</div>
										</div>
									  </div>	
									  <div class="col-md-3">
									  	<div class="input-group">
											送货时间:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">工作日</option>
										          <option value="2">节假日</option>
										          <option value="2">任意时间</option>
										        </select>
											</div>
										</div>
									  </div>	
									  <div class="col-md-3">
									  	<div class="input-group">
											物流公司:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">aa</option>
										        </select>
											</div>
										</div>
									  </div>	
									  <div class="col-md-3">
									  	<div class="input-group">
											物流公司:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">aa</option>
										        </select>
											</div>
										</div>
									  </div>	
</div>
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-6">
										 <div class="input-group">
										  收货地址:
											<div class="input-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">PC</option>
										          <option value="2">手机</option>
										        </select>
											</div>
										</div>
											<div class="input-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">在线支付</option>
										          <option value="2">线下支付</option>
										        </select>
											</div>
									  </div>									
									  <div class="col-md-3">
										 <div class="input-group">
										  收货方式:
											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">物流</option>
										          <option value="2">自提</option>
										        </select>
											</div>
										</div>
									</div>
									  <div class="col-md-3">
										 <div class="input-group">
										 <button type="submit" class="btn btn-info">查询</button>
										</div>
									</div>
</div>

								</form>
								<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red;background-color: #eee;padding-bottom: 5px;padding-top: 5px;">详细信息
									<span style="font-size: 12px;"><a class="fora">站内信</a><a class="fora">完成订单</a><a class="fora">取消订单 </a><a class="fora">确认发货 </a><a class="fora">发票信息 </a><a class="fora">按商品导出Excel </a><a class="fora">按商品打印 </a><a class="fora">按订单导出Excel </a><a class="fora">按订单打印 </a><a class="fora">打印快递单</a>
									 </span>
									  </div>
									</div>
							    <table class="table table-bordered" style="margin-top: 10px;text-align: center;">
							    	<tr>
							    		<td>订单号</td>
							    		<td>下单时间</td>
							    		<td>完成时间</td>
							    		<td>下单金额(元)</td>
							    		<td>成交金额(元)</td>
							    		<td>付款方式(状态)</td>
							    		<td>收货省市</td>
							    		<td>收货人</td>
							    		<td>收货方式</td>
							    		<td>开票</td>
							    		<td>类型</td>
							    		<td>状态</td>
							    		<td>投诉</td>
							    		<td>退款</td>
							    		<td>操作</td>
							    	</tr>
							    	<tr>
							    		<td>等级1</td>
							    		<td>等级2</td>
							    		<td>等级3</td>
							    		<td>等级4</td>
							    		<td>等级5</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    		<td>等级6</td>
							    	</tr>
								</table>
							  </div>
							</div>
							<nav style="text-align: right;">
							  <ul class="pagination">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</nav><!-- end 分页 -->
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>