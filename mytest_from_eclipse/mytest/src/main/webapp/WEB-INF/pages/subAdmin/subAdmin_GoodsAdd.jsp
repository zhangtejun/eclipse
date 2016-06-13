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
							<ul class="nav nav-tabs">
							  <li role="presentation" class="active"><a href="#">商品信息</a></li>
							  <li role="presentation"><a href="#">Profile</a></li>
							  <li role="presentation"><a href="#">Messages</a></li>
							</ul>
							  <div class="panel-body">
							  <form class="form-horizontal">
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">商品名称：</label>
								    <div class="col-sm-10">
								      <input type="email" class="form-control" id="inputEmail3" placeholder="商品名称">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">商品副题：</label>
								    <div class="col-sm-10">
								      <input type="password" class="form-control" id="inputPassword3" placeholder="商品副题">
								    </div>
								  </div>
								  <div class="form-group">
								  	<label class="col-sm-2 control-label">所属分类：</label>
								    <div class="col-sm-10">
								<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-12">
 											<div class="btn-group">
										        <select id="basic1" class="selectpicker show-tick form-control bs-select-hidden" onchange="select2()">
										          <option value="0">一级分类 </option>
										          <option value="1">女鞋</option>
										          <option value="2">男鞋</option>
										          <option value="3">童鞋</option>
										          <option value="4">品牌</option>
										        </select>
											</div>
 											<div class="btn-group">
										        <select id="basic2" class="selectpicker show-tick form-control bs-select-hidden" onchange="select3()">
										          <option value="0">二级分类 </option>
										          <option value="1">收入</option>
										        </select>
											</div>
 											<div class="btn-group">
										        <select id="basic3" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">三级分类 </option>
										          <option value="1">收入</option>
										        </select>
											</div>
									  </div>
								</div>
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">商品标价：</label>
								    <div class="col-sm-2">
								      <input type="email" class="form-control" placeholder="商品标价">
								    </div>
								    <div class="col-sm-5">
								     <div style="padding-top: 7px;"> 用于展示使用的商品原价</div>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-2 control-label">商品单位：</label>
								    <div class="col-sm-2">
								      <input type="text" class="form-control" value="件" placeholder="件">
								    </div>
								    <div class="col-sm-5">
								     <div style="padding-top: 7px;"> 件、箱、斤、吨等单位名称</div>
								    </div>
								  </div>
								  <div class="form-group">
								    <label  class="col-sm-2 control-label">备注：</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" placeholder="">
								    </div>
								  </div>								  
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <button type="submit" class="btn btn-default">预览</button>
								      <button type="submit" class="btn btn-info">保存</button>
								    </div>
								  </div>
								</form>
							  
							  </div>
							</div>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function queryGoods(){
	document.form1.submit();
}
//一级分类---二级分类
function select2(){
	var flag=$("#basic1").val();debugger;
	if(flag=="1"){//女鞋
		$("#basic2").html("<option value='0'>二级分类</option><option index='0' value='1' text='单鞋'>单鞋</option><option index='1' value='2' text='休闲鞋'>休闲鞋</option><option index='2' value='3' text='凉鞋'>凉鞋</option><option index='3' value='4' text='棉靴'>棉靴</option>")
	}else if(flag=="2"){//男鞋
		
	}else if(flag=="3"){//童鞋
		
	}
}
//二级分类---三级分类
function select3(){
	var flag=$("#basic2").val();debugger;
	if(flag=="1"){//女鞋
		$("#basic3").html("<option value='0'>二级分类</option><option index='0' value='2451722' text='平底'>平底</option><option index='1' value='2451723' text='低跟'>低跟</option><option index='2' value='2207245' text='中跟'>中跟</option>    <option index='3' value='2451725' text='高跟'>高跟</option>    <option index='4' value='2451726' text='超高跟'>超高跟</option>    <option index='5' value='2451727' text='坡跟厚底'>坡跟厚底</option>    <option index='6' value='2451728' text='内增高'>内增高</option><option index='7' value='2467597' text='网鞋'>网鞋</option><option index='8' value='2467598' text='鱼嘴鞋'>鱼嘴鞋</option>")
	}else if(flag=="2"){//男鞋
		
	}else if(flag=="3"){//童鞋
		
	}
}

</script>	
</body>
</html>