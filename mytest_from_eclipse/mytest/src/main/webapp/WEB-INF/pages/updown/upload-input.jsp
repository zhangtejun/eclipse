<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="true"%>
<html>
<head>
<%@ include file="/WEB-INF/zh_CN/common/meta.jsp"%>
<title>Insert title here</title>
<%@ include file="/WEB-INF/zh_CN/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="http://code.jquery.com/jquery-migrate-1.1.1.js"></script> -->
<title>Insert title here</title>
<style type="text/css">
#img {
/* 	height: 200px; */
}

#img.hull {
	width: 400px;
}

#localImag {
	height: 200px;
	width: 200px;
	border: 1px solid #ccc;
	float: left;
}

#show_img {
	float: right;
}

#old_imgimg {
	width: 200px;
	height: 200px;
}
.main_right_mr{padding: 100px 400px;overflow: hidden;position: relative;
}
.headimg_form{
padding: 20px 0;
}
</style>
</head>
<body>
	<div class="main_right_mr">
		<h2>原图</h2>
		<div class="headimg_form">
			<form action="uploadPic.do" method="post" name="form1"enctype="multipart/form-data">
		<input type="" name="x" value="" />
		<input type="" name="x22" value="" />
		<input type="" name="x1" value="" />
		<input type="" name="y1" value="" />
		<input type="" name="x2" value="" />
		<input type="" name="y2" value="" />
				<input type="file" id="Member_headimg"name="file"/>
			</form>
		</div>
		<div id="img">
			<div class="hull">
				<div id="localImag"><!-- 原始图片 -->
					<img id="preview" width=-1 height=-1 style="diplay: none" />
				</div>
				<div id="show_img">
					<div>预览</div>
					<div
						style="height: 200px; width: 200px; border: 1px solid #ccc; overflow: hidden;">
						<div id="big_img"
							style="height: 200px; width: 200px; border: 1px solid #ccc; overflow: hidden;">
							<img id="big_photo" width=-1 height=-1 style="diplay: none" />
						</div>
					</div>
<!-- 					<p>小头像</p> -->
<!-- 					<div -->
<!-- 						style="height: 75px; width: 75px; border: 1px solid #ccc; overflow: hidden;"> -->
<!-- 						<div id="small_img" -->
<!-- 							style="height: 75px; width: 75px; border: 1px solid #ccc; overflow: hidden;"> -->
<!-- 							<img id="small_photo" width=-1 height=-1 style="diplay: none" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
					<div>
						<input type="button" value="确认修改" onclick="submit()"/>
					</div>
					</div>
</body>
<script type="text/javascript">
function submit(){
	document.form1.submit();
}
	/* *setImagePreview() *@paramfileObjStrimg表示上传域的ID *@parampreviewObjString表示显示图片的ID *@paramlocalImgString表示显示图片外层的div的ID*@paramwidth表示显示图片的宽*@paramheight表示显示图片的高*/
	function setImagePreview(fileObj, previewObj, localImg, width, height) {
		var docObj = document.getElementById(fileObj);
		var imgObjPreview = document.getElementById(previewObj);
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性 
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = width + 'px';
			imgObjPreview.style.height = height + 'px';
			//imgObjPreview.src=docObj.files[0].getAsDataURL(); //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById(localImg);
			//必须设置初始大小 
			localImagId.style.width = width + 'px';
			localImagId.style.height = height + 'px';
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {

				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				returnfalse;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
	
// 	function intimy(){
// 		setImagePreview('Member_headimg', 'preview', 'localImag',
// 				200, 200);
// 		var scaleX=0.5;
// 		var scaleY=0.5;
// 		$('#big_img').css({
// 			width : Math.round(scaleX * 200),
// 			height : Math.round(scaleY * 200)
// 		});
// 	}
	$(function() {
		
		
		//给上传区添加onchang事件，掉用函数setImagePreview()
		$("#Member_headimg").change(
				function() {
					setImagePreview('Member_headimg', 'preview', 'localImag',
							200, 200);
// 					setImagePreview('Member_headimg', 'small_photo',
// 							'small_img', 75, 75);
					setImagePreview('Member_headimg', 'big_photo', 'big_img',
							200, 200);
				})
		//调用截图插件需用的 
		$("#localImag").imgAreaSelect({
// 			onInit:set(this,$("#localImag").imgAreaSelect({})),
			aspectRatio : '1:1',
			//选中区域是正方形 
			handles : true,
			fadeSpeed :true,
			//出来效果
			onSelectChange : set,
			onSelectEnd: function (img, selection) {
				debugger
				$('input[name="x"]').val(selection.imageHeight);
				$('input[name="x22"]').val(img.imageHeight);
				$('input[name="x1"]').val(selection.x1);
				$('input[name="y1"]').val(selection.y1);
				$('input[name="x2"]').val(selection.x2);
				$('input[name="y2"]').val(selection.y2);
				}
		//执行选择后执行的函数
		});
		function set(img, selection) {
			if (!selection.width || !selection.height)
				return;
			debugger
			var scaleX = 200 / selection.width;
			var scaleY = 200 / selection.height;
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				$('#big_img').css({
					width : Math.round(scaleX * 400),
					height : Math.round(scaleY * 400),
					marginLeft : -Math.round(scaleX * selection.x1),
					marginTop : -Math.round(scaleY * selection.y1)
				});
// 				$('#small_img').css({
// 					width : Math.round(scaleX * 200 * 3 / 4),
// 					height : Math.round(scaleY * 200 * 3 / 4),
// 					marginLeft : -Math.round(scaleX * selection.x1 * 3 / 4),
// 					marginTop : -Math.round(scaleY * selection.y1 * 3 / 4)
// 				});
			} else {
				$('#big_photo').css({
					width : Math.round(scaleX * 200),
					height : Math.round(scaleY * 200),
					marginLeft : -Math.round(scaleX * selection.x1),
					marginTop : -Math.round(scaleY * selection.y1)
				});
// 				$('#small_photo').css({
// 					width : Math.round(scaleX * 200 * 3 / 4),
// 					height : Math.round(scaleY * 200 * 3 / 4),
// 					marginLeft : -Math.round(scaleX * selection.x1 * 3 / 4),
// 					marginTop : -Math.round(scaleY * selection.y1 * 3 / 4)
// 				});
			}
		}
	})
</script>

</html>