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
<!-- <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap-theme.min.css"></script> -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="./static/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="./static/style/fileinput.min.js"></script>
<script src="./static/style/fileinput_locale_zh.js"></script>
<script src="./static/jquery.serializejson.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
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
					<sh:userPropertyCheck operator="=true" propertyName="logined">
					<li><a ><sh:UserInfo/></a></li>
					</sh:userPropertyCheck>
					<li><a href="adminSub_logout.do">退出</a></li>
					<li class="active"><a href="admin.do">基础设置 <span
							class="sr-only"></span></a></li>
					<li><a href="admin_member.do">我的会员</a></li>
					<li><a href="admin_enter.do">入驻商家</a></li>
					<li><a href="admin_tuig.do">推广管理</a></li>
					<li><a href="admin_order.do">订单管理</a></li>
					<li><a href="admin_capital.do">资金管理</a></li>
					<li><a href="adminSub_goodsinfo.do">商品管理</a></li>
					<li><a href="admin_market.do">销售管理</a></li>
					<li><a href="admin_sreport.do">销售报表</a></li>
					<li><a href="admin_system.do">系统管理</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
<form action="adminSub_baseInfo.do" name="form1" method="post" id="form1">
	<div class="container">

		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-info">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-2">
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">我的账户</div>
									<table class="table">
										<tr>
											<td class="cspt" onclick="qryinfo()">基本信息</td>
										</tr>
										<tr>
											<td class="cspt" onchange="qryMessage()">商品添加</td>
										</tr>
										<tr>
											<td class="cspt" onchange="qryMessage()">商品查询</td>
										</tr>
										<tr>
											<td class="cspt">在线客服</td>
										</tr>
									</table>
								</div>
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">物流设置</div>
									<table class="table">
										<tr>
											<td>11</td>
										</tr>
										<tr>
											<td>22</td>
										</tr>
										<tr>
											<td>33</td>
										</tr>
										<tr>
											<td>44</td>
										</tr>
									</table>
								</div>
								<div class="panel panel-default" style="margin-bottom: 0;">
									<!-- Default panel contents -->
									<div class="panel-heading">xxxxx</div>
									<table class="table">
										<tr>
											<td>开始页面</td>
										</tr>
										<tr>
											<td onclick="qryinfo()">基本信息</td>
										</tr>
										<tr>
											<td>注册协议</td>
										</tr>
										<tr>
											<td>在线客服</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="col-xs-10">
								<div class="panel panel-default">
									<div class="panel-heading">当前位置：我的账户</div>
									<div class="panel-body" style="display: block;">
										<!-- start 基本信息 -->
										<div class="row row1">
											<div class="col-xs-4">
												<div class="col-md-10" style="font-size: 20px; color: red">账户信息</div>
											</div>
											<div class="col-xs-8">
												<button class="btn btn-primary" type="button"
													id="shopInfoMA" onclick="shopInfo('A')">修改</button>
												<button class="btn btn-info Dnone" type="button"
													id="shopInfoSA" onclick="saShopInfo('A');saShopInfoByAjax('A')">保存</button>
												<button class="btn btn-default Dnone" type="button"
													id="shopInfoBA" onclick="disShopInfo('A')">取消</button>
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">用户名</div>
											<div class="col-md-8">renqiu</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">负责人</div>
											<div class="col-md-4">
												<span id="userName"><c:out
														value="${Result.SellerTruename }" /></span> <input type="text" maxlength="10"
													name="SellerTruename" id="userName1" class="form-control"
													value="<c:out value='${Result.SellerTruename }'/>"
													placeholder="" style="display: none;">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">证件号码</div>
											<div class="col-md-4">
												<span id="usercard"><c:out
														value="${Result.SellerIdcard }" /></span> <input type="text" maxlength="18"
													name="SellerIdcard" id="usercard1" class="form-control"
													placeholder="" style="display: none;"
													value="<c:out value='${Result.SellerIdcard }'/>">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">手机号码</div>
											<div class="col-md-4">
												<span id="phone"><c:out
														value="${Result.SellerMobile }" /></span> <input type="text" maxlength="11"
													name="SellerMobile" id="phone1"
													value="<c:out value='${Result.SellerMobile }'/>"
													class="form-control" placeholder="" style="display: none;">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">电子邮箱</div>
											<div class="col-md-4">
												<span id="email"><c:out
														value="${Result.SellerEmail }" /></span> <input type="text" maxlength="20"
													name="SellerEmail" id="email1" class="form-control"
													placeholder="" style="display: none;"
													value="<c:out value='${Result.SellerEmail }'/>">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">所在地</div>
											<div class="col-md-4"></div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">所属行业</div>
											<div class="col-md-4"></div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">登录时间</div>
											<div class="col-md-4">
												<sh:cut value="${Result.SellerLogintime }" headNum="1" shieldType="A"/>
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">注册时间</div>
											<div class="col-md-4">
												<sh:cut value="${Result.SellerRetime }" headNum="1" shieldType="A"/>
											</div>
										</div>
									</div>
									<div class="panel-body">
										<!-- start 商城信息 -->
										<div class="row row1">
											<div class="col-md-4">
												<div class="col-md-10" style="font-size: 20px; color: red">商城信息</div>
											</div>
											<div class="col-md-8">
												<button class="btn btn-primary" type="button"
													id="shopInfoMB" onclick="shopInfo('B')">修改</button>
												<button class="btn btn-info Dnone" type="button"
													id="shopInfoSB" onclick="saShopInfo('B');saShopInfoByAjax('B')">保存</button>
												<button class="btn btn-default Dnone" type="button"
													id="shopInfoBB" onclick="disShopInfo('B')">取消</button>
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">商城名称</div>
											<c:if test="${StoreNameFlag eq true}">
											<div class="col-md-4">
												<c:out value="${Result.StoreName }" />
											</div>
											</c:if>
											<c:if test="${StoreNameFlag ne true}">
											<div class="col-md-4">
												<span id="shopName"><c:out
														value="${Result.StoreName }" /> </span> <input type="text" maxlength="20"
													class="form-control"
													value="<c:out value='${Result.StoreName }'/>"
													id="shopName1" name="StoreName" placeholder=""
													style="display: none;">
											</div>
											</c:if>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">旗舰店网址</div>
											<div class="col-md-4">
												<a target="_blank"
													href="<c:out value='${Result.StoreGourl }'/>"><c:out
														value="${Result.StoreGourl }" /></a>
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">商城描述</div>
											<div class="col-md-4">
												<span id="shopdesc"><c:out
														value="${Result.StoreDescribe }" /></span> <input type="text" maxlength="50"
													name="StoreDescribe" class="form-control"
													value="<c:out value='${Result.StoreDescribe }'/>"
													placeholder="" id="shopdescinput" style="display: none;">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">后台管理链接</div>
											<div class="col-md-4">
												<a href="http://www.baidu.com" target="_blank">http://www.baidu.com</a>
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">商城图片</div>
											<div class="col-md-6">
												<img src="<c:out value="${Result.StoreUrl }"/>"
													name="StoreUrl" id="StoreUrl" class="img-responsive"
													style="height: 133px; max-width: 133px;border: 1px solid;"
													alt="Responsive image">
											</div>
										</div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2"></div>
											<div class="col-md-4">
												<button class="btn btn-info" type="button"
													onclick="setPic()">设置商城图片</button>
											</div>
										</div>
										<div class="row row1" id="StoreUrl1" style="display: none;">
											<div class="col-md-2"></div>
											<div class="col-md-5">
												<label class="control-label">选择图片</label> <input id="file"
													type="file" name="file" class="file">
											</div>
										</div>
										<div class="clearfix"></div>
										<div class="row row1">
											<div class="col-md-4"></div>
											<div class="col-md-2" id="success" style="display: none;"><button type="button" class="btn btn-success">上传成功！</button></div>
											<div class="col-md-4" id="danger" style="display: none;"><button type="button" class="btn  btn-danger">上传失败！</button></div>
										</div>
										<div class="clearfix"></div>
										<div class="row row1">
											<div class="col-md-2"></div>
											<div class="col-md-2">收款方式</div>
											<div class="col-md-4">主商城代收</div>
										</div>

										<!-- 							    <table class="table table-hover"> -->
										<!-- 									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr> -->
										<!-- 									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr> -->
										<!-- 									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr> -->
										<!-- 									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr> -->
										<!-- 									 <tr><td width="80%">您的商城有用户 XXX申请入驻，请尽快审核资料。</td><td>2016-04-23</td></tr> -->
										<!-- 								</table> -->
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
<!-- Modal  for ajax-->
<div class="modal fade" id="myModalForAjax" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        正在通讯，请稍后...
      </div>
    </div>
  </div>
