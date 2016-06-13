// JavaScript Document
//定义FORM内需校验的域
//Exp:var objid = new formEle(isRequired,objid,datatype,trigger,para,infobox,errmsg)
//定义的变量名一定要与域ID相同
//参数：isRequired boolean 是否需要验证，需验证的非空
//		objid	   String  域ID，唯一
//		datatype   String  域类型，根据类型来执行校验方式，现只有3种，password,email,mobile,
//						   若datatype已有，则不会执行trigger自定义事件
//		trigger	   String  自定义事件，无相关域类型时执行
//		para	   String  参数，key = value 多个以逗号分割，暂时未用
//		infobos	   String  显示错误信息的区域ID
//		errmsg	   String  错误信息
//		
//在页面最后再执行一次initForm(objid1,objid2,...)即可

/////////////////////////////////////////////////////////////
//                Setup Class Names
/////////////////////////////////////////////////////////////
//default classes for input field
var inputWarningClass	= "Warning";
var inputErrorClass		= "inputerror";
var inputOkClass		= "inputok";
var inputNormalClass	= "inputnormal";

var tipClassObj={"Warning":"1","inputerror":"1","inputok":"1","inputnormal":"1"};

var infoboxOkClass = "oktip";
var infoboxErrorClass = "errortip";
var infoboxWarningClass = "warningtip";

var requireErrorInfo = "It cannot be left blank";

String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g,"");   
};


/////////////////////////////////////////////////////////////
//                Initialize Form
/////////////////////////////////////////////////////////////
function initForm(){	
	//initialize form UI and add triggers
	for (var i=0;i<initForm.arguments.length;i++){
		inputId=initForm.arguments[i];		
		var x = document.getElementById(eval(inputId).u);		
		//alert(eval(inputId).u)
		if (eval(inputId).r) {	
			showStatus(x,"Normal");	
			if(eval(inputId).f)
				x.onkeyup = showMyStatus;
			else x.onkeyup = showMyStatustry;
		}
/*		msgLength = eval(inputId).e[0].length;
		for(var i = 1;i<eval(inputId).e.length ; i++){
			if(msgLength < eval(inputId).e[i].length)msgLength = eval(inputId).e[i].length;
		}
		msgLength *= 10; //字数*中文像数
		alert(msgLength);
		if(msgLength > 420 - document.getElementById(eval(inputId).u).size*9)
			document.getElementById(eval(inputId).i).style.width = 420 - document.getElementById(eval(inputId).u).size*9;
	*/
		x.onfocus = getFocus;
		x.onblur = lostFocus;		
		
	}
}


function showMyStatus(evnt){
	var obj,errorCode;
	if (isIE()) {
		obj = event.srcElement;		
	}else {
		obj = evnt.id?evnt:evnt.target;
	}
	errorCode = validateValue(obj);
	if(errorCode == 0){
		showStatus(obj,"Ok");
	}
	if(errorCode >= 1){
		showStatus(obj,"Error");
	}
	if(errorCode < 0){
		showStatus(obj,"Normal");
	}	
	showInfo(obj,errorCode);
}
function showMyStatustry(evnt){
	var obj,errorCode;
	if (isIE()) {
		obj = event.srcElement;		
	}else {
		obj = evnt.id?evnt:evnt.target;
	}
	errorCode = validateValue(obj);
	if(errorCode == 0){
		showStatus(obj,"Ok");
	}else{
		showStatus(obj,"Normal");
	}	
	showInfo1(obj,errorCode);
}

