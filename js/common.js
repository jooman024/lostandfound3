let publicIp=null;
let NaverClientId="ioG9osEKuDZiDPFlYi0y";
let PrivateIp="http://192.168.0.37:8888";
//icia=ioG9osEKuDZiDPFlYi0y ukXhhxCh6S
//home=S85zj89P34Mrr0GBbjNc miELWJCdU9

function getPublicIp(jsonData){
	//publicIp = jsonData.ip;
}
/* Page Initialize */
function pageInit(messageString, accessInfo){
	//servercallByFetchAjaxUsingUrl("https://api.ipify.org?format=json","get","getPublicIp");
	
	//if(messageString != '') messageController(true, messageString); 
	//if(accessInfo != '') document.getElementById("accessInfo").innerText =	"로그아웃(Access Time : " + accessInfo.substr(8,2) + ":" + accessInfo.substr(10, 2) + ":" + accessInfo.substr(12, 2) + ")";
	//if(jsonString != '') mgrInit();
}
/* 메세지박스 제어 */
function messageController(turn, messageString){
	let message;
	const background = document.getElementById("background");
	const title = document.getElementById("messageTitle");
	const content = document.getElementById("messageContent");
	
	if(turn){
		message = messageString.split(":"); 
		title.innerText = message[0];
		content.innerText = message[1];
		background.style.display = "block";
	}else{
		title.innerText = "";
		content.innerText = "";
		background.style.display = "none";
	}
}
function serverCallView(jobCode, methodType, clientData){
	const form = createForm("", jobCode, methodType);
	const jwt =sessionStorage.JWT;
	if(jwt){
		form.appendChild(createInputBox('hidden',"JWTForJSFramework",sessionStorage.JWT,''));
	}
	if(clientData != ''){
		for(let idx=0;idx<clientData.length;idx++){
			form.appendChild(createInputBox('hidden', clientData[idx][0], clientData[idx][1], ''));
		}
	}
	document.body.appendChild(form);
	form.submit();
}
function serverCallByRequest(jobCode, methodType, clientData){
	const form = createForm("", jobCode, methodType);
	const jwt =sessionStorage.JWT;
	if(jwt){
		form.appendChild(createInputBox('hidden',"JWTForJSFramework",sessionStorage.JWT,''));
	}
	if(clientData != ''){
	const url = new URL(form.action, window.location.origin);
    url.searchParams.set('clientData', clientData);
    form.action = url.toString();
	}
	document.body.appendChild(form);
	form.submit();
}
/* ajax.readyState 
	0  request not initialize << new XMLHttpRequest()
	1	 server Connection established  << ajax.open() ajax.send()
	2  request recieved <<  client --> data --> server
	3	 processing request << server request processing
	4	 response ready
	
	ajax.status << data flow status
	200 << 'OK'
	400 403 << 'Forbidden'
	    404 << 'PageNotFound'
*/
function serverCallByXHRAjax(formData, jobCode, methodType, callBackFunc){
	const ajax =  new XMLHttpRequest();
	ajax.onreadystatechange = function(){
		if(ajax.readyState == 4 && ajax.status == 200){
			window[callBackFunc](JSON.parse(ajax.responseText));
		}else{
			window[callBackFunc]('error');
		}
	};
	
	ajax.open(methodType, jobCode);
	//ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	//ajax.setRequestHeader("Content-Type", "application/json");

	ajax.send(formData);	
}
function serverCallByFetchAjax(formData, jobCode, methodType, callBackFunc){
	
	const headers = new Headers();
	const jwt =sessionStorage.JWT;
	if(jwt) headers.append('JWTForJSFramework', jwt);
	fetch(jobCode, {
  	method: methodType,
  	headers: headers,
    body:formData
  }).then(res => {	
			if(res.headers.get("JWTForJSFramework") != null){
				const jwt = res.headers.get("JWTForJSFramework");
				if( jwt != ''){
					sessionStorage.setItem('JWT', jwt);
				}
					
			}
			if (res.status === 204) {
			    return null;
			 } else {
			    return res.json();
			 }
		})
		.then(
			jsonData => {
	    if (callBackFunc != '') {
	      window[callBackFunc](jsonData);
	    }
	  	})
		.catch(error => {
			console.log(error);
			window[callBackFunc]('error');
		})
}
/*
function serverCallByFetchAjax(formData, jobCode, methodType, callBackFunc){
	fetch(jobCode, {
  	method: methodType,
    body:formData
  })
  	.then((response) => response.json())
  	.then((data) => {window[callBackFunc](data);})
  	.catch(error => window[callBackFunc](error));
}
function serverCallByFetchAjaxUsingJson(jsonData, jobCode, methodType, callBackFunc){
	
	fetch(jobCode, {
  	method: methodType,
  	headers:{
			'Content-Type' : 'application/json'
		},
    body:jsonData
  }).then(response => response.json())
		.then(jsonData => window[callBackFunc](jsonData))
		.catch(error => window[callBackFunc](error));
}
function servercallByFetchAjaxUsingUrl(jobCode,methodType,callBackFunc){
	fetch(jobCode, {
		method: methodType,
		headers:{
			'Content-Type' : 'application/x-www-form-urlencoded'
		},
	}).then(response => response.json())
	.then(jsonData => window[callBackFunc](jsonData))
	.catch(error=>{
		window[CallBackFunc]('error');
	})
}*/
 /* 서버로 전송할 데이터 길이의 유효성 판단 */
 function lengthCheck(obj){
	
	const dataLength =[["storeCode",10,10], ["storeName",2,50], ["storePhone",10,11],
	 ["empCode", 3, 3], ["empPin", 6, 6], ["groupName",2,20], 
	 ["groupCeo",2,5],["groupPin",6,6],["levName", 2, 20],["groupCode",8,8],
	 ["empName",2,5],["empPin", 6, 6],["storeInfoList[0].storeCode",10,10],["storeInfoList[0].empList[0].empCode",3,3],["storeInfoList[0].empList[0].empPin",6,6]]
	 ;
	let result = false;
	
	for(let recordIdx=0; recordIdx<dataLength.length; recordIdx++){
		if(obj.getAttribute("name") == dataLength[recordIdx][0]){
			if(dataLength[recordIdx][0] == 'storeCode' || dataLength[recordIdx][0] == 'storePhone'){
				if(obj.value.length >= dataLength[recordIdx][1] 
				&& obj.value.length <= dataLength[recordIdx][2]){
					if(!isNaN(obj.value)) result = true;
				}			
			}else if(obj.value.length >= dataLength[recordIdx][1] 
				&& obj.value.length <= dataLength[recordIdx][2]) result=true;
				//&& isNaN(obj.value.substr(0,1))) result = true;
		} 	
	}

	return result;
}

