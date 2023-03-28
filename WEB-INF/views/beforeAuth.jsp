<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lost and Found</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/common.js"></script>
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

.g_id_signin:hover {
	transform: scale(1.1, 1.1)
}

#naver_id_login:hover {
	transform: scale(1.1, 1.1)
}

#kakaoooo:hover {
	transform: scale(1.1, 1.1)
}
</style>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
				style="background-color: #2c3e50; background-image: linear-gradient(180deg, #173176 10%, #01162a 100%);">
				<div class="container-fluid">
					<a class="navbar-brand animate__animated animate__jackInTheBox"
						onClick="moveService('/')" Style="cursor: pointer;">Lost
						&amp; Found</a>
				</div>
			</nav>
		</div>
		<div id=index style="display: block">
			<header class="masthead">
				<div class="container">
					<div class="masthead-subheading">Give Back Helper</div>
					<div class="masthead-heading text-uppercase">Lost Portal</div>
					<div>
						<div id="naver_id_login" onclick="naverLogin();"
							style="height: 8vh;"></div>
						<div>
							<div id="kakaoooo" onclick="kakaoLogin();" style="height: 8vh;">
								<img src="resources/images/kaka/kakao_login_large_wide.png"
									style="cursor: pointer;width: 30%; height: 40px; object-fit: cover; border-radius: 5px; border: 1px solid rgba(153, 153, 153, 0.6);"
									alt="카카오 로그인 버튼" />
							</div>
						</div>
						<div>
							<div id="kakaoooo" onclick="googleLogin();" style="height: 8vh;">
								<img src="resources/images/google/btnG_완성형.png"
									style="cursor: pointer; width: 30%; height: 40px; object-fit: cover; border-radius: 5px; border: 1px solid rgba(153, 153, 153, 0.6);"
									alt="구글 로그인 버튼" />
							</div>
						</div>
						<p id="token-result"></p>
					</div>
				</div>
			</header>

		</div>
		<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; LostPortal 2023</span>
				</div>
			</div>
		</footer>
		<!-- End of Footer -->
	</div>
	<!-- End of Footer -->
	<script>
		let current = 0;
		function itemStyleChanged(idx) {
			if (current == 0)
				document.getElementById("index").style.display = 'none';
			else if (current == 1)
				document.getElementById("regform").style.display = 'none';
			else if (current == 2)
				document.getElementById("login").style.display = 'none';
			current += idx;
			if (current == 0) {
				document.getElementById("index").style.display = 'block';
			} else if (current == 1) {
				document.getElementById("regform").style.display = 'block';
			} else if (current == 2) {
				document.getElementById("login").style.display = 'block';
			}
		}
		function regStep(idx) {
			if (idx == 1) {
				document.getElementById("regStep1").style.display = 'none';
				document.getElementById("regStep2").style.display = 'block';
			} else if (idx == 2) {
				document.getElementById("regStep2").style.display = 'none';
				document.getElementById("regStep3").style.display = 'block';
			}
		}
		/* JWT를 전달 받았을 경우 JWT로 로그인 요청 */
		function afterAuth(jsonData) {
			const userData = document
					.getElementsByClassName('communicationBox')[0].children[0].children;
			let isReaccess = false;
			if (sessionStorage.JWT) {
				if (jsonData == true) {
					const clientData = [ [ "JWTForJSFramework",
							sessionStorage.JWT ] ];
					serverCallByRequest('View/Access', 'post', clientData);
					console.log(sessionStorage.JWT);
				} else {
					sessionStorage.removeItem('JWT');
					isReaccess = true;
				}
			} else
				isReaccess = true;

			/* 재 로그인이 필요한 경우 */
			if (isReaccess) {
				for (let idx = 0; idx < userData.length; idx++) {
					userData[idx].value = '';
				}
				userData[idx].focus();
			}
		}
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		function googleLogin(){
			serverCallView('/loging', 'get','');
		}
		//카카오로그인
		function kakaoLogin() {
			$.ajax({
				url : '/login/getKakaoAuthUrl',
				type : 'get',
				async : false,
				dataType : 'text',
				success : function(res) {
					location.href = res;
				}
			});

		}
	</script>
	<script type="text/javascript">	
		var naver_id_login = new naver_id_login(NaverClientId,
				PrivateIp+"/AddInfo");
		var state = naver_id_login.getUniqState();
		naver_id_login.setDomain(PrivateIp);
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
		document.getElementById('naver_id_login').children[0].children[0]
		.setAttribute(
				"style",
				"height: 40px; object-fit: cover; width:30%; border-radius: 5px; border: 1px solid rgba(153, 153, 153, 0.6);");
		document.getElementById('naver_id_login').children[0].children[0]
				.setAttribute("src", "resources/images/naver/btnW_완성형.png");
	</script>
</body>
</html>