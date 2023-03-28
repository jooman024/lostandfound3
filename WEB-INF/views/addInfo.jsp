<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
	
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/common.js"></script>
<link href="resources/css/user.css" rel="stylesheet">
<link rel=" stylesheet" href="resources/css/beforeauth.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
@font-face {
	font-family: CookieRun;
	src: url('resources/font/CookieRun Regular.ttf');
}

#login {
	font-family: 'CookieRun';
	font-size: 1.5vw;
}

#wrap {
	height: 95vh;
}

#regform {
	font-family: 'CookieRun';
	font-size: 1.5vw;
	width: 25%;
}

header.masthead {
	font-family: 'CookieRun';
	font-size: 5vw;
	padding-top: 10.5rem;
	padding-bottom: 6rem;
	text-align: center;
	color: #fff;
	background-image: url("resources/images/mainlogo.jpg");
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
}

.container-fluid {
	font-family: 'CookieRun';
}
</style>
</head>
<body>
	<div id="wrap" style="display:none">
		<div id="header">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
				style="background-color: #2c3e50; background-image: linear-gradient(180deg, #173176 10%, #01162a 100%);">
				<div class="container-fluid">
					<a class="navbar-brand animate__animated animate__jackInTheBox"
						onClick="moveService('Index')" Style="cursor: pointer;">Lost
						&amp; Found</a>
				</div>
			</nav>
		</div>
		<div style="position: absolute;
  top: 50%;
  left: 50%;
  transform: translate3d(-80%, -50%, 0);">
  <div id="regform" style="margin: 3%;">
    <fieldset id="Signup" style="width: 25vw;">
      <h1>추가정보</h1>
      <br>
      <hr>
      <div id="regStep1" style="display: block;">
        <div class="form-group">
          <label for="exampleInputID" class="form-label mt-4">*
            전화번호</label>
          <input name="phone" class="form-control" id="exampleInputID" aria-describedby="IDhelp" placeholder="전화번호를 입력하세요" minlength="11" maxlength="11">
          <small id="IDHelp" class="form-text text-muted">* -는 쓰지 말아주세요. </small>
        </div>
        <div style="width: 100%; text-align: center; padding: 10%;">
          <div style="width: 40%;" class="btn btn-primary" onclick="certifyCtl(1)">인증하기</div>
        </div>
      </div>
    </fieldset>
  </div>
</div>

		<div class="messagebackground certify" style="display: none; z-index: 1;">
  <div style="background-color: #ffffff; border-radius: 2vw; width: 30vw; text-align: center; position: relative; left: 35vw; top: 20vw;">
    <div id="noticebody" style="height: 20vw; display: contents;">
      <div class="form-group">
        <label class="col-form-label col-form-label-lg mt-4" for="inputLarge">인증번호를 보냈습니다.</label> 
        <div id="timer" style="margin-top: 20px;">남은 시간: 3분 0초</div> <!-- 타이머 영역 -->
        <input class="form-control form-control-lg" type="text" placeholder="번호를 입력해주세요" id="myNum" style="width: 80%; margin-left: 10%;">
      </div>
      <div style="text-align: center;">
        <button type="button" class="btn btn-primary" onClick="certifyCtl(2)">확인</button>
        <button type="button" class="btn btn-primary" onClick="certifyCtl(0)">닫기</button>
      </div>
    </div>
  </div>
