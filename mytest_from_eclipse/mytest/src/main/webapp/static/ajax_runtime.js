/*此文件发送Ajax的底层实现*/
/**
 * 
 * @param submitForm 提交的表单
 * @param transName 交易名
 * @param callback 成功回调函数
 * @param failBack 失败回调函数
 * @param reCommit 防止提交标志
 */
function doRequest(submitForm,transName,callback,failBack,reCommit){
	debugger;
	var transName_json = transName.substring(0,transName.indexOf("."))+".json";
//	var transName_json = transName;
	$.ajax({
    	url:transName_json,
        global : true,
        type : "POST",
        contentType : "application/json;charset=UTF-8",
        traditional: true,
        data: jsonToHtml(submitForm),
        dataType:'json', 
        processData : true,  
        async : true,  
        accepts : {  
            json : "application/json"
        },
        
        success:function(data){
        	debugger;
        	var t=data;
        	if(data.responseCode=="AAAAA"){
        		if(!isUndefinedOrNull(callback)){
                    callback(data);
            	}
              
                return;
        	}
        	submitFlag=false;
        	this.fail(data);
        },
        fail:function(data){
        	if(!isUndefinedOrNull(failBack)){
        		failBack(data);
        	}else{
        		alert(data.responseMsg);
//        		alert(data.ResponseMsg);
        	}
        	submitFlag=false;
        },
        error:function(data){
        	if(data.status!=0){
        		this.fail(data);
//        		alert("通讯出错，请稍后重试");
        	}
        }
	}); 
};


//function doRequest4Submit(submitForm,transName,callback,failBack,reCommit){
//	var updateToken = function(){
//		doRequestWithOutForm("pageTokenGen.do",{},function(data){
//			submitForm._SysTokenName.value=data.TokenValue;
//		});
//	};
//	var reFailBack = function(data){
//		updateToken();
//		failBack(data);
//	};
//	var reCallBack = function(data){
//		updateToken();
//		callback(data);
//	};
//	doRequest(submitForm,transName,reCallBack,reFailBack,reCommit);
//}

function doRequest4Check(submitForm,transName,callback,failBack,reCommit){
	var transName_json = transName.substring(0,transName.indexOf("."))+".json";
	$.ajax({
    	url:transName_json,
        global : true,
        type : "POST",
        contentType : "application/json;charset=UTF-8",
        traditional: true,
        data: jsonToHtml4Check(submitForm),
        dataType:'json', 
        processData : true,  
        async : true,  
        accepts : {  
            json : "application/json"
        },
        
        success:function(data){
        	if(data.ResponseCode=="AAAAAAA"){
        		if(!isUndefinedOrNull(callback)){
                    callback(data);	
            	}
        		submitFlag=false;
                return;
        	}else{
        		if(data.ResponseCode=="json.role.invalid_user"){
	        		if(!isUndefinedOrNull(failBack)){
	        			this.fail(data);	
	            	}
	        		submitFlag=false;
	                return;
	        	}else{
	        		error(data);
	        	}
	        	submitFlag=false;
        	}
        	
        },
        fail:function(data){
        	if(!isUndefinedOrNull(failBack)){
        		failBack(data);
        	}else{
        		alert(data.ResponseMsg);
        	}
        	submitFlag=false;
        },
        error:function(data){
        	if(data.status!=0){
        		alert("通讯出错，请稍后重试");
        	}
        }
	}); 
};

/**
 * 无form表单提交ajax
 * @param transName
 * @param callback
 * @param failBack
 * @param reCommit
 */
function doRequestWithOutForm(transName,jsonData,callback,failBack,reCommit){
	var transName_json = transName.substring(0,transName.indexOf("."))+".json";
	$.ajax({
    	url:transName_json,
        global : true,
        type : "POST",
        contentType : "application/json;charset=UTF-8",
        traditional: true,
        data: JSON.stringify(jsonData),
        dataType:'json', 
        processData : true,  
        async : true,  
        accepts : {  
            json : "application/json"
        }, 
        success:function(data){
        	if(data.ResponseCode=="AAAAAAA"){
        		if(!isUndefinedOrNull(callback)){
                    callback(data);	
            	}
              
                return;
        	}
        	submitFlag=false;
        	this.fail(data);
        },
        fail:function(data){
        	if(!isUndefinedOrNull(failBack)){
        		failBack(data);
        	}else{
        		alert(data.ResponseMsg);
        	}
        	submitFlag=false;
        },
        error:function(data){
        	if(data.status!=0){
        		alert("通讯出错，请稍后重试");
        	}
        }
});
};

