<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>User Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="resources/js/common.js" charset="UTF-8"></script>
<link href="resources/css/user.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7810961bb19f4af441b113056021427&libraries=services"></script>
<script>
function pageLoad(){
	serverCallByFetchAjax('', '/Api/getBannerData', 'post', 'bannerCallBack');
}
</script>
<style>
.card:hover {
        transform: scale( 1.1 , 1.1 )
      }
      .carousel-item img {
  width: 100%;
  height: 13vw; 
}
.carouselExampleCaptions {
  position: absolute;
  width: 100%;
  height: 50%;
  z-index: 1;
  cursor: pointer;
}
.carouselExampleCaptions:nth-child(2) {
  top: 50%;
  transform: translateY(-50%);
}
</style>
</head>
<body onLoad="pageLoad('')">
	<div id="wrap" style="position: relative; z-index: 1;">
		<!-- Sidebar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			style="background-color: #2c3e50; background-image: linear-gradient(180deg, #cfc2c2 10%, #0b3e6e 100%);--bs-navbar-padding-y: 0rem;">
			
			<div class="container-fluid">
				<a class="navbar-brand" onClick="moveService('User')"
					style="cursor: pointer;">
					<img src="resources/images/logo/lost__1_-removebg-preview.png"style="width: auto; height: 90px; object-fit: cover;"/></a>
					
				<div class="collapse navbar-collapse" id="navbarColor01">
					<div id="lfheader" style="width: 10%; position:absolute; right:3vw;">
						
						<ul class="navbar-nav me-auto"
							style="display: flex; justify-content: flex-end;">
							<li class="nav-item no-arrow dropdown"
								style="display: inline-block;">
								<div style="width: 1.5vw;">
									<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">
										<img class="img-profile rounded-circle" id="alarmimg"
										src="resources/images/menu/alarmstatic.png" style="width: 2vw; height: 2vw;">
									</a>
									<div id="alarmmenu" class="dropdown-menu"
										style="position: absolute; right: 0vw;">
										<h6 class="dropdown-header" style="text-align: center">매칭
											알림</h6>
										
									</div>
								</div>
							</li>
							<li class="nav-item no-arrow dropdown"
								style="display: inline-block;">
								<div style="position: relative;">
									<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										style="display: flex; align-items: center;"> <span
										style="margin-left: 0.5vw;" id="username"></span> <img
										class="img-profile rounded-circle"
										src="resources/images/menu/undraw_profile.svg"
										style="width: 1vw;">
									</a>
									<!-- 알림 아이콘과 드롭다운 메뉴 등 추가 요소들 -->
									<div class="dropdown-menu"
										style="position: absolute; right: 0;">
										<a class="dropdown-item" onclick="moveService('UserMyPage')"
											style="cursor: pointer;"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
											수정
										</a> <a class="dropdown-item" onclick="moveService('UserMyLost')">
											<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 내
											분실물
										</a> <a class="dropdown-item" onclick="moveService('UserMyFound')">
											<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 내
											습득물
										</a> <a class="dropdown-item"
											onclick="moveService('UserMyComment')"> <i
											class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 내가 쓴
											코멘트
										</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" onclick="Logout()"
											data-toggle="modal" data-target="#logoutModal"> <i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											로그아웃
										</a>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</nav>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			style="background-color: #2c3e50; background-image: linear-gradient(180deg, #173176 10%, #01162a 100%);">
			<div class="container-fluid">
				<a class="navbar-brand" onClick="moveService('User')"style="cursor: pointer;"></a>
				<div class="collapse navbar-collapse" id="navbarColor01">
					<div id="lfheader"
						style="width: 100%; display: grid; grid-template-columns: 1fr 0fr;">
						<ul class="navbar-nav me-auto"
							style="display: flex; justify-content: space-around; margin-left: auto;">
							<!-- 분실물, 습득물, 유실물 종합안내 -->
							<li class="nav-item no-arrow dropdown"><a
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">분실물</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" onClick="moveService('UserLost')">분실물
										찾기</a> <a class="dropdown-item"
										onclick="moveService('UserLostReg')">분실물 신고</a>
								</div></li>
							<li class="nav-item no-arrow dropdown"><a
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">습득물</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" onclick="moveService('UserFound')">습득물
										찾기</a> <a class="dropdown-item"
										onclick="moveService('UserFoundReg')">습득물 신고</a>
								</div></li>
							<li class="nav-item no-arrow dropdown"><a
								class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">유실물
									종합안내</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" onclick="moveService('UserSCenter')">유실물
										안내</a>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<!-- Sidebar End -->
		<div id="banner"
			style="width: 10vw; height: 60vw; position: absolute; display: block; z-index: 1; cursor: pointer;">
			<div class="carouselExampleCaptions carousel slide"
				data-bs-ride="carousel"
				 style="position: absolute; width: 100%; height: 50%; top: 0;">
				<div class="carousel-inner"></div>
				<div id="carouseltxt" style="font-size: 1.5vw"></div>
				<div id="carouseldtxt" style="font-size: 1vw"></div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class="carouselExampleCaptions carousel slide"
				data-bs-ride="carousel"
				style="width: 100%; height: 50%; position: absolute; right: 0;top: 65%; z-index: 1; cursor: pointer;">
				<div class="carousel-inner"></div>
				<div id="carouseltxt2" style="font-size: 1.5vw"></div>
				<div id="carouseldtxt2" style="font-size: 1vw"></div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div id="banner2"
			style="width: 10vw; height: 60vw; position: absolute; right: 0;display: block; z-index: 1; cursor: pointer;">
			<div class="carouselExampleCaptions carousel slide"
				data-bs-ride="carousel"
				style="position: absolute; width: 100%; height: 50%; top: 0;">
				<div class="carousel-inner"></div>
				<div id="carouseltxt3" style="font-size: 1.5vw"></div>
				<div id="carouseldtxt3" style="font-size: 1vw"></div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<div class="carouselExampleCaptions carousel slide"
				data-bs-ride="carousel"
				style="width: 100%; height: 50%; position: absolute; right: 0;top: 65%; z-index: 1; cursor: pointer;">
				<div class="carousel-inner"></div>
				<div id="carouseltxt4" style="font-size: 1.5vw"></div>
				<div id="carouseldtxt4" style="font-size: 1vw"></div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div id=menuselection style="display: block">
			<section class="about-cards-section">
				<div class="container">
					<div class="row animate__animated animate__fadeIn">
						<div class="col-sm-4 card-wrapper">
							<div class="card border-0">
								<div
									class="position-relative rounded-circle overflow-hidden mx-auto custom-circle-image">
									<img class="w-100 h-100"
										src="resources/images/menu/ornament.jpg" alt="Card image cap"
										onClick="moveService('UserLost')">
								</div>
								<div class="card-body text-center mt-4">
									<h3 class="text-uppercase card-title">분실물 & 습득물</h3>
									<!-- <p class="card-text">A short caption detailing an aspect of the brand which is worth mentioning.</p>-->
								</div>
							</div>
						</div>
						<div class="col-sm-4 card-wrapper">
							<div class="card border-0">
								<div
									class="position-relative rounded-circle overflow-hidden mx-auto custom-circle-image">
									<img class="w-100 h-100" src="resources/images/menu/mypage.jpg"
										alt="Card image cap" onClick="moveService('UserMyPage')">
								</div>
								<div class="card-body text-center mt-4">
									<h3 class="text-uppercase card-title">마이페이지</h3>
								</div>
							</div>
						</div>
						<div class="col-sm-4 card-wrapper">
							<div class="card border-0">
								<div
									class="position-relative rounded-circle overflow-hidden mx-auto custom-circle-image">
									<img class="w-100 h-100"
										src="resources/images/menu/servicecenter.jpg"
										alt="Card image cap" onClick="moveService('UserSCenter')">
								</div>
								<div class="card-body text-center mt-4">
									<h3 class="text-uppercase card-title">유실물 안내</h3>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
		</div>
		<div id="founddetail" style="display: none;">
			<div
				style="height: auto; display: flex; flex-direction: column; align-items: center;">
				<div style="margin-top: 2%; margin-bottom: 2%;">
					<h1>습득물 상세보기</h1>
				</div>
				<div class="card mb-3" style="width: 40%; display: flex;">
					<h3 class="card-header" id="faName" style="font-size: 20px;">습득물명
						:</h3>
					<div class="card-body"
						style="display: flex; justify-content: space-between;">
						<div>
							<p class="card-text" id="faPostId">등록 ID :</p>
							<p class="card-text" id="faStatus">처리 상태 :</p>
						</div>
						<div style="">
							<p class="card-text" id="faCtNumber">관리번호 :</p>
							<p class="card-text" id="faCateCode"></p>
						</div>
					</div>
					<hr style="margin: 0;">
					<div class="card-body">
						<h5 class="card-title" id="faOrgId">아이디 :</h5>
						<h5 class="card-title" id="faOrName">기관 명 :</h5>
						<h5 class="card-title" id="faOrTel">기관 전화번호 :</h5>
					</div>
					<div id="yesimg" style="display: none">
						<img src="" class="d-block w-100" alt="...">
					</div>
					<div id="noimg" style="display: none">
						<svg preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
							style="font-size: 1.125rem; text-anchor: middle; height: 100%;">
    
      <rect width="100%" height="100%" fill="#868e96"></rect>
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  </svg>
					</div>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary"
							onClick="noticeCtl(2)">습득물 처리절차</button>
						<button type="button" class="btn btn-primary"
							onClick="mapsearch(0)">지도검색</button>
					</div>
					<div class="card-body">
						<p class="card-text" id="faUnique"></p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item" id="faDepPlace">보관 상태 :</li>
						<li class="list-group-item" id="faPlace">습득 장소 :</li>
						<li class="list-group-item" id="faDate">습득 날짜 :</li>
						<li class="list-group-item" id="faHour">습득 시간 :</li>
						<li class="list-group-item" id="faColor">색상 :</li>
					</ul>

					<!--  <div class="card-footer text-muted">등록일 : </div>-->
				</div>
				<div class="form-group" style="width: 40%;">
					<label for="exampleTextarea" class="form-label mt-4" style="">댓글</label>
					<textarea class="form-control" name="commentcontent"
						id="founddetailcomment" rows="3" style="margin-bottom: 2%;"></textarea>
					<div id="foundcontents"></div>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary"
							onClick="moveDetail(0)">이전</button>
						<button type="button" class="btn btn-primary"
							onClick="regComment()">코멘트 등록</button>
					</div>

				</div>
			</div>
			<div class="messagebackground a" style="display: none; z-index:10;">
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 100%; position: relative;z-index:100;"></div>
					<div id="menu_wrap" class="bg_white" style="z-index:100;">
						<div class="option" style="z-index:100;">
							<div>
								<div onClick="searchPlaces()";style="z-index:100;">
									키워드 : <input type="text" value="인천일보아카데미" id="keyword"
										size="15">
									<button style="z-index:100;">검색하기</button>
								</div>
							</div>
						</div>
						<hr>
						<ul id="placesList" style="z-index:100;"></ul>
						<div id="pagination" style="z-index:100;"></div>
					</div>
					<div style="display:flex;">
					<button id="roadviewbtn" class="btn btn-primary" onClick="mapsearch(1)" style="display:none; margin-top:8%; position: relative; z-index: 10;">로드뷰 보기</button>
					<button class="btn btn-primary" onClick="mapsearch(2)" style="margin-top:8%; position: relative; z-index: 10;">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<div id="wow" class="messagebackground notice modal" tabindex="-1"
			style="display: block;">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">안내문</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onClick="noticeClose()"></button>
					</div>
					<div class="modal-body" id="noticebody">
						Lost and Found에서는 분실물 상담 센터를 운영하고 있습니다. 아래 항목에 따라 자신의 분신물을 신고해
						주세요. <br> <br> 1.분실한 일시: <br> 2.다녀간 경로 또는 예상장소: <br>
						3.사진 또는 자세한 설명: <br> <br> Lost and Found에서는 분실신고 되어있는
						물품은 공공기관의 정보와 서비스를 동원해 찾을 수 있도록 최선의 노력을 다하겠습니다. 상담이 필요하시다면 언제든지 문의
						글에 문의해주세요. <br> 습득물에 관해서는 서울시와 경찰청데이터를 통하여 장소검색 근처 수거가 가능한
						장소로 안내해드리며,지갑이나 보석등 보관하고 있다면 가까운 관할 관서로 안내해 드리오니 절차상 어려운 점이나 불편한
						점은 언제든지 상담 가능합니다. Lost and Found 을 통해 좀 더 상세하게! 더불어 함께하는 선진 문화를
						만들어 갈 수 있도로 아낌없는 관심과 사랑 부탁드립니다.<br> 감사합니다.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onClick="closeModalOneday()">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="messagebackground b" style="display: none; z-index:10;">
				<div class="map_wrap">
					<div id="roadview" style="width: 100%; height: 100%;"></div>
					<button class="btn btn-primary" onClick="mapsearch(0)">지도보기</button>
					<button class="btn btn-primary" onClick="mapsearch(2)">닫기</button>
				</div>
			</div>
			<div id="wow2" class="messagebackground notice modal" tabindex="-1"
			style="display: none;">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">안내문</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onClick="noticeClose()"></button>
					</div>
					<div class="modal-body" id="noticebody"><h2>습득물 처리 절차</h2>
			<br>
			<br> ＊Lost and Found에서는 습득물 처리 글 센터를 운영하고 있습니다. Lost and
			Found에서는 <br>
			<br> 1.습득자는 Lost and Found의 습득 신고 글 등록을 통해 습득물의 정보를 입력합니다.
			<br> 3.습득물 신고가 접수되고 경찰청과 서울시의 습득물 데이터는 분실자가 분실물을 검색 시
			대조됩니다. <br> 4.습득물에 대한 전체 게시글이 표시됩니다. <br> 5.습득자는
			상세페이지의 정보를 통하여 분실한 물건의 정보를 제공받습니다. <br> 6.습득자는 습득물의 상세게시글을
			통해 습득물에 대한 코멘트를 작성하실 수 있습니다. <br> Lost and Found에서는 습득처리
			물품을 공공기관의 정보와 서비스를 동원해 찾으실 수 있도록 최선의 노력을 다하겠습니다. 상담이 필요하시다면
			언제든지 문의 글에 문의해주세요. <br>
			<br> 2.경찰청 홈페이지 습득물 처리 절차 - Lost112 경찰청 홈페이지에 접속
			<a href="https://www.lost112.go.kr/index.do" target="_blank">https://www.lost112.go.kr/index.do</a> <br>
			- 회원가입 후 로그인 or 로그인 <br>
			-유실물 종합안내 <br>
			-습득물 처리절차 조회</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onClick="closeModalOneday()">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	window.addEventListener('scroll', function() {
		  updateCarouselPosition();
		});
	function updateCarouselPosition() {
		  var scrollPosition = window.scrollY;
		  var carousel = document.getElementById('banner');
		  var carousel2 = document.getElementById('banner2');
		  
		  var carouselTop = 172 // 새로운 top 값
		  if (scrollPosition > 100) { // 스크롤 위치가 100 이상이면
		    carouselTop = scrollPosition + 172; // 스크롤 위치에 따라 carousel 위치를 조정
		  }
		  carousel.style.top = carouselTop + 'px'; // carousel의 위치를 업데이트
		  carousel2.style.top = carouselTop + 'px';
		}
	function bannerCallBack(jsonData){
		serverData=jsonData;
		document.getElementById('username').innerText=serverData.member.mmName;
		if(jsonData!='' && jsonData!='error'){
			bannerChanger();
			alarmChanger();
		}  
		
	}
	let serverData=null;
	let bannerData=null;
	detailNo=null;
	function alarmChanger(){
		let alarmmenu = document.getElementById("alarmmenu");
		let h6 = alarmmenu.querySelector("h6");
		while (h6.nextSibling) {
		    alarmmenu.removeChild(h6.nextSibling);
		}
		if(serverData.minfo.alarm!=''){
			document.getElementById('alarmimg').setAttribute('src','resources/images/menu/alarm.png');
			for(let i=0; i<serverData.minfo.alarm.length;i++){
				const aTag = document.createElement('a');
				aTag.classList.add('dropdown-item');

				const div = document.createElement('div');
				div.style.position = 'relative';

				const small = document.createElement('div');
				small.classList.add('small', 'text-gray-500');
				small.innerText = serverData.minfo.alarm[i].maDate.split(':')[0]
				+":"+serverData.minfo.alarm[i].maDate.split(':')[1];
				small.addEventListener('click', function() {
					event.stopPropagation(); 
					moveAlarmDetail(serverData.minfo.alarm[i].maFaCtNumber);
				});

				const span = document.createElement('span');
				span.classList.add('font-weight-bold');
				span.innerText = serverData.minfo.alarm[i].maFaCtNumber+':'+serverData.minfo.alarm[i].maFaName;
				span.addEventListener('click', function() {
					event.stopPropagation(); 
					moveAlarmDetail(serverData.minfo.alarm[i].maFaCtNumber);
				});
				const button = document.createElement('button');
				button.classList.add('btn', 'btn-link', 'p-0', 'm-0');
				button.style.position = 'absolute';
				button.style.right = '0';
				button.style.top = '0';
				button.innerHTML = '&times;';
				button.addEventListener('click', function() {
					event.stopPropagation(); 
					alarmDelete(serverData.minfo.alarm[i].maLaCtNumber,serverData.minfo.alarm[i].maFaCtNumber);
				});
				aTag.appendChild(div);
				div.appendChild(small);
				div.appendChild(span);
				div.appendChild(button);
				document.getElementById('alarmmenu').appendChild(aTag);
			}
		}else{
			document.getElementById('alarmimg').setAttribute('src','resources/images/menu/alarmstatic.png');
			const aTag = document.createElement('a');
			aTag.classList.add('dropdown-item');

			const div = document.createElement('div');
			div.style.position = 'relative';

			const span = document.createElement('span');
			span.classList.add('font-weight-bold');
			span.innerText = '알림 내용 없음'

			aTag.appendChild(div);
			div.appendChild(span);
			document.getElementById('alarmmenu').appendChild(aTag);
		}
	}
	function alarmDelete(){
		formData = new FormData();
		formData.append("mInfo.alarm[0].maLaCtNumber",arguments[0]); 
		formData.append("mInfo.alarm[0].maFaCtNumber",arguments[1]); 
		serverCallByFetchAjax(formData, '/Api/delAlarmRow', 'post', 'bannerCallBack');
	}
	let dno=null;
	function moveAlarmDetail(){
		for(let i=0; i<serverData.minfo.alarm.length; i++){
		    if(serverData.minfo.alarm[i].found.faCtNumber == arguments[0]){
		    	dno=i;
		    	break;
		    }
		}
		if(arguments[0]!=0){
			detailNo=arguments[0];
			moveAlarmDetail(0);
			document.getElementById("founddetail").style.display = 'block';
			document.getElementById("menuselection").style.display = 'none';
			if(serverData.minfo.alarm[dno].found.member.mmSns=='AG')
				document.getElementById("faPostId").innerText += serverData.minfo.alarm[dno].found.faDepPlace.split('&')[0];
			else
				document.getElementById("faPostId").innerText += serverData.minfo.alarm[dno].found.faMmId.substring(0,3)+'***';
			document.getElementById("faCtNumber").innerText += arguments[0];
			document.getElementById("faName").innerText += serverData.minfo.alarm[dno].found.faName;
			document.getElementById("faPlace").innerText += serverData.minfo.alarm[dno].found.faPlace;
			document.getElementById("faStatus").innerText += serverData.minfo.alarm[dno].found.faStatus;
			document.getElementById("faDate").innerText += serverData.minfo.alarm[dno].found.faDate;
			if(serverData.minfo.alarm[dno].found.member.mmSns=='AG')
				document.getElementById("faOrgId").innerText += serverData.minfo.alarm[dno].found.faMmId;
			else
				document.getElementById("faOrgId").innerText += serverData.minfo.alarm[dno].found.faMmId.substring(0,3)+'***';
			
			if(arguments[0][0]=='S')
				document.getElementById("faUnique").innerText += serverData.minfo.alarm[dno].found.faUnique.replace(/<br>/g, "\n");
			else
				document.getElementById("faUnique").innerText += serverData.minfo.alarm[dno].found.faUnique;
			document.getElementById("faHour").innerText += serverData.minfo.alarm[dno].found.faHour+'시';
			document.getElementById("faColor").innerText += serverData.minfo.alarm[dno].found.faColor+'색';
			document.getElementById("faDepPlace").innerText += serverData.minfo.alarm[dno].found.faDepPlace;
			document.getElementById("faCateCode").innerText += serverData.minfo.alarm[dno].found.faMcCode+"<<"+serverData.minfo.alarm[dno].found.faUcCode;
			if(serverData.minfo.alarm[dno].found.member != null)
				document.getElementById("faOrName").innerText += serverData.minfo.alarm[dno].found.member.mmName;
			if(serverData.minfo.alarm[dno].found.member != null)
				document.getElementById("faOrTel").innerText += serverData.minfo.alarm[dno].found.member.mmPhone;
			
			if(serverData.minfo.alarm[dno].found.faImgList != ''){
			    document.getElementById("yesimg").style.display="block";
			    document.getElementById("yesimg").children[0].setAttribute("src", serverData.minfo.alarm[dno].found.faImgList[0].fiLoc + '?' + new Date().getTime());
			}else{
			    document.getElementById("noimg").style.display="block";
			}
			foundcomplatecomment(serverData.minfo.alarm[dno].found);
			
			let inputBox = document.getElementById("keyword");
			let faDepPlace = serverData.minfo.alarm[dno].found.faDepPlace;
			  if (faDepPlace.indexOf('&') !== -1) {
			    faDepPlace = faDepPlace.split('&')[0];
			  }
			if(serverData.minfo.alarm[dno].found.member.mmSns=='AG')
				inputBox.value = faDepPlace;
			else{
				let temp = [];
				temp=faDepPlace.split(' ');
				inputBox.value = temp[0]+temp[1]+temp[2];
			}
		}else{
			document.getElementById("founddetail").style.display = 'none';
			document.getElementById("menuselection").style.display = 'block';
			
			document.getElementById("faPostId").innerText ='등록 ID : ';
			document.getElementById("faCtNumber").innerText ='관리번호 : ';
			document.getElementById("faName").innerText ='습득물명 : ';
			document.getElementById("faPlace").innerText = '습득 장소 : ';
			document.getElementById("faStatus").innerText ='처리 상태 : '
			document.getElementById("faDate").innerText ='습득 날짜 : ';
			document.getElementById("faOrgId").innerText ='아이디 : ';
			document.getElementById("faUnique").innerText = '';
			document.getElementById("faHour").innerText = '습득 시간 : ';
			document.getElementById("faColor").innerText ='색상 : '; 
			document.getElementById("faDepPlace").innerText ='보관 장소 : ';
			document.getElementById("faCateCode").innerText = '';
			if(serverData.minfo.alarm[dno].found.member.mmSns=='AG'){
				document.getElementById("faOrName").innerText = '기관 명 : ';
				document.getElementById("faOrTel").innerText ='기관 전화번호 : ';
			}else{
				document.getElementById("faOrName").innerText = '닉네임 : ';
				document.getElementById("faOrTel").innerText ='전화번호 : ';
			}
			
			document.getElementById("noimg").style.display="none";
			document.getElementById("yesimg").style.display="none";
			document.getElementById('foundcontents').innerText='';
		}
	}
	function regComment(){
		formData = new FormData();
		if(document.getElementById('founddetail').style.display=='block')
		{
			formData.append("fcoCode",detailNo); 
			formData.append("fcoMmId",serverData.member.mmId); 
			formData.append("fcoComment",document.getElementById("founddetailcomment").value);
			serverCallByFetchAjax(formData, '/Api/foundComment', 'post', 'foundcomplatecomment');
			document.getElementById("founddetailcomment").value='';
		}
	}
	function foundcomplatecomment(jsonData){
		if(jsonData.faCommentList != null && jsonData.faCommentList != ''){
			console.log(jsonData);
			 document.getElementById('foundcontents').innerText = '';
			for(let i=0; i<serverData.balist.length ; i++){
				if(serverData.balist[i].faCtNumber == jsonData.faCommentList[0].fcoCode){
					serverData.balist[i].faCommentList=jsonData.faCommentList;
				}
			}
			      for(let i=0; i<jsonData.faCommentList.length ; i++) {
			    	  const headerDiv = document.createElement('div');
				        headerDiv.setAttribute('class','comment-header');
				        foundcontents.appendChild(headerDiv);
			        
				        const commentDiv = document.createElement('div');
				        commentDiv.setAttribute('class','comment')
				        foundcontents.appendChild(commentDiv);

			        
			        
			        const idSpan = document.createElement('span');
			        idSpan.setAttribute('class','comment-id');
			        idSpan.innerText = '  '+'회원ID:'
			        idSpan.innerText += jsonData.faCommentList[i].fcoMmName;
			        idSpan.innerText += '\n';
			        headerDiv.appendChild(idSpan);

			        const dateSpan = document.createElement('span');
			        dateSpan.setAttribute('class','comment-date');
			        dateSpan.innerText = '  '+'등록일:'
			        dateSpan.innerText += jsonData.faCommentList[i].fcoDate;
			        dateSpan.innerText += '\n';
			        headerDiv.appendChild(dateSpan);

			        const commentP = document.createElement('p');
			        commentP.setAttribute('class','comment-text');
			        commentP.innerText += jsonData.faCommentList[i].fcoComment;
			        commentP.innerText += '\n';
			        commentDiv.appendChild(commentP);
			      }
		}
	}
	function moveDetail() {
		for(let i=0; i<serverData.balist.length; i++){
			for(key in serverData.balist[i]) {
			    if(serverData.balist[i].faCtNumber == arguments[0]){
			    	dno=i;
			    	break;
			    }
			}
		}
		if(arguments[0]!=0){
			detailNo=arguments[0];
			moveDetail(0);
			document.getElementById("founddetail").style.display = 'block';
			document.getElementById("menuselection").style.display = 'none';
			if(serverData.balist[dno].member.mmSns=='AG')
				document.getElementById("faPostId").innerText += serverData.balist[dno].faDepPlace.split('&')[0];
			else
				document.getElementById("faPostId").innerText += serverData.balist[dno].faMmId.substring(0,3)+'***';
			document.getElementById("faCtNumber").innerText += arguments[0];
			document.getElementById("faName").innerText += serverData.balist[dno].faName;
			document.getElementById("faPlace").innerText += serverData.balist[dno].faPlace;
			document.getElementById("faStatus").innerText += serverData.balist[dno].faStatus;
			document.getElementById("faDate").innerText += serverData.balist[dno].faDate;
			if(serverData.balist[dno].member.mmSns=='AG')
				document.getElementById("faOrgId").innerText += serverData.balist[dno].faMmId;
			else
				document.getElementById("faOrgId").innerText += serverData.balist[dno].faMmId.substring(0,3)+'***';
			
			if(arguments[0][0]=='S')
				document.getElementById("faUnique").innerText += serverData.balist[dno].faUnique.replace(/<br>/g, "\n");
			else
				document.getElementById("faUnique").innerText += serverData.balist[dno].faUnique;
			document.getElementById("faHour").innerText += serverData.balist[dno].faHour+'시';
			document.getElementById("faColor").innerText += serverData.balist[dno].faColor+'색';
			document.getElementById("faDepPlace").innerText += serverData.balist[dno].faDepPlace;
			document.getElementById("faCateCode").innerText += serverData.balist[dno].faMcCode+"<<"+serverData.balist[dno].faUcCode;
			if(serverData.balist[dno].member != null)
				document.getElementById("faOrName").innerText += serverData.balist[dno].member.mmName;
			if(serverData.balist[dno].member != null)
				document.getElementById("faOrTel").innerText += serverData.balist[dno].member.mmPhone;
			
			if(serverData.balist[dno].faImgList != ''){
			    document.getElementById("yesimg").style.display="block";
			    document.getElementById("yesimg").children[0].setAttribute("src", serverData.balist[dno].faImgList[0].fiLoc + '?' + new Date().getTime());
			}else{
			    document.getElementById("noimg").style.display="block";
			}
			foundcomplatecomment(serverData.balist[dno]);
			
			let inputBox = document.getElementById("keyword");
			let depPlace = serverData.balist[dno].faDepPlace;
			  if (depPlace.indexOf('&') !== -1) {
				  depPlace = depPlace.split('&')[0];
			  }
				if(serverData.balist[dno].member.mmSns=='AG')
					inputBox.value = depPlace;
				else{
				 	let temp = [];
					temp=depPlace.split(' ');
					inputBox.value = temp[0]+temp[1]+temp[2];
				}
		}else{
			document.getElementById("founddetail").style.display = 'none';
			document.getElementById("menuselection").style.display = 'block';
			
			document.getElementById("faPostId").innerText ='등록 ID : ';
			document.getElementById("faCtNumber").innerText ='관리번호 : ';
			document.getElementById("faName").innerText ='습득물명 : ';
			document.getElementById("faPlace").innerText = '습득 장소 : ';
			document.getElementById("faStatus").innerText ='처리 상태 : '
			document.getElementById("faDate").innerText ='습득 날짜 : ';
			document.getElementById("faOrgId").innerText ='아이디 : ';
			document.getElementById("faUnique").innerText = '';
			document.getElementById("faHour").innerText = '습득 시간 : ';
			document.getElementById("faColor").innerText ='색상 : '; 
			document.getElementById("faDepPlace").innerText ='보관 장소 : ';
			document.getElementById("faCateCode").innerText = '';
			if(serverData.balist[dno].member.mmSns=='AG'){
				document.getElementById("faOrName").innerText = '기관 명 : ';
				document.getElementById("faOrTel").innerText ='기관 전화번호 : ';
			}else{
				document.getElementById("faOrName").innerText = '닉네임 : ';
				document.getElementById("faOrTel").innerText ='전화번호 : ';
			}
			
			document.getElementById("noimg").style.display="none";
			document.getElementById("yesimg").style.display="none";
			document.getElementById('foundcontents').innerText='';
		}
	}
	function bannerChanger(){
		let carouselInnera = document.getElementsByClassName("carousel-inner")[0];
		let carouselInnerb = document.getElementsByClassName("carousel-inner")[1];
		let carouselInnerc = document.getElementsByClassName("carousel-inner")[2];
		let carouselInnerd = document.getElementsByClassName("carousel-inner")[3];
		carouselInnera.innerHTML='';
		carouselInnerb.innerHTML='';
		carouselInnerc.innerHTML='';
		carouselInnerd.innerHTML='';
		
		for(i in serverData.balist){
			let carouselItem = document.createElement("div");
			if(i<10)
				carouselItem.setAttribute('class',"carousel-item a");
			else if(i<20)
				carouselItem.setAttribute('class',"carousel-item b");
			else if(i<30)
				carouselItem.setAttribute('class',"carousel-item c");
			else if(i<40)
				carouselItem.setAttribute('class',"carousel-item d");
		    if (i == 0 || i == 10 || i == 20 || i==30) {
		      carouselItem.classList.add("active");
		    }
		    let image = document.createElement("img");
		    image.src = serverData.balist[i].faImgList[0].fiLoc;
		    image.alt = "Slide "+(parseInt(i)+1);
		    image.classList.add("d-block", "w-100");
		    carouselItem.appendChild(image);
	       if(i<10)
		   	carouselInnera.appendChild(carouselItem);
	       else if(i<20)
	    	   carouselInnerb.appendChild(carouselItem);
			else if(i<30)
				carouselInnerc.appendChild(carouselItem);
			else if(i<40)
				carouselInnerd.appendChild(carouselItem);
		}
		document.getElementById('carouseltxt').innerText='습득물명 : '+serverData.balist[0].faName;
		document.getElementById('carouseldtxt').innerText='색상 : '+serverData.balist[0].faColor+'색';
		document.getElementById('carouseldtxt').innerText+='\n보관장소 : '+serverData.balist[0].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[0].setAttribute('onClick',"moveDetail('"+serverData.balist[0].faCtNumber+"')");
		document.getElementById('carouseltxt2').innerText='습득물명 : '+serverData.balist[10].faName;
		document.getElementById('carouseldtxt2').innerText='색상 : '+serverData.balist[10].faColor+'색';
		document.getElementById('carouseldtxt2').innerText+='\n보관장소 : '+serverData.balist[10].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[1].setAttribute('onClick',"moveDetail('"+serverData.balist[10].faCtNumber+"')");
		document.getElementById('carouseltxt3').innerText='습득물명 : '+serverData.balist[20].faName;
		document.getElementById('carouseldtxt3').innerText='색상 : '+serverData.balist[20].faColor+'색';
		document.getElementById('carouseldtxt3').innerText+='\n보관장소 : '+serverData.balist[20].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[2].setAttribute('onClick',"moveDetail('"+serverData.balist[20].faCtNumber+"')");
		document.getElementById('carouseltxt4').innerText='습득물명 : '+serverData.balist[30].faName;
		document.getElementById('carouseldtxt4').innerText='색상 : '+serverData.balist[30].faColor+'색';
		document.getElementById('carouseldtxt4').innerText+='\n보관장소 : '+serverData.balist[30].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[3].setAttribute('onClick',"moveDetail('"+serverData.balist[30].faCtNumber+"')");
		
		var banner1 = document.getElementsByClassName("carouselExampleCaptions")[0];
	    var banner2 = document.getElementsByClassName("carouselExampleCaptions")[1];
	    var banner3 = document.getElementsByClassName("carouselExampleCaptions")[2];
	    var banner4 = document.getElementsByClassName("carouselExampleCaptions")[3];
	    banner1.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item a');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item a active'){
	    			document.getElementById('carouseltxt').innerText='습득물명 : '+serverData.balist[i].faName;
	    			document.getElementById('carouseldtxt').innerText='색상 : '+serverData.balist[i].faColor+'색';
	    			document.getElementById('carouseldtxt').innerText+='\n보관장소 : '+serverData.balist[i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[0].setAttribute('onClick',"moveDetail('"+serverData.balist[i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner2.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item b');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item b active'){
	    			document.getElementById('carouseltxt2').innerText='습득물명 : '+serverData.balist[10+i].faName;
	    			document.getElementById('carouseldtxt2').innerText='색상 : '+serverData.balist[10+i].faColor+'색';
	    			document.getElementById('carouseldtxt2').innerText+='\n보관장소 : '+serverData.balist[10+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[1].setAttribute('onClick',"moveDetail('"+serverData.balist[10+i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner3.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item c');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item c active'){
	    			document.getElementById('carouseltxt3').innerText='습득물명 : '+serverData.balist[20+i].faName;
	    			document.getElementById('carouseldtxt3').innerText='색상 : '+serverData.balist[20+i].faColor+'색';
	    			document.getElementById('carouseldtxt3').innerText+='\n보관장소 : '+serverData.balist[20+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[2].setAttribute('onClick',"moveDetail('"+serverData.balist[20+i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner4.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item d');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item d active'){
	    			document.getElementById('carouseltxt4').innerText='습득물명 : '+serverData.balist[30+i].faName;
	    			document.getElementById('carouseldtxt4').innerText='색상 : '+serverData.balist[30+i].faColor+'색';
	    			document.getElementById('carouseldtxt4').innerText+='\n보관장소 : '+serverData.balist[30+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[3].setAttribute('onClick',"moveDetail('"+serverData.balist[30+i].faCtNumber+"')");
	    		}
	    	}
	    });
	}
	
	function noticeCtl(){
		if(arguments[0]==2)
			document.getElementsByClassName('messagebackground notice')[1].style.display = 'block';
	}
	const getCookie = (name) => {
	    const value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    return value ? value[2] : null;
	}

	const noticeClose = () => {
		document.querySelector('#wow').style.display = 'none';
		document.querySelector('#wow2').style.display = 'none';
	}

	const closeModalOneday = () => {
	    let date = new Date(Date.now() + 86400e3);
		date = date.toUTCString();
		document.cookie = `modalClose=T; expires=${date}`
			noticeClose();
	}

	(function() {
	    if (getCookie('modalClose')) noticeClose();
	}());
	
	function mapsearch(){
		if(arguments[0]==0){
			roadview = null;
			roadviewClient = null;
			position=null;
			document.getElementsByClassName("messagebackground b")[0].style.display = 'none';
			document.getElementsByClassName("messagebackground a")[0].style.display = 'block';
			 mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		     mapOption = {
		         center: new kakao.maps.LatLng(37.4388406, 126.6751131), // 지도의 중심좌표
		         level: 3 // 지도의 확대 레벨
		     };  
		 	// 지도를 생성합니다    
		 	map = map = new kakao.maps.Map(mapContainer, mapOption);
		 	let inputBox = document.getElementById("keyword");
		 	ps.keywordSearch(inputBox.value, placesSearchCB);
		}else if(arguments[0]==1){
			map=null;
			mapContainer=null;
			document.getElementsByClassName("messagebackground a")[0].style.display = 'none';
			
			roadview = new kakao.maps.Roadview(roadviewContainer);
			roadviewClient = new kakao.maps.RoadviewClient();
			position = new kakao.maps.LatLng(37.4388406, 126.6751131);
			
			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			document.getElementsByClassName("messagebackground b")[0].style.display = 'block';
			
		}else if(arguments[0]==2){
			map=null;
			mapContainer=null;
			roadview = null;
			roadviewClient = null;
			position=null;
			document.getElementsByClassName("messagebackground a")[0].style.display = 'none';
			document.getElementsByClassName("messagebackground b")[0].style.display = 'none';
		}
		
	}
	//KaKaO Map Api
	 // 마커를 담을 배열입니다

	 var markers = [];

	var mapContainer=null;
	var map=null;

	 // 장소 검색 객체를 생성합니다
	 var ps = new kakao.maps.services.Places();  

	 // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	 var infowindow = new kakao.maps.InfoWindow({zIndex:1});


	 // 키워드 검색을 요청하는 함수입니다
	 function searchPlaces() {

	     var keyword = document.getElementById('keyword').value;

	     if (!keyword.replace(/^\s+|\s+$/g, '')) {
	         alert('키워드를 입력해주세요!');
	         return false;
	     }

	     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	     ps.keywordSearch( keyword, placesSearchCB); 
	 }

	 function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		        coords1 = data[0].x;
		        coords2 = data[0].y;
		     // 로드뷰 표출할 위치 설정
		        var position = new kakao.maps.LatLng(coords2, coords1);
		        // 로드뷰 생성
		        var roadview = new kakao.maps.Roadview(roadviewContainer);
		        var roadviewClient = new kakao.maps.RoadviewClient();

		        // 로드뷰 표출할 위치와 가까운 panoId를 추출하여 로드뷰 실행
		        roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		            if (panoId) {
		                // 로드뷰가 있을 경우 로드뷰 표시
		                document.getElementById('roadviewbtn').style.display='block';
		                roadview.setPanoId(panoId, position);
		            } else {
		            	document.getElementById('roadviewbtn').style.display='none';
		            }
		        });
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        alert('검색 결과가 존재하지 않습니다.');
		        document.getElementById('roadviewbtn').style.display='none';
		        return;
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        alert('검색 결과 중 오류가 발생했습니다.');
		        document.getElementById('roadviewbtn').style.display='none';
		        return;
		    }
		}

	 // 검색 결과 목록과 마커를 표출하는 함수입니다
	 function displayPlaces(places) {

	     var listEl = document.getElementById('placesList'), 
	     menuEl = document.getElementById('menu_wrap'),
	     fragment = document.createDocumentFragment(), 
	     bounds = new kakao.maps.LatLngBounds(), 
	     listStr = '';
	     
	     // 검색 결과 목록에 추가된 항목들을 제거합니다
	     removeAllChildNods(listEl);

	     // 지도에 표시되고 있는 마커를 제거합니다
	     removeMarker();
	     
	     for ( var i=0; i<places.length; i++ ) {

	         // 마커를 생성하고 지도에 표시합니다
	         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	             marker = addMarker(placePosition, i), 
	             itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	         // LatLngBounds 객체에 좌표를 추가합니다
	         bounds.extend(placePosition);

	         // 마커와 검색결과 항목에 mouseover 했을때
	         // 해당 장소에 인포윈도우에 장소명을 표시합니다
	         // mouseout 했을 때는 인포윈도우를 닫습니다
	         (function(marker, title) {
	             kakao.maps.event.addListener(marker, 'mouseover', function() {
	                 displayInfowindow(marker, title);
	             });

	             kakao.maps.event.addListener(marker, 'mouseout', function() {
	                 infowindow.close();
	             });

	             itemEl.onmouseover =  function () {
	                 displayInfowindow(marker, title);
	             };

	             itemEl.onmouseout =  function () {
	                 infowindow.close();
	             };
	         })(marker, places[i].place_name);

	         fragment.appendChild(itemEl);
	     }

	     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	     listEl.appendChild(fragment);
	     menuEl.scrollTop = 0;

	     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	     map.setBounds(bounds);
	 }

	 // 검색결과 항목을 Element로 반환하는 함수입니다
	 function getListItem(index, places) {
	     var el = document.createElement('li'),
	     itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                 '<div class="info">' +
	                 '   <h5>' + places.place_name + '</h5>';

	     if (places.road_address_name) {
	         itemStr += '    <span>' + places.road_address_name + '</span>' +
	                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
	     } else {
	         itemStr += '    <span>' +  places.address_name  + '</span>'; 
	     }
	                  
	       itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                 '</div>';           

	     el.innerHTML = itemStr;
	     el.className = 'item';

	     return el;
	 }

	 // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	 function addMarker(position, idx, title) {
	     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	         imgOptions =  {
	             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	         },
	         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	             marker = new kakao.maps.Marker({
	             position: position, // 마커의 위치
	             image: markerImage 
	         });

	     marker.setMap(map); // 지도 위에 마커를 표출합니다
	     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	     return marker;
	 }

	 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	 function removeMarker() {
	     for ( var i = 0; i < markers.length; i++ ) {
	         markers[i].setMap(null);
	     }   
	     markers = [];
	 }

	 // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	 function displayPagination(pagination) {
	     var paginationEl = document.getElementById('pagination'),
	         fragment = document.createDocumentFragment(),
	         i; 

	     // 기존에 추가된 페이지번호를 삭제합니다
	     while (paginationEl.hasChildNodes()) {
	         paginationEl.removeChild (paginationEl.lastChild);
	     }

	     for (i=1; i<=pagination.last; i++) {
	         var el = document.createElement('a');
	         el.href = "#";
	         el.innerHTML = i;

	         if (i===pagination.current) {
	             el.className = 'on';
	         } else {
	             el.onclick = (function(i) {
	                 return function() {
	                     pagination.gotoPage(i);
	                 }
	             })(i);
	         }

	         fragment.appendChild(el);
	     }
	     paginationEl.appendChild(fragment);
	 }

	 // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	 // 인포윈도우에 장소명을 표시합니다
	 function displayInfowindow(marker, title) {
	     var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	     infowindow.setContent(content);
	     infowindow.open(map, marker);
	 }

	  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	 function removeAllChildNods(el) {   
	     while (el.hasChildNodes()) {
	         el.removeChild (el.lastChild);
	     }
	 }
	  
	 var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	 var roadview = null; //로드뷰 객체
	 var roadviewClient = null; //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

	 var position = null;
	</script>
</body>
<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; LostPortal 2023</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->
</html>