</div>

<!-- Modal FOR RESULT-->
<div class="modal fade" id="myModalR" tabindex="-1" role="dialog" aria-labelledby="myModalLabelR">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabelR"></h4>
      </div>
      <div class="modal-body" style="text-align: center;color: #449d44">
       操作成功！
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	</div>
	
		<input type="hidden" name="SellerName" value="zh3gfg">
		<input type="hidden" name="StoreId" value="10">
		<input type="hidden" name="SellerId" value="1000">
		<input type="hidden" name="StoreUrl">
		<input type="hidden" name="Flag">
		<input type="hidden" name="Flag1">
	</form>
	<script type="text/javascript">
	initFileInput("file", "urlpic.do");
//查询系统消息
	function qryMessage(){
		
	}
	function qryinfo(){
		document.form1.action="adminSub_baseInfo.do";
		document.form1.submit();
	}
	function shopInfo(item){
		$("#shopInfoS"+item).addClass("Dblock");
		$("#shopInfoB"+item).addClass("Dblock");
		$("#shopInfoM"+item).addClass("Dnone");
		if(item=='B'){
		$("#shopdesc").html("");
		$("#shopdescinput").css("display","block");
		$("#shopName").html("");
		$("#shopName1").css("display","block");
		}
		if(item=='A'){
		$("#userName").html("");
		$("#userName1").css("display","block");
		$("#usercard").html("");
		$("#usercard1").css("display","block");
		$("#phone").html("");
		$("#phone1").css("display","block");
		$("#email").html("");
		$("#email1").css("display","block");
		}
	}
	function saShopInfo(item){
		if(item=='B'){
			if(isUndefinedOrNull(document.form1.StoreName)){
				document.form1.Flag1.value="B";
			}
			$("#shopdescinput").css("display","none");
			$("#shopdesc").html($("#shopdescinput").val());
// 			document.form1.action='urlpic.do'+'?StoreId='+document.form1.StoreId.value+'&SellerId='+document.form1.SellerId.value+'&StoreUrl='+encodeURIComponent();
// 			document.form1.submit();
			$("#shopName").html($("#shopName1").val());
			$("#shopName1").css("display","none");
		}
			if(item=='A'){
			$("#userName").html($("#userName1").val());
			$("#userName1").css("display","none");
			$("#usercard").html($("#usercard1").val());
			$("#usercard1").css("display","none");
			$("#phone").html($("#phone1").val());
			$("#phone1").css("display","none");
			$("#email").html($("#email1").val());
			$("#email1").css("display","none");
			}
		$("#shopInfoS"+item).removeClass("Dblock");
		$("#shopInfoB"+item).removeClass("Dblock");
		$("#shopInfoM"+item).removeClass("Dnone");
	}
	function disShopInfo(item){
		if(item=='B'){
			$("#shopdescinput").css("display","none");
			$("#shopdesc").html($("#shopdescinput").val());
			$("#shopName").html($("#shopName1").val());
			$("#shopName1").css("display","none");
			}
			if(item=='A'){
			$("#userName").html($("#userName1").val());
			$("#userName1").css("display","none");
			$("#usercard").html($("#usercard1").val());
			$("#usercard1").css("display","none");
			$("#phone").html($("#phone1").val());
			$("#phone1").css("display","none");
			$("#email").html($("#email1").val());
			$("#email1").css("display","none");
			}		
		$("#shopInfoS"+item).removeClass("Dblock");
		$("#shopInfoB"+item).removeClass("Dblock");
		$("#shopInfoM"+item).removeClass("Dnone");
	}
	//初始化fileinput控件（第一次初始化）
	function initFileInput(ctrlName, uploadUrl) {    
	    var control = $('#' + ctrlName);debugger
	    var url=uploadUrl;
	    control.fileinput({
	        language: 'zh', //设置语言
	        uploadUrl: url, //上传的地址
	        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
	        showUpload: true, //是否显示上传按钮
	        showCaption: false,//是否显示标题
	        browseClass: "btn btn-primary", //按钮样式             
// 	        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
// 	        maxFileCount:10,
maxFileSize : 1024,
	        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
	        enctype: 'multipart/form-data',
	        validateInitialCount:true,
	    });
	}	
	
	
	function setPic(){
		$("#StoreUrl").css("display","none");
		$("#StoreUrl1").css("display","block");
		$("#success").attr("style","display:none");
		$("#danger").attr("style","display:none");
	}
	
