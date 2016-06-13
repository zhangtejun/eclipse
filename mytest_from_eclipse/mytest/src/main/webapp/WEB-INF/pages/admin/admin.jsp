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
					<li class="active"><a href="admin.do">基础设置 <span class="sr-only"></span></a></li>
					<li><a href="admin_member.do">我的会员</a></li>
					<li><a href="admin_enter.do">入驻商家</a></li>
					<li><a href="admin_tuig.do">推广管理</a></li>
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
								  <div class="panel-heading" >我的账户</div>
								  <table class="table">
								    <tr><td class="cspt" onchange="qryMessage()">开始页面</td></tr>
								    <tr><td class="cspt" >基本信息</td></tr>
								    <tr><td class="cspt">注册协议</td></tr>
								    <tr><td class="cspt" >在线客服</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">物流设置</div>
								  <table class="table">
								    <tr><td>11</td></tr>
								    <tr><td>22</td></tr>
								    <tr><td>33</td></tr>
								    <tr><td>44</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">xxxxx</div>
								  <table class="table">
								    <tr><td>开始页面</td></tr>
								    <tr><td>基本信息</td></tr>
								    <tr><td>注册协议</td></tr>
								    <tr><td>在线客服</td></tr>
								  </table>
								</div>								
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：我的账户</div>
							  <div class="panel-body">
							  		<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red">系统消息NEWS</div>
									</div>
							    <table class="table table-hover">
									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr>
									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr>
									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr>
									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr>
									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr>
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
<script type="text/javascript">
//查询系统消息
	function qryMessage(){
		
	}
	
</script>
</body>
</html>