/**
 * form to json
 */
/**
 * 
parse用于从一个字符串中解析出json对象,如
var str = '{"name":"huangxiaojian","age":"23"}'
结果：
JSON.parse(str)
Object
age: "23"
name: "huangxiaojian"
__proto__: Object
注意：单引号写在{}外，每个属性名都必须用双引号，否则会抛出异常。
stringify()用于从一个对象解析出字符串，如
var a = {a:1,b:2}
结果：
JSON.stringify(a)
"{"a":1,"b":2}"
 */
function jsonToHtml(submitForm){
	debugger;
	var formData = $(submitForm).serializeJSON();
	return JSON.stringify(formData);
}

function jsonToHtml4Check(submitForm){
	var formData = $(submitForm).serializeJSON();
	formData.nextTrans=nextTransName.substring(nextTransName.lastIndexOf('/')+1,nextTransName.indexOf(".do"));
	return JSON.stringify(formData);
}

function hiddenTig(submitForm){
	if(submitForm){
		  var newElement=submitForm.getElementsByTagName("input");
		  for (var i = 0; i < newElement.length; i++) { 
				try{
					if(newElement[i].style.display == 'none'){
						continue;
					}
					if(newElement[i].type=="text"){
						if(newElement[i].value == "") continue;
						document.getElementById(newElement[i].id).focus();
						document.getElementById(newElement[i].id).blur();
					}
				}catch (e)
				{
					continue;
				}
		  }
	  }
}
var _debugEnbabled;

function isDebug(){
	return _debugEnbabled;
}

/*
 * 获得XML DOM的根节点。
 */
function _GetDocumentRoot (Kj) {
	debugger
	var root = null;
	if (Kj.responseText.length == 4) return null;
	if (! Kj.responseXML || Kj.responseXML.xml == "") try {
		var doc = new ActiveXObject("Microsoft.XMLDOM");
		doc.loadXML(Kj.responseText);
		root = doc.documentElement;
	} catch (e) {
		root = null;
	}else try {
		root = Kj.responseXML.documentElement;
	} catch (e) {
		root = null;
	}
	return root;
}

/*
 * 返回XML DOM节点元素之间的文本内容。
 * 当该节点元素之间的内容为子节点时返回的一个字节点的文本值，如果有。
 *
 */