//导入文件上传完成之后的事件
$("#file").on("fileuploaded", function (event, data, previewId, index,root) {
$("#StoreUrl1").css("display","none");debugger;
var data = data.response.result;
if (data == '123456') {
	$("#success").attr("style","display:block");
	$("#StoreUrl").attr("style","display:block");initFileInput("file", "urlpic.do");
return;
}
else{

	$("#danger").attr("style","display:block");
	$("#StoreUrl").attr("style","display:block");
alert('文件上传失败！');
}
});


function saShopInfoByAjax(item){debugger
	//校验格式
	var a=$("#usercard1").val();
	if(!mustNum18(a)){
		alert("证件号码格式有误");
		return false;
		}
	//校验格式
	if(!mustNum(document.form1.phone1.value)){
		alert("手机号码格式有误");
		return false;
	}
	if(!checkEmail(document.form1.SellerEmail.value)){
		alert("邮箱格式有误");
		return false;
	}
	document.form1.Flag.value=item;
	if(item=='A'){
		document.form1.action='adminSub_updateInfo.do';
		document.form1.submit();
		return;
	}
	if(item=='B'){
		document.form1.action='adminSub_updateInfo.do';
		document.form1.submit();
		return;
	}
	document.form1.StoreUrl.value=$("#StoreUrl").attr("src");
	document.form1.action='urlpic.do';
// 	if(isUndefinedOrNull(submitForm)){
		var submitForm=document.form1;
// 	}
	try{
		doRequest(submitForm,"urlpic.do",function(data){
			$('#myModalR').modal('show');
// 			alert("保存成功！");
		},function(data){
			if(data.status!=0){
				alert("通讯出错，请稍后重试");
			}}
			);
	}catch(ex){
//		if(isDebug()){throw ex;}
	}	
}

</script>
</body>
</html>