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
					<li class="active"><a href="admin_tuig.do">推广管理</a></li>
					<li><a href="admin_order.do">订单管理</a></li>
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
								  <div class="panel-heading" >推广管理</div>
								  <table class="table">
								    <tr><td>推广员</td></tr>
								    <tr><td>推广等级</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">商品管理</div>
								  <table class="table">
								    <tr><td>推广佣金</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">销售报表</div>
								  <table class="table">
								    <tr><td>佣金报表</td></tr>
								    <tr><td>商品明细</td></tr>
								  </table>
								</div>								
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：推广管理</div>
							  <div class="panel-body">
								<form class="form-inline" style="margin-bottom: 5px;">
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-5">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">商品ID:</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									  <div class="col-md-7">
									   	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">商品名称:</span>
										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									</div>
									  </div>
									  <div class="col-md-6">
									  <div class="row">
									  <div class="col-md-5">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">所属分类：</span>
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">男鞋</a></li>
											    <li><a href="#">女鞋</a></li>
											    <li><a href="#">童鞋</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									  <div class="col-md-2"style="padding-left: 0">
									  	<div class="input-group">
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">男鞋</a></li>
											    <li><a href="#">女鞋</a></li>
											    <li><a href="#">童鞋</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									 <div class="col-md-2"style="padding-left: 0">
									  	<div class="input-group">
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">男鞋</a></li>
											    <li><a href="#">女鞋</a></li>
											    <li><a href="#">童鞋</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									</div>
									  </div>
									  
									  
									  
									  
<!-- 									  <div class="col-md-3"> -->
<!-- 									  	<div class="input-group"> -->
<!-- 										  <span class="input-group-addon" id="basic-addon1">商品名称:</span> -->
<!-- 										  <input type="text" class="form-control" placeholder="输入查询" aria-describedby="basic-addon1"> -->
<!-- 										</div> -->
<!-- 									  </div> -->
<!-- 									  <div class="col-md-3"> -->
<!-- 									  	<div class="input-group"> -->
<!-- 										  <span class="input-group-addon" id="basic-addon1">所属分类:</span> -->
<!-- 										  <input type="text" class="" placeholder="输入真实姓名查询" aria-describedby="basic-addon1"> -->
<!-- 										</div> -->
<!-- 									  </div> -->
<!-- 									  <div class="col-md-3"> -->
<!-- 									  	<div class="input-group"> -->
<!-- 										  <span class="input-group-addon" id="basic-addon1">状态：</span> -->
<!-- 										  Single button -->
<!-- 											<div class="btn-group"> -->
<!-- 											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 											    全部 <span class="caret"></span> -->
<!-- 											  </button> -->
<!-- 											  <ul class="dropdown-menu"> -->
<!-- 											    <li><a href="#">男</a></li> -->
<!-- 											    <li><a href="#">女</a></li> -->
<!-- 											  </ul> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									  </div> -->
									</div>
									<div class="row">
									  <div class="col-md-6">
									  	<div class="input-group">
										  <span class="input-group-addon" id="basic-addon1">状态：</span>
										  <!-- Single button -->
											<div class="btn-group">
											  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											    全部 <span class="caret"></span>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="#">开启</a></li>
											    <li><a href="#">关闭</a></li>
											  </ul>
											</div>
										</div>
									  </div>
									  <div class="col-md-3">
									  	<div class="input-group">
										<button type="submit" class="btn btn-info">查询</button>
										</div>
									  </div>
									  <div class="col-md-3">
									  	<div class="input-group">
										</div>
									  </div>
									</div>
								</form>
								<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red;background-color: #eee;padding-bottom: 5px;padding-top: 5px;">详细信息</div>
									</div>
							    <table class="table table-bordered" style="margin-top: 10px;text-align: center;">
							    	<tr>
							    		<td  rowspan="2" >账号(ID)</td>
							    		<td  rowspan="2" >商品名称</td>
							    		<td  rowspan="2" >售价(元)</td>
							    		<td colspan="6">佣金比例</td>
							    		<td  rowspan="2" >所属分类</td>
							    		<td  rowspan="2" >状态</td>
							    		<td  rowspan="2" >备注</td>
							    	</tr>
							    	<tr>
							    		<td>等级1</td>
							    		<td>等级2</td>
							    		<td>等级3</td>
							    		<td>等级4</td>
							    		<td>等级5</td>
							    		<td>等级6</td>
							    	</tr>
							    	<tr>
							    		<td>erewr</td>
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