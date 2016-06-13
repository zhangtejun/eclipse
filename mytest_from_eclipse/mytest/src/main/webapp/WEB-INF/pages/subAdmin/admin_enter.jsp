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
<link rel="stylesheet" type="text/css" href="static/style/bootstrap-datetimepicker.min.css"/>		
<!-- <link -->
<!-- 	href="http://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.css" -->
<!-- 	rel="stylesheet"> -->
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<!-- <script -->
<!-- 	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script> -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="static/bootstrap-datetimepicker.min.js"></script>
<script src="static/bootstrap-datetimepicker.fr.js"></script>
<script src="static/bootstrap-datetimepicker.zh-CN.js"></script>
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
					<li class="active"><a href="admin_enter.do">入驻商家</a></li>
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
								  <div class="panel-heading" >入驻商家</div>
								  <table class="table">
								    <tr><td class="cspt">商家列表</td></tr>
								    <tr><td class="cspt">商家分类</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">会员管理</div>
								  <table class="table">
								    <tr><td class="cspt">咨询列表</td></tr>
								  </table>
								</div>
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">订单管理</div>
								  <table class="table">
								    <tr><td class="cspt">订单明细</td></tr>
								    <tr><td class="cspt">投诉单据</td></tr>
								    <tr><td class="cspt">订单评论</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">资金管理</div>
								  <table class="table">
								    <tr><td class="cspt">订单收款</td></tr>
								    <tr><td class="cspt">订单退款</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">商品管理</div>
								  <table class="table">
								    <tr><td class="cspt">商品查询</td></tr>
								    <tr><td class="cspt">服务项目</td></tr>
								  </table>
								</div>								
								<div class="panel panel-default"  style="margin-bottom: 0;">
								  <!-- Default panel contents -->
								  <div class="panel-heading">销售报表</div>
								  <table class="table">
								    <tr><td class="cspt">银行收款报表</td></tr>
								    <tr><td class="cspt">商品销售报表</td></tr>
								    <tr><td class="cspt">商品销售明细</td></tr>
								    <tr><td class="cspt">销售地区报表</td></tr>
								  </table>
								</div>								
						  </div>
						  <div class="col-md-10">
						  	<div class="panel panel-default">
							  <div class="panel-heading">当前位置：入驻商家</div>
							  <div class="panel-body">
								<form class="form-inline" style="margin-bottom: 5px;" name="form1" id="" method="post">
								<input type="hidden" name="Flag" />
									<div class="row" style="padding-bottom: 5px;">
									  <div class="col-md-4">
     	          							注册时间：
						                <div class="input-group date form_date col-md-8" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
						                    <input class="form-control" size="16" placeholder="查询开始时间" type="text" value="" readonly="">
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						                </div>
										<input type="hidden" id="dtp_input1" name="StartDate" value=""><br>
									  </div>
									  <div class="col-md-4">
     	          							结束时间：
						                <div class="input-group date form_date1 col-md-8" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
						                    <input class="form-control" size="16" type="text" value="" placeholder="查询结束时间" readonly="">
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						                </div>
										<input type="hidden" id="dtp_input2" name="EndDate" value=""><br>
									            <script type="text/javascript">
												$('.form_date').datetimepicker({
													language: 'zh-CN',
											        weekStart: 1,
											        todayBtn:  1,
													autoclose: 1,
													todayHighlight: 1,
													startView: 2,
													minView: 2,
													forceParse: 0
											    });
												$('.form_date1').datetimepicker({
													language: 'zh-CN',
											        weekStart: 1,
											        todayBtn:  1,
													autoclose: 1,
													todayHighlight: 1,
													startView: 2,
													minView: 2,
													forceParse: 0
											    });
												</script>
									  </div>
									  <div class="col-md-4">
									  手机：
									  	<div class="input-group">
										  <input type="text" class="form-control" placeholder="输入手机号查询" aria-describedby="basic-addon1">
										</div>
									  </div>
									</div>
									<div class="row"  style="padding-bottom: 5px;">
									  <div class="col-md-4">
									  真实姓名：
									  	<div class="input-group">
										   <input type="text" class="form-control" name="SellerTruename" placeholder="输入真实姓名" aria-describedby="basic-addon5">
										</div>
									  </div>
									  <div class="col-md-4">
									  	<div class="input-group">
											所属分类：&nbsp;
											<input type="hidden" name="SellerGroup"/>
											<div class="btn-group">
										        <select id="basicGroup" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">男鞋</option>
										          <option value="2">女鞋</option>
										          <option  value="3">童鞋</option>
