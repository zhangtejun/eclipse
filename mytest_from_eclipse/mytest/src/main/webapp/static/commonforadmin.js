//公共方法for admin
function selectAll() {
	debugger;
	if ($("#checkBox").is(':checked')) {
		$(":checkbox[name='InfoNo']").each(function() {
			$(this).prop("checked", true);
		});

	} else {
		$(":checkbox[name='InfoNo']").each(function() {
			$(this).prop("checked", false);
		});
	}
}