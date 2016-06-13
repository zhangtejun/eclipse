<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
</head>
<body>
<div id="a">123</div>debugger
</body>
<script type="text/javascript">
(function($) {
	var methods = {
		init: function(options) {

			// 在每个元素上执行方法
			return this.each(function() {
				var $this = $(this);
				debugger
				// 创建一个默认设置对象
				var defaults = {
					propertyName: 'value',
					onSomeEvent: function() {}
				}
				debugger
				// 使用extend方法从options和defaults对象中构造出一个settings对象
				var settings = $.extend({}, defaults, options);

				// 执行代码

			});
		}
	};

	$.fn.pluginName = function() {
		var method = arguments[0];
debugger
		if(methods[method]) {
			method = methods[method];

			// 我们的方法是作为参数传入的，把它从参数列表中删除，因为调用方法时并不需要它
			arguments = Array.prototype.slice.call(arguments, 1);
		} else if( typeof(method) == 'object' || !method ) {
			method = methods.init;
		} else {
			$.error( 'Method ' +  method + ' does not exist on jQuery.pluginName' );
			return this;
		}

		// 用apply方法来调用我们的方法并传入参数
		return method.call(this, arguments);

	}

})(jQuery);
</script>
</html>