</div>
		<input type="hidden" id="sns" name='${member}'  />
	</div>
	<script type="text/javascript">
	let inp = document.getElementById('sns').getAttribute('name');
	let member=null;
	let numStr=null;
	function certifyCtl(){
		if(arguments[0]==1){
			document.getElementsByClassName('messagebackground certify')[0].style.display='block';
			const phone = document.getElementById("exampleInputID").value;
			let formData = new FormData();
			formData.set('Phone',phone);
			serverCallByFetchAjax(formData, '/certificationMMS', 'post', 'getNumStr');
			
		}else if(arguments[0]==2){
			if(numStr ==document.getElementById('myNum').value){
				Login();
			}else{
				document.getElementById('myNum').placeholder='인증 번호와 다릅니다.다시 시도해주세요';
			}
		}else{
			document.getElementsByClassName('messagebackground certify')[0].style.display='none';
			document.getElementById('myNum').placeholder='인증번호를 입력해주세요';
		}
	}
	function getNumStr(jsonData){
		numStr=jsonData.numStr;
	}
	if(inp!=''){
		member=JSON.parse(inp);
	}
	if(member != null){
		sessionStorage.removeItem('JWT');
		let formData = new FormData();
		formData.set('mmId',member.mmId);
		formData.set('mmName',member.mmName);
		formData.set('mmEmail',member.mmEmail);
		formData.set('mmSns',member.mmSns);
		formData.set('mmPhone',member.mmPhone);
		serverCallByFetchAjax(formData, '/IssuanceJWT', 'post', 'pageCallBack');
	}
	function pageCallBack(){
		if(member.mmPhone!='' && member.mmPhone!=null && member.mmPhone!=undefined){
			if(member.mmSns.indexOf('M') != -1){
				moveService('/View/Mgr');
			}else
				moveService('/View/User');
		}else{
			document.getElementById('wrap').style.display='block';
		}
	}
	var naver_id_login = new naver_id_login(NaverClientId, PrivateIp+"AddInfo");
		// 네이버 사용자 프로필 조회
		if(naver_id_login.is_callback == true){
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		var accessToken = naver_id_login.getAccessToken();
		sessionStorage.setItem('naveraccess', accessToken);
		}
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			const form = createForm("", "/NaverLoginCheck", "post");

			form.appendChild(createInputBox('hidden', 'mmId', naver_id_login
					.getProfileData('id'), ''));
			form.appendChild(createInputBox('hidden', 'mmName', naver_id_login
					.getProfileData('nickname'), ''));
			form.appendChild(createInputBox('hidden', 'mmEmail', naver_id_login
					.getProfileData('email'), ''));
			document.body.appendChild(form);
			form.submit();
		}
		function Login() {
			//alrte(serverData);
			const phone = document.getElementById("exampleInputID").value;
			if(member.mmSns == "UN") {
			const form = createForm("", "/AuthStationNaver", "post");
			form.appendChild(createInputBox('hidden', 'mmId', member.mmId,''));
			form.appendChild(createInputBox('hidden', 'mmName', member.mmName,''));
			form.appendChild(createInputBox('hidden', 'mmEmail', member.mmEmail,''));
			form.appendChild(createInputBox('hidden', 'mmSns', "UN", ''));
			form.appendChild(createInputBox('hidden', 'mmPhone', phone, ''));
			document.body.appendChild(form);
			
			form.submit();
			}else if(member.mmSns == "UK") {
				const form = createForm("", "/AuthStationKakao", "post");
				form.appendChild(createInputBox('hidden', 'mmId', member.mmId,''));
				form.appendChild(createInputBox('hidden', 'mmName', member.mmName,''));
				form.appendChild(createInputBox('hidden', 'mmEmail', member.mmEmail,''));
				form.appendChild(createInputBox('hidden', 'mmSns', "UK", ''));
				form.appendChild(createInputBox('hidden', 'mmPhone', phone, ''));
				document.body.appendChild(form);
				
				form.submit();
			}else if(member.mmSns == "UG") {
				const form = createForm("", "/AuthStationGoogle", "post");
				form.appendChild(createInputBox('hidden', 'mmId', member.mmId,''));
				form.appendChild(createInputBox('hidden', 'mmName', member.mmName,''));
				form.appendChild(createInputBox('hidden', 'mmEmail', member.mmEmail,''));
				form.appendChild(createInputBox('hidden', 'mmSns', "UG", ''));
				form.appendChild(createInputBox('hidden', 'mmPhone', phone, ''));
				document.body.appendChild(form);
				form.submit();
			}
		}
		let seconds = 180; // 타이머 시간 (60초)
		let timer = document.getElementById('timer'); // 타이머 영역

		// 타이머 함수
		function countdown() {
		  // 1초 감소
		  seconds--;

		  // 타이머 출력
		  const minutes = Math.floor(seconds / 60);
		  const remainingSeconds = seconds % 60;
		  console.log(minutes);
		  console.log(remainingSeconds);
		  timer.innerHTML = "남은 시간: "+minutes+"분 "+remainingSeconds+"초";

		  // 타이머 종료 조건
		  if (seconds <= 0) {
		    clearInterval(timerInterval); // 타이머 종료
		    timer.innerHTML = '시간 초과'; // 타이머 메시지 출력
		  }
		}

		// 타이머 시작
		let timerInterval = setInterval(countdown, 1000);
	</script>
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; LostPortal 2023</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->
</body>
</html>