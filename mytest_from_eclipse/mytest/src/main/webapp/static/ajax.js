function setCount(responseMsg){
	debugger;
	$("#MobilePasswdtip").removeClass();
	$("#MobilePasswdtip").addClass("warningtip");
	$("#MobilePasswdtip").html(responseMsg);
	$("#SendPasswd")[0].disabled=true;
	var c = 60;
	$("#SendPasswd")[0].value="重新获取(6)";
//	$("#SendPasswd")[0].value="重新获取(60)";
	count=window.setInterval("timedCount()",1000);
}
var c = 6;
//var c = 60;
function timedCount(){
	c = c-1;
	$("#SendPasswd")[0].value="重新获取("+c+")";
	if (c==0){
		$("#SendPasswd").removeAttr("disabled");
		$("#SendPasswd")[0].value="重新获取";
		clearInterval(count);
		c=6;
//		c=60;
	}
}

/**
 * 发送或重新发送动态密码
 * @param formName
 */
function resendMobilePwdByAjax(submitForm){
	if(isUndefinedOrNull(submitForm)){
		submitForm=document.form1;
	}
	try{	
		$("#MobilePasswdtip").removeClass();
		$("#MobilePasswdtip").addClass("warningtip");
		$("#MobilePasswdtip").html("正在发送动态密码，请稍候.....");
		$("#SendPasswd")[0].disabled=true;
		doRequest(submitForm,"ResendMobilePwd.do",processResendResult,failprocessResendResult,false);
	}catch(ex){
//		if(isDebug()){throw ex;}
	}	
}
function processResendResult(data){
	debugger;
	//动态密码已发送到你的手机
	$("#MobilePasswdtip").html(data.ResponseMsg);
	if(!isUndefinedOrNull(data.TipMsg)){
		//请输入学习、的动态密码，手机尾号0000
		$("#MsgTip").html(data.TipMsg);
	}
	if(data.BindId){
		$("#BindId").value=data.BindId;
	}
	$("#SendPasswd")[0].value="重新获取(60)";
	count=window.setInterval("timedCount()",1000);
}
function failprocessResendResult(data){
	$("#MobilePasswdtip").html(data.ResponseMsg);
	if(data.ResponseCode!="json.validation_resend_max_times" && data.ResponseCode!="json.validation_resend_too_frequent" && data.ResponseCode!="json.validation_wait_timeout"){
		$("#SendPasswd").removeAttr("disabled");
	}else{
		if(data.ResponseCode=="json.validation_resend_too_frequent"){
			var responseMsg = data.ResponseMsg.substring(0,data.ResponseMsg.indexOf("("));
			var time = data.ResponseMsg.substring(data.ResponseMsg.indexOf("(")+1,data.ResponseMsg.indexOf(")"));
			$("#MobilePasswdtip").html(responseMsg);
			if(count!=null && count!=undefined)
				clearInterval(count);
			setCount(responseMsg,time);
		}
	}
}


/**
 * ajax购物车查询
 * @param formName
 */
function queryCartInfo(submitForm){
	if(isUndefinedOrNull(submitForm)){
		submitForm=document.form1;
	}
	try{
		$("#cart_content").css("display","none");
		document.getElementById("cart_id").innerHTML= "";
		$("#cartTip11").css("display","block");
		$("#cartTip").html("正在查询，请稍候.....");
		doRequest(submitForm,"CartInfo.do",CartInfoResult,function(data){
			if(data.status!=0){
				$("#cartTip").html("通讯出错，请稍后重试");
				$(".num_all").html("0");
				$(".total_price").html("0.00");
				cartcount=false;
			}else{
			$("#cartTip11").css("display","none");
			$("#cart_content").css("display","block");cartcount=false;
			}
			;});
	}catch(ex){
//		if(isDebug()){throw ex;}
	}	
}

function CartInfoResult(data){
	debugger;
	var html="";
	var item="";
	var totalPrice="0.00";
	var CartList=data.result;
	for(var i=0;i<CartList.length;i++){
		item=CartList[i];
		totalPrice=parseFloat(totalPrice)+parseFloat(item.CartPrice);
		html=html+"<div class='cart_con_over cart_con_single'><div class='single_pic'><a href='#' target='_blank' alt='"+item.TitleInfo+"'><img src='http://p4.jmstatic.com/product/002/349/2349664_std/2349664_60_60.jpg'></a></div>"+
		"<div class='single_info'><div calss='price1'><a href='#' target='_blank' alt='"+item.TitleInfo+"' class='name'>"+item.TitleInfo+"</a></div><div class='price'>￥"+item.CartPrice+"</div><div class='price_plus'>x</div><div class='price_num'>"+item.CartPriceNum+"</div></div></div>"		
	}
	$("#cartTip").html("");
	$("#cartTip11").css("display","none");
	if(CartList.length<1){
		$("#cart_content").css("display","block");
	}
	document.getElementById("cart_id").innerHTML= html;	
	$(".num_all").html(isUndefinedOrNull(CartList.length)? 0:CartList.length);
	$(".total_price").html(isUndefinedOrNull(totalPrice)? "0.00":totalPrice);
}