function showStatus(obj,stat)
//Show the status of user currently inputting field
//3 Statuses: Warning|Error|Ok
{
	/*debugger;*/
	var classArray = "";
	if(obj.className){
		classArray = obj.className.split(" ");
	}	
	for(var i=0;i<classArray.length;i++){
		if(tipClassObj[classArray[i]]){
			classArray.pop();
		}
	}	
	var classStr = classArray.toString();
	obj.className = classStr.replace(/,/g, " ");//所有","换成空格
	
	
	switch(stat){
		case "Warning":
			obj.className = obj.className + " " + inputWarningClass;
			break;
		case "Error":
			obj.className = obj.className + " " + inputErrorClass;
			break;
		case "Ok":
			obj.className = obj.className + " " + inputOkClass;
			break;
		default:
			obj.className = obj.className + " " + inputNormalClass;
			break;	
	
		/*case "Warning":
			obj.className = inputWarningClass;
			break;
		case "Error":
			obj.className = inputErrorClass;
			break;
		case "Ok":
			obj.className = inputOkClass;
			break;
		default:
			obj.className = inputNormalClass;
			break;*/
	}
	
	
	
}
function countInfoLen(obj,index){
	if(!eval(obj.id).r)return eval(obj.id).e.length;
	else return eval(obj.id).e[index].length;
}
function showInfo(obj,errorCode,forcible)
//Show Information in Infobox
//errorCode==0 for hint message
//if forcible==true, no matter what the status of infobox now, change it,
//otherwise,if the status of infobox is "Error", do not change it forever.
{
	var infobox = getInfobox(obj);
	var msgLength = 0;
	var tdwidth;
	if(infobox){
		if (errorCode==null){
			errorCode = validateValue(obj);
		}		
		if(errorCode == 0){				
			msgLength = countInfoLen(obj,0);
			infobox.className = infoboxOkClass;				
			infobox.innerHTML = getErrorMsg(obj,errorCode);
		}
		if(errorCode >0){
			msgLength = countInfoLen(obj,1);
			infobox.className = infoboxErrorClass;
			infobox.innerHTML = getErrorMsg(obj,errorCode);
		}
		if(errorCode <0){
			msgLength = countInfoLen(obj,2);
			infobox.className = infoboxWarningClass;
			infobox.innerHTML = getErrorMsg(obj,2);
		}
		var boxLength = document.getElementById(eval(obj.id).u).size;
		if(!document.getElementById(eval(obj.id).u).size) boxLength = document.getElementById(eval(obj.id).u).cols;
		var parent = document.getElementById(eval(obj.id).u).parentNode;
		msgLength *= 12; //字数*中文像数
		if(document.getElementById(eval(obj.id).u).type == "password") boxLength *= 11;
		else boxLength *= 9;
		tdwidth = parent.offsetWidth - 24; //td长度 = offsetWidth - padding - border
		if(tdwidth - boxLength < 0) return 0;
		if(msgLength > tdwidth - boxLength)
			document.getElementById(eval(obj.id).i).style.width = tdwidth - boxLength;
		else document.getElementById(eval(obj.id).i).style.width = msgLength;
	}
//		if(infobox.className != infoboxErrorClass || forcible){
//			if(errorCode == 0){
//				infobox.className	= infoboxWarningClass;
//				infobox.innerHTML	= getErrorMsg(obj,errorCode);
//			}
//			if(errorCode >0){
//				infobox.className	= infoboxErrorClass;
//				infobox.innerHTML	= getErrorMsg(obj,errorCode);
//			}
//			if(errorCode <0){
//				infobox.className	= infoboxHintClass;
//			}
//		}
//	}	
}

function showInfo1(obj,errorCode,forcible)
//Show Information in Infobox
//errorCode==0 for hint message
//if forcible==true, no matter what the status of infobox now, change it,
//otherwise,if the status of infobox is "Error", do not change it forever.
{
	var infobox = getInfobox(obj);
	var msgLength = 0;
	var tdwidth;
	if(infobox){
		
		if (errorCode==null){
			errorCode = validateValue(obj);
			}		
			
				if(errorCode == 0){	
					msgLength = countInfoLen(obj,0);		
					infobox.className = infoboxOkClass;				
					infobox.innerHTML = getErrorMsg(obj,errorCode);
				}
			
				else{
					msgLength = countInfoLen(obj,2);
					infobox.className = infoboxWarningClass;
					infobox.innerHTML = getErrorMsg(obj,2);
			}
		var boxLength = document.getElementById(eval(obj.id).u).size;
		if(!document.getElementById(eval(obj.id).u).size) boxLength = document.getElementById(eval(obj.id).u).cols;
		var parent = document.getElementById(eval(obj.id).u).parentNode;
		msgLength *= 12; //字数*中文像数
		if(document.getElementById(eval(obj.id).u).type == "password") boxLength *= 11;
		else boxLength *= 9;
		tdwidth = parent.offsetWidth - 24; //td长度 = offsetWidth - padding - border
		if(tdwidth - boxLength < 0) return 0;
		if(msgLength > tdwidth - boxLength)
			document.getElementById(eval(obj.id).i).style.width = tdwidth - boxLength;
		else document.getElementById(eval(obj.id).i).style.width = msgLength;
	}
}
/////////////////////////////////////////////////////////////
//                UI Functions
/////////////////////////////////////////////////////////////
function getFocus(evnt)
{
	var obj;
	if (isIE()) {
		obj = event.srcElement;
	}else {
		obj = evnt.target;
	}
	if(obj.className.indexOf("inputnormal")!=-1){
		showInfo(obj,-1);
		}
	else if(obj.className.indexOf("inputerror")!=-1){
		showInfo(obj,1);
		}
	else if(obj.className.indexOf("inputok")!=-1){
		showInfo(obj,0);
	}
	else
		showInfo(obj,-1);
}
	
function lostFocus(evnt)
{
	var obj;
	if (isIE()) {
		obj = event.srcElement;
	}else {
		obj = evnt.target;
	}
	if(isIE()){
		if (eval(obj.id).r) {		
			showMyStatus(obj);
		//showInfo(obj)	
		} else {
			showInfo(obj,0);		
		}
	}else{ 
		showMyStatus(obj); 
		showInfo(obj);		
	
	}
}

