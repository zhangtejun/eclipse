<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title id="top_title">Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
</head>
<body>
<iframe src="index1.jsp" id="iframe" name="iframe" frameborder="0" style=" width: 100%; " scrolling="no"></iframe>
</body>
<script type="text/javascript">
// 计算页面的实际高度，iframe自适应会用到
var ifr = document.getElementById('iframe');
ifr.onload = function() {
	 autoheight();
}

function autoheight(){
	debugger;
	
	var iDoc = ifr.contentDocument || ifr.document;
	var height = calcPageHeight(iDoc);
// 	       alert(height);
		$("#iframe").css("min-height", height + 'px');
	//       ifr.style.height = height + 'px';
}

function calcPageHeight(doc) {
	var cHeight = Math.min(doc.body.clientHeight, doc.documentElement.clientHeight);
var sHeight = Math.min(doc.body.scrollHeight, doc.documentElement.scrollHeight);
var height= Math.max(cHeight, sHeight);
return height;
}
</script>
</html>