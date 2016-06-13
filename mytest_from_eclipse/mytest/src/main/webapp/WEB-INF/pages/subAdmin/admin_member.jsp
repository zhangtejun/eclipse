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
					<li class="active"><a href="admin_member.do">我的会员</a></li>
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
									<div class="panel-heading">个人会员</div>
									<table class="table">
										<tr>
											<td class="cspt" onclick="selectm_info()">会员列表</td>
										</tr>
										<tr>
											<td class="cspt">收货地址</td>
										</tr>
									</table>
								</div>
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">会员等级</div>
									<table class="table">
										<tr>
											<td class="cspt">等级管理</td>
										</tr>
									</table>
								</div>
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">网站留言</div>
									<table class="table">
										<tr>
											<td class="cspt">留言列表</td>
										</tr>
									</table>
								</div>
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">商品咨询</div>
									<table class="table">
										<tr>
											<td>咨询列表</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">当前位置：我的会员</div>
									<div class="panel-body">
										<form class="form-inline" method="post"
											style="margin-bottom: 5px;" action="" name="form1" id="">
											<input type="hidden" name="Flag" />
											<input type="hidden" name="MemberName_del" />
											<div class="row" style="padding-bottom: 5px;">
												<div class="col-md-3">
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1">会员账号:</span>
														<input type="text" class="form-control" name="MemberName"
															placeholder="输入帐号查询" aria-describedby="basic-addon1">
													</div>
												</div>
												<div class="col-md-3">
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon2">手机:</span>
														<input type="text" class="form-control" name="MemberMobile"
															placeholder="输入手机号查询" aria-describedby="basic-addon2">
													</div>
												</div>
												<div class="col-md-3">
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon3">真实姓名:</span>
														<input type="text" class="form-control" name="MemberTruename"
															placeholder="输入真实姓名查询" aria-describedby="basic-addon3">
													</div>
												</div>
									  <div class="col-md-3">
									  	<div class="input-group">
											性别：
											<div class="btn-group">
											<input type="hidden" name="MemberSex"/>
										        <select id="basicSex" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="2">全部</option>
										          <option value="1">男</option>
										          <option value="0">女</option>
										        </select>
											</div>
										</div>
									  </div>											
											</div>
											<div class="row">
									  <div class="col-md-3">
									  	<div class="input-group">
											会员等级:
											<div class="btn-group">
										        <select id="basicGrade" class="selectpicker show-tick form-control bs-select-hidden">
										          <option value="0">无等级</option>
										        </select>
											</div>
										</div>
									  </div>												
												<div class="col-md-6">
													<div class="input-group">
														<!-- 										  <span class="input-group-addon" id="basic-addon1">积分:</span> -->
														<!-- 										  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1"> -->
													</div>
												</div>
												<div class="col-md-3">
													<div class="input-group">
														<!-- 										  <span class="input-group-addon" id="basic-addon1">真实姓名:</span> -->
														<!-- 										  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1"> -->
														<button type="button" class="btn btn-info"
															onclick="selectm_info()">查询</button>
													</div>
												</div>
											</div>
										</form>
										<div class="row">
											<div class="col-md-12"
												style="font-size: 20px; color: red; background-color: #eee; padding-bottom: 5px; padding-top: 5px;">详细信息</div>
										</div>
										<table class="table table-bordered"
											style="margin-top: 10px; text-align: center;">
											<tr>
												<td>会员Id</td>
												<td>会员账号</td>
												<td>等级</td>
												<td>积分</td>
												<td>手机</td>
												<td>邮箱</td>
												<td>姓名</td>
												<td>性别</td>
												<td>所在省</td>
												<td>登录时间</td>
												<td>操作</td>
												<td>
													<div class="checkbox" style="margin: 0">
														<label> <input type="checkbox" id="checkBox" 
															onclick="selectAll()">
														</label>
													</div>
												</td>
											</tr>
											<c:forEach items="${LoopResult}" var="item" varStatus="status">
												<tr>
													<td><c:out value="${item.MemberId}" /></td>
													<td><c:out value="${item.MemberName}" /></td>
													<td><c:out value="${item.MemberGrade}" /></td>
													<td><c:out value="${item.MemberPoint}" /></td>
													<td><c:out value="${item.MemberMobile}" /></td>
													<td><c:out value="${item.MemberEmail}" /></td>
													<td><c:out value="${item.MemberTruename}" /></td>
													<td><sh:message key="${item.MemberSex}" nameSpace="Sex"/></td>
													<td>表没有字段</td>
													<td>表没有字段</td>
													<td>
													<a data-toggle="modal" data-target="#gridSystemModal" onclick="myclick('用户名(所在地)该字段暂没有','证件号码(出生日期)该字段暂没有','最近登录时间 (首次)该字段暂没有','<c:out value="${item.MemberTruename}" />','<sh:message key="${item.MemberSex}" nameSpace="Sex"/>','<c:out value="${MemberMobile}"/>','<c:out value="${MemberEmail}"/>','该字段暂没有')">查看</a>&nbsp;
													<a onclick="delect('<c:out value="${item.MemberName}"/>')">删除</a></td>
													<td>
														<div class="checkbox" style="margin: 0">
															<label> <input type="checkbox" name="InfoNo"> 
															</label>
														</div>
													</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<nav style="text-align: right;">
									<ul class="pagination">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</nav>
								<!-- end 分页 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