<!-- 										         没有value 默认为text() jQuery("#basic option:selected").val() -->
										        </select>
											</div>
										</div>
									  </div>
									  <div class="col-md-4">
									  	<div class="input-group">
											状态：
											<div class="btn-group">
												<input type="hidden" name="SellerState"/>
										        <select id="basicState" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">全部</option>
										          <option value="1">未审核</option>
										          <option value="2">正常</option>
										          <option value="3">审核失败</option>
										          <option value="4">关闭</option>
										        </select>
											</div>
										</div>
									  </div>
									</div>
									<div class="row"  style="padding-bottom: 5px;">
									  <div class="col-md-4">商城名称：
									  	<div class="input-group">
										  <input type="text" class="form-control"name="StoreName" placeholder="输入商城名称" aria-describedby="basic-addon4">
										</div>
									  </div>	
									  <div class="col-md-4">用户名：
									  	<div class="input-group">
										  <input type="text" class="form-control" name="SellerName" placeholder="用户名" aria-describedby="basic-addon3">
										</div>
									  </div>
		  					 		 <div class="col-md-3">
									  	<div class="input-group">
										<button type="button" class="btn btn-info" onclick="selectm_info()">查询</button>
										</div>
									  </div>
									  </div>									
									
								</form>
								<div class="row">
									  <div class="col-md-12" style="font-size: 20px;color: red;background-color: #eee;padding-bottom: 5px;padding-top: 5px;">详细信息</div>
									</div>
							    <table class="table table-bordered" style="margin-top: 10px;text-align: center;">
							    	<tr>
							    		<td>商家ID</td>
							    		<td>用户名</td>
							    		<td>姓名</td>
							    		<td>商城名称</td>
							    		<td>手机</td>
							    		<td>所在省</td>
							    		<td>注册时间</td>
							    		<td>所属分类</td>
							    		<td>状态</td>
							    		<td>评分</td>
							    		<td>操作</td>
							    		<td> 
													<div class="checkbox" style="margin: 0">
														<label> <input type="checkbox" id="checkBox" 
															onclick="selectAll()">
														</label>
													</div>
										  </td>
							    	</tr>
							    	<c:forEach  items="${LoopResult}" var="item">
							    	<tr>
							    		<td><c:out value="${item.SellerId}"/></td>
							    		<td><c:out value="${item.SellerName}"/></td>
							    		<td><c:out value="${item.SellerTruename }"/></td>
							    		<td><c:out value="${item.StoreName }"/></td>
							    		<td><c:out value="${item.SellerMobile }"/></td>
							    		<td><c:out value="${item.SellerProvince }"/>&nbsp;&nbsp;<c:out value="${item.SellerCity }"/></td>
							    		<td><sh:cut value="${item.SellerRetime }" headNum="1" shieldType="A"/></td>
							    		<td>暂无字段<sh:message key="${item.SellerGroup}" nameSpace="SellerGroup"/></td>
							    		<td><sh:message key="${item.SellerState}" nameSpace="SellerState"/></td>
							    		<td><sh:message key="${item.SellerPoint}" nameSpace="SellerPoint"/></td>
							    		<td><a>查看</a>&nbsp;<a>修改</a>&nbsp;<a>删除</a></td>
							    		<td> 
														<div class="checkbox" style="margin: 0">
															<label> <input type="checkbox" name="InfoNo"> 
															</label>
														</div>
										  </td>
							    	</tr></c:forEach>
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
function selectm_info() {
	if(!ValidationDate()){
		return false;
	}
	document.form1.SellerGroup.value=$("#basicGroup option:selected").val();
	document.form1.SellerState.value=$("#basicState option:selected").val();
	document.form1.action = "admin_enter.do";
	document.form1.Flag.value = "abc";
	document.form1.submit();
}
</script>
</body>
</html>