function getNodeText(node){debugger
	var str = "";
	try{
		if(node.hasChildNodes()==true){		
			str = node.firstChild.nodeValue;
		}else{
			str = node.nodeValue;
		}
	}catch(ex){
		if(isDebug()){throw ex;}
	}	
	return trimString(str);
}
/**
 * 
url: 要求为String类型的参数，（默认为当前页地址）发送请求的地址。
type: 要求为String类型的参数，请求方式（post或get）默认为get。注意其他http请求方法，例如put和
      delete也可以使用，但仅部分浏览器支持。
timeout: 要求为Number类型的参数，设置请求超时时间（毫秒）。此设置将覆盖$.ajaxSetup()方法的全局设
         置。
async：要求为Boolean类型的参数，默认设置为true，所有请求均为异步请求。
       如果需要发送同步请求，请将此选项设置为false。注意，同步请求将锁住浏览器，用户其他操作必须等
       待请求完成才可以执行。
cache：要求为Boolean类型的参数，默认为true（当dataType为script时，默认为false）。
       设置为false将不会从浏览器缓存中加载请求信息。
data: 要求为Object或String类型的参数，发送到服务器的数据。如果已经不是字符串，将自动转换为字符串格
      式。get请求中将附加在url后。防止这种自动转换，可以查看processData选项。对象必须为key/value格
      式，例如{foo1:"bar1",foo2:"bar2"}转换为&foo1=bar1&foo2=bar2。如果是数组，JQuery将自动为不同
      值对应同一个名称。例如{foo:["bar1","bar2"]}转换为&foo=bar1&foo=bar2。
dataType: 要求为String类型的参数，预期服务器返回的数据类型。如果不指定，JQuery将自动根据http包mime
          信息返回responseXML或responseText，并作为回调函数参数传递。
          可用的类型如下：
          xml：返回XML文档，可用JQuery处理。
          html：返回纯文本HTML信息；包含的script标签会在插入DOM时执行。
          script：返回纯文本JavaScript代码。不会自动缓存结果。除非设置了cache参数。注意在远程请求
                  时（不在同一个域下），所有post请求都将转为get请求。
          json：返回JSON数据。
          jsonp：JSONP格式。使用SONP形式调用函数时，例如myurl?callback=?，JQuery将自动替换后一个
                “?”为正确的函数名，以执行回调函数。
          text：返回纯文本字符串。
beforeSend：要求为Function类型的参数，发送请求前可以修改XMLHttpRequest对象的函数，例如添加自定义
            HTTP头。在beforeSend中如果返回false可以取消本次ajax请求。XMLHttpRequest对象是惟一的参
            数。
            function(XMLHttpRequest){
               this;   //调用本次ajax请求时传递的options参数
            }
complete：要求为Function类型的参数，请求完成后调用的回调函数（请求成功或失败时均调用）。
          参数：XMLHttpRequest对象和一个描述成功请求类型的字符串。
          function(XMLHttpRequest, textStatus){
             this;    //调用本次ajax请求时传递的options参数
          }
success：要求为Function类型的参数，请求成功后调用的回调函数，有两个参数。
         (1)由服务器返回，并根据dataType参数进行处理后的数据。
         (2)描述状态的字符串。
         function(data, textStatus){
            //data可能是xmlDoc、jsonObj、html、text等等
            this;  //调用本次ajax请求时传递的options参数
error：要求为Function类型的参数，请求失败时被调用的函数。该函数有3个参数，即XMLHttpRequest对象、错
       误信息、捕获的错误对象(可选)。
       ajax事件函数如下：
       function(XMLHttpRequest, textStatus, errorThrown){
          //通常情况下textStatus和errorThrown只有其中一个包含信息
          this;   //调用本次ajax请求时传递的options参数
       }
contentType：要求为String类型的参数，当发送信息至服务器时，内容编码类型默认
             为"application/x-www-form-urlencoded"。该默认值适合大多数应用场合。
dataFilter：要求为Function类型的参数，给Ajax返回的原始数据进行预处理的函数。
            提供data和type两个参数。data是Ajax返回的原始数据，type是调用jQuery.ajax时提供的
            dataType参数。函数返回的值将由jQuery进一步处理。
            function(data, type){
                //返回处理后的数据
                return data;
            }
global：要求为Boolean类型的参数，默认为true。表示是否触发全局ajax事件。设置为false将不会触发全局
        ajax事件，ajaxStart或ajaxStop可用于控制各种ajax事件。
ifModified：要求为Boolean类型的参数，默认为false。仅在服务器数据改变时获取新数据。
            服务器数据改变判断的依据是Last-Modified头信息。默认值是false，即忽略头信息。
jsonp：要求为String类型的参数，在一个jsonp请求中重写回调函数的名字。
       该值用来替代在"callback=?"这种GET或POST请求中URL参数里的"callback"部分，例如
       {jsonp:'onJsonPLoad'}会导致将"onJsonPLoad=?"传给服务器。
username：要求为String类型的参数，用于响应HTTP访问认证请求的用户名。
password：要求为String类型的参数，用于响应HTTP访问认证请求的密码。
processData：要求为Boolean类型的参数，默认为true。默认情况下，发送的数据将被转换为对象（从技术角度
             来讲并非字符串）以配合默认内容类型"application/x-www-form-urlencoded"。如果要发送DOM
             树信息或者其他不希望转换的信息，请设置为false。
scriptCharset：要求为String类型的参数，只有当请求时dataType为"jsonp"或者"script"，并且type是GET时
               才会用于强制修改字符集(charset)。通常在本地和远程的内容编码不同时使用。
设置 dataType 后，会去 accepts 属性（此属性会预置一些常用类型）中直接拿相应的类型添加到 Accept 中。
如果想自己自定义 jQuery 中没有的 Accept 内容，可以手动设置 accepts 属性，使用 键值对 存储，然后再设置 dataType 属性为刚刚自定义的键               
*/               
