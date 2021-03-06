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
					<li><a href="admin_order.do">订单管理</a></li>
					<li><a href="admin_capital.do">资金管理</a></li>
					<li><a href="admin_goods.do">商品管理</a></li>
					<li><a href="admin_market.do">销售管理</a></li>
					<li class="active"><a href="admin_sreport.do">销售报表</a></li>
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
								  <div class="panel-heading" >销售报表</div>
								  <table class="table">
								    <tr><td>银行收款报表</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default" style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading" >B2C销售报表</div>
								  <table class="table">
								    <tr><td>商品销售报表</td></tr>
								    <tr><td>商品销售明细</td></tr>
								    <tr><td>销售地区报表</td></tr>
								    <tr><td>商品代售报表</td></tr>
								  </table>
								</div>								
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：系统管理</div>
							  <div class="panel-body">
								<form class="form-inline" style="margin-bottom: 5px;">
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-3">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">查询时间:</span>
										  <input type="text" class="form-control" placeholder="输入查询开始时间" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-2">
									  	<div class="input-group">
										  <input type="text" class="form-control" placeholder="输入查询结束时间" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-1" style="padding-left: 0;padding-top: 7px;padding-right: 0;">
									  		 <div class="input-group">
										    <div>商品类别：</div>
										  </div>
									  </div>
									 <div class="col-md-1">
									  	<div class="input-group">
										  <!-- Single button -->
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">收入</a></li>
											    <li><a href="#">支出</a></li>
											    <li><a href="#">锁定</a></li>
											    <li><a href="#">解锁</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									  <div class="col-md-1">
									  	<div class="input-group">
										  <!-- Single button -->
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">收入</a></li>
											    <li><a href="#">支出</a></li>
											    <li><a href="#">锁定</a></li>
											    <li><a href="#">解锁</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									  <div class="col-md-1">
									  	<div class="input-group">
										  <!-- Single button -->
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">收入</a></li>
											    <li><a href="#">支出</a></li>
											    <li><a href="#">锁定</a></li>
											    <li><a href="#">解锁</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									</div>
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-6">
									  	<div class="input-group">
									  	<span class="input-group-addon" id="basic-addon1">商品:</span>
										  <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-6">
									  	<button type="submit" class="btn btn-info">查询</button>
									  </div>
									</div>
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
									  	<input type="radio" aria-label="...">&nbsp;对比周期&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;总时间&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;周&nbsp;&nbsp;&nbsp;&nbsp;
									  	<input type="radio" aria-label="...">&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;
									  </div>
									</div>
								</form>
								<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red;background-color: #eee;padding-bottom: 5px;padding-top: 5px;">详细信息
									  <span style="font-size: 12px;float: right;padding-top: 6px;">
									  <a class="fora">[导出商品销售报表]</a>
									  <a class="fora">[报表统计图]</a>
									  </span>
									  </div>
									</div>
							    <table class="table table-bordered" style="margin-top: 10px;text-align: center;">
							    	<tr>						
							    		<td>时间(周期时间)</td>
							    		<td>商品销售数量</td>
							    		<td>销售总金额</td>
							    		<td>操作</td>
							    	</tr>
							    	<tr>
							    		<td>dasdasdasd</td>
							    		<td>高浮雕g</td>
							    		<td>女鞋-女鞋-女鞋</td>
							    		<td>正常</td>
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