/////////////////////////////////////////////////////////////
//                Base Functions
/////////////////////////////////////////////////////////////
function isIE() {
	if(document.all) return true;
	return false;
}

function formEle(required,uid,name,datatype,trigger,parameter,infobox,errormsg,flag,combine,status){
	this.r	= required;
	this.u = uid;
	this.n = name;
	this.d	= datatype;	
	this.t = trigger;
	this.p	= parameter;
	this.i	= infobox;
	this.e	= errormsg;
	this.f = flag;
	this.c = combine;
	this.s = status;
}
function getTrigger(obj){
	if(obj.id){
		if(eval(obj.id).t) {
			triggers = eval(obj.id).t;
		}else{
			return -1;
		}
	}else{
		return;
	}
	//处理自定义事件
	var s = triggers.split(";");
	for(var i=0;i<s.length;i++){
		if (s[i].indexOf("(")>=0) {
			if(eval(s[i])){
				continue;
			}else{
				return 1;
			}
		}
		 else {	
			if(eval(s[i]+"()")){
				continue;
			}else{
				return 1;
			}
		 }
	}	
	return 0;	
}

function getUid(obj){
	if(obj.id){
		if(eval(obj.id).u) return eval(obj.id).u;
	}
	return false;		
}
function getName(obj){
	if(obj.id){
		if(eval(obj.id).n) return eval(obj.id).n;
	}
	return false;		
}
function isRequired(obj){
	if(obj.id){
		if(eval(obj.id).r) return eval(obj.id).r;
	}
	return false;
}
function isCombine(obj){
	if(obj.id){
		if(eval(obj.id).c) return eval(obj.id).c;
	}
	return false;
}
function getDatatype(obj){
	if(obj.id){
		if(eval(obj.id).d) return eval(obj.id).d;
	}
	return false;
}
function getInfobox(obj){
	if(obj.id){
		if(eval(obj.id).i && document.getElementById(eval(obj.id).i)) return document.getElementById(eval(obj.id).i);
	}
	return;
}
function getErrorMsg(obj,errorCode){
	if(eval(obj.id).e[0]==""){
		
		eval(obj.id).e[0]=" ";
	}
	if(obj.id){
		if(eval(obj.id).e[errorCode]){
			return eval(obj.id).e[errorCode];
		} else {
			return getHintMsg(obj);
		}
	}
	return;
}

function getHintMsg(obj){
	if(obj.id){		
       if(eval(obj.id).e){
			
			return eval(obj.id).e[0];
		}
	}
	return;
}
function getInitStatus(obj){
	if(obj.id){
		if(eval(obj.id).s || eval(obj.id).s==0 ) return eval(obj.id).s;
	}
	return;
}
function getAttrName(str){
	var s=str.split("=");
	return s[0];
}
function getAttrValue(str){
	var s=str.split("=");
	return s[1];
}
function getAttrValueByName(obj,str){
	var para;
	if(obj.id){
		if(eval(obj.id).p) para=eval(obj.id).p;
		else return;
	}else{
		return;
	}
	var s = para.split(",");
	for(var i=0;i<s.length;i++){
		if(getAttrName(s[i]) == str){
			if(getAttrValue(s[i]))
				return getAttrValue(s[i]);
			else
				return;
		}
	}
	return;
}

function validateTrigger(obj){
	return getTrigger(obj);	
}

/////////////////////////////////////////////////////////////
//                Validator Functions
/////////////////////////////////////////////////////////////
function validateValue(obj){
	//trim
//	var patn = /(^\s)|(\s$)/;
//	if(patn.test(obj.value))	obj.value = obj.value.trim();
	//switcher
	var errorCode = -1;
	switch(getDatatype(obj)){
		case "password":
			errorCode = validatePassword(obj);
			break;
		case "safepassword":
			errorCode = validateSafePassword(obj);
			break;
		case "email":
			errorCode = validateEmail(obj);
			break;
		case "num":
			errorCode = validateNum(obj);
			break;
		case "mobile":
			errorCode = validateMobile(obj);
			break;
		case "normal":
			errorCode = validateNormal(obj);
			break;
		default:
			errorCode = validateTrigger(obj);
			break;
	}
	return errorCode;
}

