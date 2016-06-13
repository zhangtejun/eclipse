<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp" %>
<title>error here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h4>对不起！访问的页面不存在。</h4>
 ##在jsp页面我们可以使用<s:debug></s:debug>来查看值栈信息，也可以使用标签：
      <s:property value="exception.message"/>
      <s:property value="exceptionStack"/>输出异常信息和异常堆栈信息
<div>
<a style="font-size: 16px" href="login.do">点击进入主页</a>
</div>
<a style="font-size: 16px" href="index.do">点击进入登录页</a>
</body>
</html>