<!-- 模态框	 -->
<div  class="modal fade bs-example-modal-lg" role="dialog" id="gridSystemModal" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">会员详情</h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
			<table class="table table-bordered">
				<tr>
					<td class="warning" colspan="6">会员基本信息</td>
				</tr>
				<tr>
					<td class="success">用户名(所在地)</td>
					<td class="info" id="namecity">该字段暂没有</td>
					<td class="success">证件号码(出生日期)</td>
					<td class="info" id="idcard">该字段暂没有</td>
					<td class="success">最近登录时间 (首次)</td>
					<td class="info" id="firstlogin">该字段暂没有</td>
				</tr>
				<tr>
					<td class="success">姓名(性别)</td>
					<td class="info" id="namesex"><c:out value="${item.MemberTruename}" />&nbsp;<sh:message key="${item.MemberSex}" nameSpace="Sex"/></td>
					<td class="success" >手机号码(电子邮箱)</td>
					<td class="info" colspan="3" id="mobileemail"><c:out value="${MemberMobile}"/>&nbsp;<c:out value="${MemberEmail}"/></td>
				</tr>
				<tr>
					<td class="warning" colspan="6">会员收货地址信息</td>
				</tr>
				<tr>
					<td id="addinfo" class="info" colspan="6" id="meninfo">该字段暂没有</td>
				</tr>
			</table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<script type="text/javascript">
		function selectm_info() {
			document.form1.MemberSex.value=$("#basicSex option:selected").val();
			document.form1.action = "admin_member.do";
			document.form1.Flag.value = "abc";
			document.form1.submit();
		}
		//查看
		function qrydetil(item) {
			$('#myModal').modal(options);
// 			var url = "PosQuotaDetail.do?QuotaContNo="+item;
// 			var hWnd = window.open(url,"HelpWindow","top=0,left=0,width=1100,height=700,resizable=yes,scrollbars=yes,status=yes");
// 			if ((document.window != null) && (!hWnd.opener)) {
// 			    hWnd.opener = document.window;
// 			}
// 			hWnd.focus();			
		}
		//删除
		function delect(item) {
			document.form1.action = "admin_delmember.do";
			document.form1.MemberName_del.value = item;
			document.form1.submit();
		}

		
// 		$('#gridSystemModal').on('show.bs.modal', function (e) {
// 			debugger
// 			$(this)
// 			$("#addinfo").html("adsdadad");
// 			 alert(e);
// 			})
	function myclick(item1,item2,item3,item4,item5,item6,item7,item8){
		$("#namecity").html(item1);
		$("#idcard").html(item2);
		$("#firstlogin").html(item3);
		$("#namesex").html(item4+"&nbsp;"+item5);
		$("#mobileemail").html(item6+"&nbsp;"+item7);
		$("#meninfo").html(item8);
	}		
	</script>
</body>
</html>