function validateAll(formObj){
	var obj,infobox,pass;
	pass = true;
	var x = formObj;
	if(!x) return;
	var y = x.getElementsByTagName("input");
	for (var i=0;i<y.length;i++){
		obj = y[i];	
		if (!isRequired(obj)){
			continue;	
		}		
		//obj.value = obj.value.trim();
		infobox = getInfobox(y[i]);
		if(obj.type == 'text' || obj.type == 'password'){
			if(isRequired(obj) && obj.value == ""){
				pass = false;
				obj.focus();
				showStatus(obj,"Error");
				alert(getName(obj)+requireErrorInfo);
				break;
			}
			if(validateValue(obj)>0){
				pass = false;
				obj.focus();
				showStatus(obj,"Error");
				showInfo(obj);
				alert(getErrorMsg(obj,1));
				break;
			}
			if(validateValue(obj)==0){
				continue;
			}
		}
	}
	return pass;
}

function validatePassword(obj){
		if (checkLength0(obj,6)){		
			return 0;
		}else{		
			return 1;
		}
}

function validateEmail(obj){
	var str = obj.value;	
	var patn = /^[_a-zA-Z0-9\-]+(\.[_a-zA-Z0-9\-]*)*@[a-zA-Z0-9\-]+([\.][a-zA-Z0-9\-]+)+$/;

	if(patn.test(str)){		
		return 0;
	}else{
		return 1; //incorrect format
	}		
	
}

  //校验手机号码
function validateMobile(obj){
	var str = obj.value;	
		if(11!=str.length){			
			return 1;  
		}
	return 0;		
}

function validateNormal(obj){
	var str=trimString(obj.value);
	if(str=="")
	{
		return 1;
	}
	return 0;
}

function quanjiao2Banjiao(str) {
	var i;
	var result = '';
	for (i = 0; i < str.length; i++) {
		code = str.charCodeAt(i);
		if (code >= 65281 && code < 65373) {
			result += String.fromCharCode(str.charCodeAt(i) - 65248);
		}
		else {
			result += str.charAt(i);
		}
	}
	return result;
}

//限制字符字节长度
//判断字符字节是否超过指定字节
//contentValue：字符内容
//byteLength：指定字节
function isOverLimitLength(contentValue, byteLength) {
	var strContent = contentValue;
	//使用正则表达式将双字节字符替换为2个*
	var newContent = strContent.replace(/[^\x00-\xff]/g, '**');
	//新字符长度
	var lenth = newContent.length;
	
	//判断当前字符字节长度是否大于限制长度
	if (lenth > byteLength) {
		return true;
	} else {
		return false;
	}
}
//18位身份证校验
//var checkPartnerIdNoinfo = new Array();
//checkPartnerIdNoinfo[0] = "";
//checkPartnerIdNoinfo[1] = "您的身份证号输入错误";
//checkPartnerIdNoinfo[2] = "请输入有效长度为18位的证件号";
function validateIdNo(strFcNo){
	if(!strFcNo || strFcNo == ""){
		checkPartnerIdNoinfo[1] = "请输入有效长度为18位的证件号";
		return 0;  //"请输入有效长度为18位的证件号"
	}
	else{
		if(strFcNo.length!=18){
			checkPartnerIdNoinfo[1] = "请输入有效长度为18位的证件号";
			return 0;
		}
		else if(strFcNo.length==18){
			var InputTest = /^[1-9][0-9]{16}([0-9]|X)$/;
			if(!InputTest.test(strFcNo)){
				checkPartnerIdNoinfo[1] = "您的身份证号输入错误";
				return 0; // 您的身份证号输入错误"
			}
			else {
				//省 编号
				var vcity = {11:"北京", 12:"天津", 13:"河北", 14:"山西", 15:"内蒙古", 21:"辽林", 22:"吉林", 23:"黑龙江", 31:"上海", 32:"江苏", 33:"浙江", 34:"安徽"
					, 35:"福建", 36:"江西", 37:"山东", 41:"河南", 42:"湖北", 43:"湖南", 44:"广东", 45:"广西", 46:"海南", 50:"重庆"
					, 51:"四川", 52:"贵州", 53:"云南", 54:"西藏", 61:"陕西", 62:"甘肃", 63:"青海", 64:"宁夏", 65:"新疆", 71:"台湾"
					, 81:"香港", 82:"澳门", 91:"国外"};
				var province = strFcNo.substr(0,2);
				if(vcity[province] == undefined){
					checkPartnerIdNoinfo[1] = "您的身份证号输入错误";
					return 0;
				}else {
					var year = parseInt(strFcNo.substr(6,4),10); //年
					var month = parseInt(strFcNo.substr(10,2),10); //月
					var day = parseInt(strFcNo.substr(12,2),10);  //日
					var monthday = [31,28,31,30,31,30,31,31,30,31,30,31]; //每月的天数
					//判断 润年 与平年
					if((year%4 == 0 && year%100 != 0)||(year%400 == 0)){
						monthday[1] = 29;
					}
					if((year<1900) || (month<1 || month>12) || (day<1 || day>monthday[month - 1])){
						checkPartnerIdNoinfo[1] = "您的身份证号输入错误";
						return 0;
					}else{
						return 1;
					}
				}
			}
		}
	}
	
}
