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
					<li class="active"><a href="admin_goods.do">商品管理</a></li>
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
								  <div class="panel-heading" >商品管理</div>
								  <table class="table">
								    <tr><td>分类目录</td></tr>
								    <tr><td>类别标签</td></tr>
								    <tr><td>商品属性</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default" style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading" >商品相关</div>
								  <table class="table">
								    <tr><td>商品添加</td></tr>
								    <tr><td>淘宝商品导入</td></tr>
								    <tr><td>商品查询</td></tr>
								    <tr><td>商品库存</td></tr>
								    <tr><td>商品绑定</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default" style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading" >服务标签</div>
								  <table class="table">
								    <tr><td>服务项目</td></tr>
								    <tr><td>绑定商品</td></tr>
								    <tr><td>查询</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default" style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading" >相册管理</div>
								  <table class="table">
								    <tr><td>相册管理</td></tr>
								  </table>
								</div>								
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：商品管理</div>
							  <div class="panel-body">
								<form class="form-inline" style="margin-bottom: 5px;">
								<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
									  商品名称：
 										<input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
									&nbsp;&nbsp; &nbsp; &nbsp;   商品副题：
 										<input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
									&nbsp;&nbsp; &nbsp; &nbsp;   状态：
 											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部 </option>
										          <option value="1">收入</option>
										          <option value="2">支出</option>
										          <option value="3">锁定</option>
										          <option value="4">解锁</option>
										        </select>
											</div>
									&nbsp;&nbsp; &nbsp; &nbsp;
									<button type="submit" class="btn btn-info">查询</button>		
									  </div>
								</div>
								<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
											所属分类：		
 											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部 </option>
										          <option value="1">收入</option>
										          <option value="2">支出</option>
										          <option value="3">锁定</option>
										          <option value="4">解锁</option>
										        </select>
											</div>
 											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部 </option>
										          <option value="1">收入</option>
										          <option value="2">支出</option>
										          <option value="3">锁定</option>
										          <option value="4">解锁</option>
										        </select>
											</div>
 											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部 </option>
										          <option value="1">收入</option>
										          <option value="2">支出</option>
										          <option value="3">锁定</option>
										          <option value="4">解锁</option>
										        </select>
											</div>
									  </div>
								</div>
								<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
											售价：<input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
											&nbsp;&nbsp;-&nbsp;&nbsp;<input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
											
											&nbsp;&nbsp;添加方式：			
 											<div class="btn-group">
										        <select id="basic" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部 </option>
										          <option value="1">收入</option>
										          <option value="2">支出</option>
										          <option value="3">锁定</option>
										          <option value="4">解锁</option>
										        </select>
											</div>
											&nbsp;&nbsp;商品备注： 	<input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">										
									  </div>
								</div>

								</form>
								<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red;background-color: #eee;padding-bottom: 5px;padding-top: 5px;">详细信息
									  <span style="font-size: 12px;float: right;padding-top: 6px;">
									  <a class="fora">[开启]</a>
									  <a class="fora">[关闭]</a>
									  <a class="fora">[删除]</a>
									  <a class="fora">[批量修改]</a>
									  <a class="fora">[批量评价]</a>
									  </span>
									  </div>
									</div>
							    <table class="table table-bordered" style="margin-top: 10px;text-align: center;">
							    	<tr>													
							    		<td>排序</td>
							    		<td>商品名称</td>
							    		<td>售价(元)</td>
							    		<td>销量(件)</td>
							    		<td>所属分类</td>
							    		<td>状态</td>
							    		<td>商品备注</td>
							    		<td>操作</td>
							    		<td> <div class="checkbox" style="margin: 0">
										    <label>
										      <input type="checkbox">
										    </label>
										  </div></td>
							    	</tr>
							    	<tr>
							    		<td>dasdasdasd</td>
							    		<td>高浮雕g</td>
							    		<td>女鞋-女鞋-女鞋</td>
							    		<td>正常</td>
							    		<td>正常</td>
							    		<td>正常</td>
							    		<td>正常</td>
							    		<td>正常</td>
							    		<td> <div class="checkbox" style="margin: 0">
										    <label>
										      <input type="checkbox">
										    </label>
										  </div></td>
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