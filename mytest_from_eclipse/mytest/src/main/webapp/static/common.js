//控制重复交易提交的全局变量
var submitFlag=false;
var submitControlEnabled=true;
/**
 * 重复提交控制
 * @returns {Boolean}
 */
function isDuplicateSubmit(){
	if(submitControlEnabled){
		if(submitFlag){
			alert("该交易已经提交，请不要重复提交");
			return true;
		}
	}
	submitFlag=true;
	return false;
}

/**
 * 判断是否为空
 * @param obj
 * @returns {Boolean}
 */
function isUndefinedOrNull(obj){
	if(obj==undefined||obj==null||obj==""){
		return true;
	}
		return false;
}
/**
 * 必须是数字和字母 true
 * null and '' false
 */
function mustNumAndCode(obj){
	if(obj == null||obj == ''||obj.length>15)
		return false;
	var patn=/^\w+$/;
	if(patn.test(obj)){
		return true;
	}
	return false;
}
function mustNum(obj){
	if(obj == null||obj == ''||obj.length>11)
		return false;
	var patn=/^\d+$/;
	if(patn.test(obj)){
		return true;
	}
	return false;
}
function mustNum18(obj){
	if(obj == null||obj == ''||obj.length>18)
		return false;
	var patn=/^\d+$/;
	if(patn.test(obj.substring(0,obj.length-1))){
		return true;
	}
	return false;
}

function checkPass(obj){
	debugger;
	if(obj == null||obj == ''||obj.length>16)
		return false;
	var patn=/^\S+$/;
	if(patn.test(obj)){
		return true;
	}
	return false;
}
//检查固定长度
function checkLength0(s,len){
	if(isEmpty(s)){
		return false;	
	}
	
	var s1=eval(s);
	if( s1.value.length==len ){
		return true;
	}
	return false;
}
function checkPass1(obj){
	debugger;
	var obj1=$("#test").val();
	obj1=obj1.replace(/</g,"&lt;");
	obj1=obj1.replace(/>/g,"&gt;");
	return obj1
}

//确定字符串是否为空
function isEmptyString(str){
	if (str==null || str==""){
		return true;
	}
	return false;
}
//检查一个对象是否存在
function isExist(s){	
	if (eval(s)==null){
		return false;
	}	
	return true;
}
//检查非空
function isEmpty(s){
	if(isExist(s)){
		var s1=eval(s);
		if(!isEmptyString(s1.value)){
			return false;
		}
	}
	return true;
}
var MobilePasswdInfo = new Array();
MobilePasswdInfo[0]="";
MobilePasswdInfo[1]="手机动态密码长度必须是6位";
MobilePasswdInfo[2]="请输入手机动态密码，长度6位";



//日期控件校验
function ValidationDate(){
	 var bd=document.form1.StartDate.value.replace(/-/g,'');
     var ed=document.form1.EndDate.value.replace(/-/g,'');
     if (bd==null || bd==""){
//               alert("请输入正确的起始日期");
//               document.form1.StartDate.focus();
//               document.form1.StartDate.select();
               return true;
     }
     if (ed==null || ed==""){
//               alert("请输入正确的终止日期");
//               document.form1.EndDate.focus();
//               document.form1.EndDate.select();
               return true;
     }
     if(!checkDateFormat(document.form1.StartDate)){
               alert("请输入正确的起始日期");
//               document.form1.StartDate.focus();
//               document.form1.StartDate.select();
               return false;
     }
     if(!checkDateFormat(document.form1.EndDate)){
               alert("请输入正确的终止日期");
//               document.form1.EndDate.focus();
//               document.form1.EndDate.select();
               return false;
     }
     //终止日期不能小于起始日期
     if((eval(bd)) > (eval(ed))){
               alert("开始日期必须小于或等于结束日期 ");
//               document.form1.StartDate.focus();
//               document.form1.StartDate.select();
               return false;
     }
     return true;
}
//检查日期格式
function checkDateFormat(s){
	if(isEmpty(s)){
		return false;	
	}
	var s1=eval(s);
	var temp=s1.value.replace(/-/g,'');
	
	if( temp.length == 8 && isDigitString(temp) ){
		var yyyy=Number(temp.substring(0,4));
		var mm = Number(temp.substring(4,6));
		var dd = Number(temp.substring(6,8));
		
		if (yyyy > 1969 && yyyy < 2051){
			if( mm > 0 && mm < 13){
				if (dd > 0){
					switch(mm){
						case 2:
				      		if(yyyy%4!=0||((yyyy%100 == 0)&&(yyyy%400!=0))){
				      			if(dd < 29){
				      				return true;
				      			}
				      			else{
				      				return false;
				      			}
				      		}
				      		
				      		if(dd<30){
				      			return true;
				      		}
				      		else{
				      			return false;
				      		}
				      	case 4:
				      	case 6:
				      	case 9:
				      	case 11:
				      		if(dd < 31){
				      			return true;
				      		}
				      		else{
				      			return false;
				      		}
				      	default: 
				      		if(dd < 32){
				      			return true;
				      		}
				    }
				}
			}
		}
	}
	
	return false;
}
//检查字符串是否是由数字组成
function isDigitString(str){
	if(isExist(str)&&!isNaN(str) && str.indexOf('.')==-1 && str.indexOf('e')==-1 && str.indexOf('E')==-1){
		return true;
	}
	return false;	
}
//检查一个对象是否存在
function isExist(s){	
	if (eval(s)==null){
		return false;
	}	
	return true;
}
//email 校验 表达式
var checkEmail = function(str){   //校验 格式
	var patn = /^[_a-zA-Z0-9\-]+(\.[_a-zA-Z0-9\-]*)*@[a-zA-Z0-9\-]+([\.][a-zA-Z0-9\-]+)+$/;
	if(patn.test(str)){			
		return 1;
	}else{
		return 0; //incorrect format
	}
}

// Generate a simple captcha
function randomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}
function generateCaptcha() {
    $('#captchaOperation').html([randomNumber(1, 20), '+', randomNumber(5, 20), '='].join(' '));
}