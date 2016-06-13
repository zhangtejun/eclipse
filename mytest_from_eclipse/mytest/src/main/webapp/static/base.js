/**
 * 购物扯全局变量
 */
var cartcount=false;
$(function(){
	$("#shopping_cart").hover(
	function (){
		if($("#cart_id").text()!=""||document.getElementById("cart_id").innerHTML.length>10||cartcount==true){
			return;
		}
		
		queryCartInfo();cartcount=true;},function (){});
});



function show_cart() {
			if ($(".cart_content_center").length > 0) {
				$(".cart_content_all").css("display", "block");
			} else {
				$(".cart_content_null").css("display", "block");
			}
			$(".num").css("display", "block");

			$(".cart-icons").css("display", "block");
			
		}
		function hidden_cart() {
			if ($(".cart_content_center").length > 0) {
				$(".cart_content_all").css("display", "none");
			} else {
				$(".cart_content_null").css("display", "none");
			}
			$(".num").css("display", "none");
			$(".cart-icons").css("display", "none");
		}

		function show_current() {
			$("#show_hidd").css("display", "block");
		}
		function hidden_current() {
			$("#show_hidd").css("display", "none");
		}
		
		
		
		