/* Password Validation */
function isPasswordCheck(text){
	
	const largeChar = /[A-Z]/;
	const smallChar = /[a-z]/;
	const num = /[0-9]/;
	const specialChar = /[!@#$%^&*]/;
	
	let typeCount = 0;
	
	if(largeChar.test(text.value)) typeCount++;
	if(smallChar.test(text.value)) typeCount++;
	if(num.test(text.value)) typeCount++;
	if(specialChar.test(text.value)) typeCount++; 
		
	return typeCount >= 3? true:false;
}


/* FORM 생성 */
function createForm(name, action, method){
	const form = document.createElement("form");
	if(name != "") form.setAttribute("name", name);
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	return form;
}

/* DIV 생성 */
function createDIV(objId, className, funcName){
	const div = document.createElement("div");
	if(objId != '') div.setAttribute("id", objId);
	if(className != '') div.setAttribute("class", className);
	if(funcName != '') div.setAttribute("onClick", funcName);
	
	return div;
}

function createDiv(objId, className, funcName, innerText){
	const div = document.createElement("div");
	if(objId != '') div.setAttribute("id", objId);
	if(className != '') div.setAttribute("class", className);
	if(funcName != '') div.setAttribute("onClick", funcName);
	if(innerText != '') div.innerText = innerText;
	return div;
}
/* Input Box 생성*/
function createInputBox(type, name, value, placeholder){
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if(value != "") input.setAttribute("value", value);
	if(placeholder != "") input.setAttribute("placeholder", placeholder);
	return input;
}
/* DatePicker 생성 */
function createDatePicker(name, minDate, maxDate){
	const date = document.createElement("input");
	date.setAttribute("type", "date");
	date.setAttribute("name", name);
	if(minDate != "") date.setAttribute("min", minDate);
	if(maxDate != "") date.setAttribute("max", maxDate);
	return date;	
} 

function createSelect(name, options, className, displayName){
	const select = document.createElement("select");
	select.setAttribute("name", name);
	select.setAttribute("class", className);
	
	if(displayName != null && displayName != ''){
		const option = document.createElement("option");
		option.innerText = displayName;
		select.appendChild(option);
	}
	
	for(idx=0; idx<options.length; idx++){
		const option = document.createElement("option");
		option.setAttribute("value", options[idx].levCode);
		option.innerText = options[idx].levName;
		select.appendChild(option);
	}
	return select;
}

function createFileBox(name){
	const fileBox = document.createElement("div");
	fileBox.setAttribute("class", "goods fileBox");
	const uploadName = document.createElement("input");
	uploadName.setAttribute("class", "uploadName");
	uploadName.setAttribute("readOnly", true);
	uploadName.setAttribute("placeholder", "첨부파일");
	uploadName.style.marginRight = "3%";
	const label = document.createElement("label");
	label.setAttribute("for", "file");
	label.innerText = "찾기";
	const file = document.createElement("input");
	file.setAttribute("type","file");
	file.setAttribute("id","file");
	file.setAttribute("name", name);
	file.addEventListener("change", function(){
		let fileName = document.getElementById("file").value;
		document.getElementsByClassName("uploadName")[0].value = fileName;
	});
	
	fileBox.appendChild(uploadName);
	fileBox.appendChild(label);
	fileBox.appendChild(file);
	
	return fileBox;
}
function moveService(jobCode,clientData) {
	//const clientData = [["JWTForJSFramework", sessionStorage.JWT]];
	//serverCallByRequest(jobCode, 'post', clientData);
	if(clientData == undefined || clientData == '' || clientData == null)
		serverCallByRequest(jobCode, 'post', '');
	else 
		{	
			serverCallByRequest(jobCode, 'post', clientData);}
	
}
function Logout() {
	let member = 
	(serverData != null &&serverData.member!=undefined)?serverData.member
	:(bannerData != null &&bannerData.member!=undefined)?bannerData.member:mmSns;
		if(member.mmSns=='UK'||member.mmSns=='MK'){
			 localStorage.clear();
			  sessionStorage.clear();
			$.ajax({
				url : '/KaKaoLogout',
				type : 'get',
				async : false,
				dataType : 'text',
				success : function(res) {
					location.href = res;
				}
			});
		}else if(member.mmSns=='UN'||member.mmSns=='MN'){
				const form = createForm("", "/NaverLogout", "post");
				form.appendChild(createInputBox('hidden', 'na', sessionStorage.naveraccess, ''));
				document.body.appendChild(form);
			  localStorage.clear();
			  sessionStorage.clear();
			  form.submit();
		}else{
			const form =createForm("", "/GoogleLogout", "post")
			document.body.appendChild(form);
			 localStorage.clear();
			  sessionStorage.clear();
			  form.submit();
		}
	   
	}
