<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - FoundReg</title>
<script src="resources/js/common.js" charset="UTF-8"></script>
<link href="resources/css/user.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="resources/js/jquery.min.js"></script>
<!-- KaKao Map Api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7810961bb19f4af441b113056021427&libraries=services"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
function pageLoad(){
	serverCallByFetchAjax('', '/Api/getBannerData', 'post', 'bannerCallBack');
}
</script>
<style>
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
			style="background-color: #2c3e50; background-image: linear-gradient(180deg, #173176 10%, #01162a 100%);">
			<div class="container-fluid">
				<a class="navbar-brand" onClick="moveService('User')"
					style="cursor: pointer;">Lost &amp; Found</a>

				<div class="collapse navbar-collapse" id="navbarColor01">
					<div id="lfheader"
						style="width: 100%; display: grid; grid-template-columns: 1fr 0fr;">
						<ul class="navbar-nav me-auto"
							style="display: flex; justify-content: space-around;">
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
										종합안내</a>
								</div></li>
						</ul>
						<ul class="navbar-nav me-auto"
							style="display: flex; justify-content: flex-end;">
							<!-- 알림 아이콘, 유저 황영현 메뉴 -->
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
		<!-- Sidebar End -->
		<!-- Banner -->
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
		<!-- Banner End -->
		<!-- Content -->
		<div id="regfound" style="display: block">
			<form id="regform">
				<div id="regfoundstep1" style="display: block">
					<h1>Report Found</h1>
					<small>습득물 신고양식입니다. (*) 표시는 필수 입력 항목입니다.</small>
					<hr>
					<h5>습득 정보 입력</h5>
					<div class="form-group">
						<label for="formFile" class="form-label mt-4">* 물품 사진 </label> <input
							class="form-control" type="file" id="regimg">
					</div>
					<div class="form-group">
						<label for="exampleSelect1" class="form-label mt-4">* 습득
							지역</label> <select class="losel" name="location">
							<option value="">선택</option>
							<option value="LSE">서울특별시</option>
							<option value="LGA">강원도</option>
							<option value="LGU">경기도</option>
							<option value="LGS">경상남도</option>
							<option value="LGN">경상북도</option>
							<option value="LGJ">광주광역시</option>
							<option value="LDU">대구광역시</option>
							<option value="LDN">대전광역시</option>
							<option value="LBN">부산광역시</option>
							<option value="LUN">울산광역시</option>
							<option value="LIN">인천광역시</option>
							<option value="LJS">전라남도</option>
							<option value="LJN">전라북도</option>
							<option value="LCS">충청남도</option>
							<option value="LCN">충청북도</option>
							<option value="LJU">제주특별자치도</option>
							<option value="LSG">세종특별자치시</option>
							<option value="LAB">해외</option>
							<option value="LEC">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleSelect1" class="form-label mt-4"> * 습득
							장소 분류</label> <select class="plsel" name="place">
							<option value="">선택</option>
							<option value="P01">우체국(통)</option>
							<option value="P02">노상</option>
							<option value="P03">기차</option>
							<option value="P04">지하철</option>
							<option value="P05">백화점/매장</option>
							<option value="P06">택시</option>
							<option value="P07">음식점(업소포함)</option>
							<option value="P08">공공기관</option>
							<option value="P09">버스</option>
							<option value="P10">주택</option>
							<option value="P11">공항</option>
							<option value="P12">상점</option>
							<option value="P13">영화관</option>
							<option value="P14">놀이공원</option>
							<option value="P15">유원지</option>
							<option value="P16">학교</option>
							<option value="P17">회사</option>
							<option value="P18">기타</option>
							<option value="P19">불상</option>
						</select>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault"> *
							습득 장소 상세</label>
						<!-- Input with Tag Creation -->
						<div class="input-group">
							<input type="text" class="tag-container-1 form-control"
								placeholder="Type a keyword...">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									onclick="createTag('tag-container-1')">+ 키워드 추가</button>
							</div>
						</div>
						<div class="mt-4" id="tag-container-1"></div>
					</div>
				</div>
				<div id="regfoundstep2" style="display: block">
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault">* 습득
							날짜 </label><br>
						<input type="date" id="regfadate" name="foundDate">
					</div>
					<label for="exampleSelect1" class="form-label mt-4 width50">*
						습득 시간<select class="form-select " id="reghour">
							<option value="">시간 선택</option>
							<option value="1">오전 1시</option>
							<option value="2">오전 2시</option>
							<option value="3">오전 3시</option>
							<option value="4">오전 4시</option>
							<option value="5">오전 5시</option>
							<option value="6">오전 6시</option>
							<option value="7">오전 7시</option>
							<option value="8">오전 8시</option>
							<option value="9">오전 9시</option>
							<option value="10">오전 10시</option>
							<option value="11">오전 11시</option>
							<option value="12">오전 12시</option>
							<option value="13">오후 1시</option>
							<option value="14">오후 2시</option>
							<option value="15">오후 3시</option>
							<option value="16">오후 4시</option>
							<option value="17">오후 5시</option>
							<option value="18">오후 6시</option>
							<option value="19">오후 7시</option>
							<option value="20">오후 8시</option>
							<option value="21">오후 9시</option>
							<option value="22">오후 10시</option>
							<option value="23">오후 11시</option>
							<option value="24">오후 12시</option>
					</select>
					</label> <br>
					<hr>
					<div class="form-group">
						<div>
							<label class="col-form-label mt-4" for="inputDefault">* 글
								제목</label> <small>(습득물 목록에 표시되는 제목입니다.)</small>
						</div>
						<div>
							<label class="col-form-label mt-4 width50 " for="inputDefault">
								<div class="input-group">
									<input type="text" class="tag-container-2 form-control"
										placeholder="Type a keyword...">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
											onclick="createTag('tag-container-2')">+ 키워드 추가</button>
									</div>
								</div>
								<div class="mt-4" id="tag-container-2"></div>
							</label>
						</div>
						<div>
							<label for="exampleSelect1" class="form-label mt-4 width50">*
								대분류<select class="form-select " id="MainCategories"
								name="MainCategories" onchange="updateSubCategories()">
									<option value="NN">대분류 선택</option>
									<option value="BA">가방</option>
									<option value="OR">귀금속</option>
									<option value="BO">도서용품</option>
									<option value="DO">서류</option>
									<option value="IY">산업용품</option>
									<option value="SH">쇼핑백</option>
									<option value="SP">스포츠용품</option>
									<option value="IN">악기</option>
									<option value="ST">유가증권</option>
									<option value="CL">의류</option>
									<option value="CA">자동차</option>
									<option value="EL">전자기기</option>
									<option value="WA">지갑</option>
									<option value="CE">증명서</option>
									<option value="CO">컴퓨터</option>
									<option value="CR">카드</option>
									<option value="CS">현금</option>
									<option value="SM">휴대폰</option>
									<option value="ET">기타물품</option>
									<option value="LE">유류품</option>
							</select>
							</label> <label for="exampleSelect1" class="form-label mt-4 width50"
								style="float: right">* 중분류<select class="form-select"
								id="SubCategories" name="SubCategories">
									<!-- 동적생성  BA0~BA9 ... LE0~LE9 -->
									<option value="">중분류 선택</option>

							</select>
							</label>
						</div>
					</div>
					</div>
					<div id="regfoundstep3" style="display: block">
						<div class="form-group width50">
							<label for="exampleSelect1" class="form-label mt-4"> * 물품
								색상</label> <select class="colsel" name="color">
								<option value="">선택</option>
								<option value="흰">흰색</option>
								<option value="검정">검정색</option>
								<option value="회">회색</option>
								<option value="빨강">빨강색</option>
								<option value="주황">주황색</option>
								<option value="노랑">노랑색</option>
								<option value="초록">초록색</option>
								<option value="파랑">파랑색</option>
								<option value="남">남색</option>
								<option value="보라">보라색</option>
								<option value="갈">갈색</option>
								<option value="분홍">분홍색</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleTextarea" class="form-label mt-4">* 보관
								장소</label>
							<textarea class="form-control" id="regfounddep" rows="1"
								onClick="kakaoPostCodeAPI()">
						</textarea>
							<label for="exampleTextarea" class="form-label mt-4">* 상세
								내용</label>
							<textarea class="form-control" id="regfounddetail" rows="3"></textarea>
						</div>
						<div style="width: 100%; text-align: center; padding: 10%">
							<div style="width: 30%" class="btn btn-primary"
								onclick="userFoundRegister()">등록</div>
						</div>
					</div>
			</form>
		</div>
		<!-- Content End -->
		<!-- Content -->
		<div id="matchingresult" style="display: none">
		</div>
		<!-- Content End -->
		<!-- Sub -->
		<div id="lostdetail" style="display: none;">
			<div
				style="height: auto; display: flex; flex-direction: column; align-items: center;">
				<div style="margin-top: 2%; margin-bottom: 2%;">
					<h1>분실물 상세보기</h1>
				</div>
				
				<div class="card mb-3" style="width: 40%; display: flex;">
					<h3 class="card-header" id="laName" style="font-size: 20px;">분실물명 : </h3>
					<div class="card-body"
						style="display: flex; justify-content: space-between;">
						<div>
							<p class="card-text" id="laPostId">등록 ID : </p>
							<p class="card-text" id="laStatus">처리 상태 : </p>
						</div>
						<div style="">
							<p class="card-text" id="laCtNumber">관리번호 : </p>
							<p class="card-text" id="laCateCode"> </p>
						</div>
					</div>
					<hr style="margin: 0;">
					<div class="card-body">
						<h5 class="card-title" id="laOrgId">아이디 : </h5>
						<h5 class="card-title" id="laOrName">기관 명 : </h5>
						<h5 class="card-title" id="laOrTel">기관 전화번호 : </h5> 

					</div>
					<div class="yesimg" style="display:none">
					<img src="" class="d-block w-100" alt="...">
					</div>
					<div class="noimg" style="display:none"><svg preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle; height: 100%;">
    
      <rect width="100%" height="100%" fill="#868e96"></rect>
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  </svg></div>
					<div style="text-align: right;">
						<button type="button" class="btn btn-primary"
							onClick="noticeCtl(2)">습득물 처리절차</button>
						<button type="button" class="btn btn-primary"
							onClick="mapsearch(0)">지도검색</button>
					</div>
					<div class="card-body">
						<p class="card-text" id="laUnique"></p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item" id ="laLocation">분실 지역 : </li>
						<li class="list-group-item" id ="laPlace">분실 장소 : </li>
						<li class="list-group-item" id ="laDate">분실 날짜 : </li>
						<li class="list-group-item" id ="laHour">분실 시간 : </li>
					</ul>

					<!--  <div class="card-footer text-muted">등록일 : </div>-->
				</div>
				<div class="form-group" style="width: 40%;">
					<label for="exampleTextarea" class="form-label mt-4" style="">댓글</label>
					<textarea class="form-control" name="commentcontent"
						id="lostdetailcomment" rows="3" style="margin-bottom: 2%;"></textarea>
						<div id="lostcontents"></div> 
					<div style="text-align: right;">
					<button type="button" class="btn btn-primary"
							onClick="moveDetail(0)">이전</button>
						<button type="button" class="btn btn-primary"
							onClick="regComment()">코멘트
							등록</button>
					</div>

				</div>
			</div>
		</div>
		<!-- Sub End -->
		<div id="founddetail" style="display: none;">
			<div
				style="height: auto; display: flex; flex-direction: column; align-items: center;">

				<div style="margin-top: 2%; margin-bottom: 2%;">
					<h1>습득물 상세보기</h1>
				</div>

				<div class="card mb-3" style="width: 40%; display: flex;">
					<h3 class="card-header" id="faName" style="font-size: 20px;">습득물명 : </h3>
					<div class="card-body"
						style="display: flex; justify-content: space-between;">
						<div>
							<p class="card-text" id="faPostId">등록 ID : </p>
							<p class="card-text" id="faStatus">처리 상태 : </p>
						</div>
						<div style="">
							<p class="card-text" id="faCtNumber">관리번호 : </p>
							<p class="card-text" id="faCateCode"> </p>
						</div>
					</div>
					<hr style="margin: 0;">
					<div class="card-body">
						<h5 class="card-title" id="faOrgId">아이디 : </h5>
						<h5 class="card-title" id="faOrName">기관 명 : </h5>
						<h5 class="card-title" id="faOrTel">기관 전화번호 : </h5> 

					</div>
					<div class="yesimg" style="display:none">
					<img src="" class="d-block w-100" alt="...">
					</div>
					<div class="noimg" style="display:none"><svg preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle; height: 100%;">
    
      <rect width="100%" height="100%" fill="#868e96"></rect>
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  </svg></div>
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
						<li class="list-group-item" id ="faDepPlace">보관 상태 : </li>
						<li class="list-group-item" id ="faPlace">습득 장소 : </li>
						<li class="list-group-item" id ="faDate">습득 날짜 : </li>
						<li class="list-group-item" id ="faHour">습득 시간 : </li>
					    <li class="list-group-item" id ="faColor">색상 : </li>
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
							onClick="bannerDetail(0)">이전</button>
						<button type="button" class="btn btn-primary"
							onClick="regComment()">코멘트
							등록</button>
					</div>

				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="messagebackground a" style="display: none; z-index:10;">
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 100%; position: relative;z-index:100;"></div>
					<div id="menu_wrap" class="bg_white" style="z-index:100;">
						<div class="option" style="z-index:100;">
							<div>
								<form onsubmit="searchPlaces(); return false; style="z-index:100;">
									키워드 : <input type="text" value="인천일보아카데미" id="keyword"
										size="15">
									<button type="submit" style="z-index:100;">검색하기</button>
								</form>
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
			<div class="messagebackground b" style="display: none; z-index:10;">
				<div class="map_wrap">
					<div id="roadview" style="width: 100%; height: 100%;"></div>
					<button class="btn btn-primary" onClick="mapsearch(0)">지도보기</button>
					<button class="btn btn-primary" onClick="mapsearch(2)">닫기</button>
				</div>
			</div>
		<div id="wow" class="messagebackground notice modal" tabindex="-1"
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
		<!-- Modal End -->
	</div>
	<script type="text/javascript">
	let serverData=null;
	let bannerData=null;
	let status=1;
	detailNo=null;
	function userFoundRegister() {
		let formData = new FormData();
		let keywordList =[];
		keywordList.push(document.getElementsByClassName("plsel")[0][document.getElementsByClassName("plsel")[0].selectedIndex].textContent);
		keywordList.push(document.getElementsByClassName("colsel")[0].value);
		const tagElements = document.querySelectorAll(".tag");
	    for (let i = 0; i < tagElements.length; i++) {
	    	keywordList.push(tagElements[i].textContent.split('×')[0]);
	    }
	    formData.set("mInfo.keyword",keywordList);
	    formData.set("mInfo.loCode",document.getElementsByClassName("losel")[0].value);
	    formData.set("mInfo.mcCode",document.getElementById("MainCategories").value);
	    formData.set("mInfo.ucCode",document.getElementById("SubCategories").value);
	    //serverCallByFetchAjax(formData, '/Api/foundMatching', 'post', 'pageCallBack');
	    
	    formData.set("falist[0].faMcCode",document.getElementById("MainCategories").value);
	    formData.set("falist[0].faUcCode",document.getElementById("SubCategories").value);
	    let faName='';
	    let regtags=document.getElementById("tag-container-2").querySelectorAll(".tag");
	    for (let i=0; i<regtags.length; i++){
	    	faName+=' '+regtags[i].textContent.split('×')[0];
	    }
	    let faUnique=document.getElementById("regfounddetail").value;
	    let regtags2=document.getElementById("tag-container-1").querySelectorAll(".tag");
	    for (let i=0; i<regtags2.length; i++){
	    	faUnique+='&'+regtags2[i].textContent.split('×')[0];
	    }
	    formData.set("falist[0].faName",faName);
	    formData.set("falist[0].faPlace",document.getElementsByClassName("plsel")[0].value);
	    formData.set("falist[0].faColor",document.getElementsByClassName("colsel")[0].value);
	    formData.set("falist[0].faDepPlace",document.getElementById("regfounddep").value);
	    formData.set("falist[0].faDate",document.getElementById("regfadate").value);
	    formData.set("falist[0].faStatus",'S');
	    formData.set("falist[0].faLocation",document.getElementsByClassName("losel")[0].value);
	    formData.set("falist[0].faUnique",faUnique);
	    formData.set("falist[0].faHour",document.getElementById("reghour").value);
	    
	    serverCallByFetchAjax(formData, '/Api/userFoundRegister', 'post', 'pageCallBack');
	}
	document.getElementById("regimg").addEventListener("change", (event) => {
	  const file = event.target.files[0];
	  if (file.type === "image/gif") {
	    event.target.value = "";
	    alert("Gif 가 아닌 정적 이미지를 올려주세요");
	  }else{
		let formData = new FormData(); 
		formData.set("file",document.getElementById("regimg").files[0]);
		serverCallByFetchAjax(formData, '/Api/userFoundBefore', 'post', '');
	  }
	});
	function regComment(){
		formData = new FormData();
		if(document.getElementById('founddetail').style.display=='block')
		{
			formData.append("fcoCode",detailNo); 
			formData.append("fcoMmId",bannerData.member.mmId); 
			formData.append("fcoComment",document.getElementById("founddetailcomment").value);
			serverCallByFetchAjax(formData, '/Api/foundComment', 'post', 'foundcomplatecomment');
			document.getElementById("founddetailcomment").value='';
		}
		else
		{
			formData.append("lcoCode",detailNo); 
			formData.append("lcoMmId",bannerData.member.mmId); 
			formData.append("lcoComment",document.getElementById("lostdetailcomment").value);
			serverCallByFetchAjax(formData, '/Api/lostComment', 'post', 'lostcomplatecomment');
			document.getElementById("lostdetailcomment").value='';
		}
		
	}
	function foundcomplatecomment(jsonData){
		if(jsonData.faCommentList != null && jsonData.faCommentList != ''){
			console.log(jsonData);
			 document.getElementById('foundcontents').innerText = '';
			for(let i=0; i<bannerData.balist.length ; i++){
				if(bannerData.balist[i].faCtNumber == jsonData.faCommentList[0].fcoCode){
					bannerData.balist[i].faCommentList=jsonData.faCommentList;
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
	function lostcomplatecomment(jsonData){
		if(jsonData.laCommentList != null && jsonData.laCommentList != ''){
			 document.getElementById('lostcontents').innerText = '';
			for(let i=0; i<serverData.lalist.length ; i++){
				if(serverData.lalist[i].laCtNumber == jsonData.laCommentList[0].lcoCode){
					serverData.lalist[i].laCommentList=jsonData.laCommentList;
				}
			}
			 for(let i=0; i<jsonData.laCommentList.length ; i++) {
		    	  const headerDiv = document.createElement('div');
			        headerDiv.setAttribute('class','comment-header');
			        lostcontents.appendChild(headerDiv);
		        
			        const commentDiv = document.createElement('div');
			        commentDiv.setAttribute('class','comment')
			        lostcontents.appendChild(commentDiv);
		        
		        const idSpan = document.createElement('span');
		        idSpan.setAttribute('class','comment-id');
		        idSpan.innerText = '  '+'회원ID:'
		        idSpan.innerText += bannerData.member.mmName;
		        idSpan.innerText += '\n';
		        headerDiv.appendChild(idSpan);

		        const dateSpan = document.createElement('span');
		        dateSpan.setAttribute('class','comment-date');
		        dateSpan.innerText = '  '+'등록일:'
		        dateSpan.innerText += jsonData.laCommentList[i].lcoDate;
		        dateSpan.innerText += '\n';
		        headerDiv.appendChild(dateSpan);

		        const commentP = document.createElement('p');
		        commentP.setAttribute('class','comment-text');
		        commentP.innerText += jsonData.laCommentList[i].lcoComment;
		        commentP.innerText += '\n';
		        commentDiv.appendChild(commentP);
		      }
		}
	}
	let dno=null;
	function bannerDetail() {
		for(let i=0; i<bannerData.balist.length; i++){
			for(key in bannerData.balist[i]) {
			    if(bannerData.balist[i].faCtNumber == arguments[0]){
			    	dno=i;
			    	break;
			    }
			}
		}
		if(arguments[0]!=0){
			detailNo=arguments[0];
			bannerDetail(0);
			document.getElementById("founddetail").style.display = 'block';
			if(document.getElementById("regfound").style.display == 'block'){
				document.getElementById("regfound").style.display = 'none';
				status=1;			
			}else if(document.getElementById("lostdetail").style.display =='block'){
				document.getElementById("lostdetail").style.display = 'none';
				status=2;
			}else if(document.getElementById("matchingresult").style.display == 'block'){
				document.getElementById("matchingresult").style.display = 'none';
				status=3;				
			}
			if(bannerData.balist[dno].member.mmSns=='AG')
				document.getElementById("faPostId").innerText += bannerData.balist[dno].faDepPlace.split('&')[0];
			else
				document.getElementById("faPostId").innerText += bannerData.balist[dno].faMmId.substring(0,3)+'***';
			
			document.getElementById("faCtNumber").innerText += arguments[0];
			document.getElementById("faName").innerText += bannerData.balist[dno].faName;
			document.getElementById("faPlace").innerText += bannerData.balist[dno].faPlace;
			document.getElementById("faStatus").innerText += bannerData.balist[dno].faStatus;
			document.getElementById("faDate").innerText += bannerData.balist[dno].faDate;
			
			if(bannerData.balist[dno].member.mmSns=='AG')
				document.getElementById("faOrgId").innerText += bannerData.balist[dno].faMmId;
			else
				document.getElementById("faOrgId").innerText += bannerData.balist[dno].faMmId.substring(0,3)+'***';
			
			if(arguments[0][0]=='S')
				document.getElementById("faUnique").innerText += bannerData.balist[dno].faUnique.replace(/<br>/g, "\n");
			else
				document.getElementById("faUnique").innerText += bannerData.balist[dno].faUnique;
			document.getElementById("faHour").innerText += bannerData.balist[dno].faHour+'시';
			document.getElementById("faColor").innerText += bannerData.balist[dno].faColor+'색';
			document.getElementById("faDepPlace").innerText += bannerData.balist[dno].faDepPlace;
			document.getElementById("faCateCode").innerText += bannerData.balist[dno].faMcCode+"<<"+bannerData.balist[dno].faUcCode;
			if(bannerData.balist[dno].member != null)
				document.getElementById("faOrName").innerText += bannerData.balist[dno].member.mmName;
			if(bannerData.balist[dno].member != null)
				document.getElementById("faOrTel").innerText += bannerData.balist[dno].member.mmPhone;
			
			if(bannerData.balist[dno].faImgList != ''){
			    document.getElementsByClassName("yesimg")[1].style.display="block";
			    document.getElementsByClassName("yesimg")[1].children[0].setAttribute("src", bannerData.balist[dno].faImgList[0].fiLoc + '?' + new Date().getTime());
			}else{
			    document.getElementsByClassName("noimg")[1].style.display="block";
			}
			foundcomplatecomment(bannerData.balist[dno]);
			
			let inputBox = document.getElementById("keyword");
			let depPlace = bannerData.balist[dno].faDepPlace;
			  if (depPlace.indexOf('&') !== -1) {
				  depPlace = depPlace.split('&')[0];
			  }
				if(bannerData.balist[dno].member.mmSns=='AG')
					inputBox.value = depPlace;
				else{
				 	let temp = [];
					temp=depPlace.split(' ');
					inputBox.value = temp[0]+temp[1]+temp[2];
				}
		}else{
			document.getElementById("founddetail").style.display = 'none';
			if(status==1)
				document.getElementById("regfound").style.display = 'block';
			else if(status==2)
				document.getElementById("lostdetail").style.display = 'block';
			else if(status==3)
				document.getElementById("matchingresult").style.display = 'block';
			
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
			if(bannerData.balist[dno].member.mmSns=='AG'){
				document.getElementById("faOrName").innerText = '기관 명 : ';
				document.getElementById("faOrTel").innerText ='기관 전화번호 : ';
			}else{
				document.getElementById("faOrName").innerText = '닉네임 : ';
				document.getElementById("faOrTel").innerText ='전화번호 : ';
			}
			
			document.getElementsByClassName("noimg")[1].style.display="none";
			document.getElementsByClassName("yesimg")[1].style.display="none";
			document.getElementById('foundcontents').innerText='';
		}
	}
	function bannerCallBack(jsonData){
		bannerData=jsonData;
		document.getElementById('username').innerText=bannerData.member.mmName;
		if(bannerData!='' && bannerData!='error'){
			bannerChanger();
			alarmChanger();
		}  
	}
	function alarmChanger(){
		let alarmmenu = document.getElementById("alarmmenu");
		let h6 = alarmmenu.querySelector("h6");
		while (h6.nextSibling) {
		    alarmmenu.removeChild(h6.nextSibling);
		}
		if(bannerData.minfo.alarm!=''){
			document.getElementById('alarmimg').setAttribute('src','resources/images/menu/alarm.png');
			for(let i=0; i<bannerData.minfo.alarm.length;i++){
				const aTag = document.createElement('a');
				aTag.classList.add('dropdown-item');

				const div = document.createElement('div');
				div.style.position = 'relative';

				const small = document.createElement('div');
				small.classList.add('small', 'text-gray-500');
				small.innerText = bannerData.minfo.alarm[i].maDate.split(':')[0]
				+":"+bannerData.minfo.alarm[i].maDate.split(':')[1];
				small.addEventListener('click', function() {
					event.stopPropagation(); 
					moveAlarmDetail(bannerData.minfo.alarm[i].maFaCtNumber);
				});

				const span = document.createElement('span');
				span.classList.add('font-weight-bold');
				span.innerText = bannerData.minfo.alarm[i].maFaCtNumber+':'+bannerData.minfo.alarm[i].maFaName;
				span.addEventListener('click', function() {
					event.stopPropagation(); 
					moveAlarmDetail(bannerData.minfo.alarm[i].maFaCtNumber);
				});
				const button = document.createElement('button');
				button.classList.add('btn', 'btn-link', 'p-0', 'm-0');
				button.style.position = 'absolute';
				button.style.right = '0';
				button.style.top = '0';
				button.innerHTML = '&times;';
				button.addEventListener('click', function() {
					event.stopPropagation(); 
					alarmDelete(bannerData.minfo.alarm[i].maLaCtNumber);
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
	function moveAlarmDetail(){
		for(let i=0; i<bannerData.minfo.alarm.length; i++){
		    if(bannerData.minfo.alarm[i].found.faCtNumber == arguments[0]){
		    	dno=i;
		    	break;
		    }
		}
		if(arguments[0]!=0){
			detailNo=arguments[0];
			moveAlarmDetail(0);
			
			document.getElementById("founddetail").style.display = 'block';
			if(document.getElementById("regfound").style.display == 'block'){
				document.getElementById("regfound").style.display = 'none';
				status=1;			
			}else if(document.getElementById("lostdetail").style.display =='block'){
				document.getElementById("lostdetail").style.display = 'none';
				status=2;
			}else if(document.getElementById("matchingresult").style.display == 'block'){
				document.getElementById("matchingresult").style.display = 'none';
				status=3;				
			}
			if(bannerData.minfo.alarm[dno].found.member.mmSns=='AG')
				document.getElementById("faPostId").innerText += bannerData.minfo.alarm[dno].found.faDepPlace.split('&')[0];
			else
				document.getElementById("faPostId").innerText += bannerData.minfo.alarm[dno].found.faMmId.substring(0,3)+'***';
			document.getElementById("faCtNumber").innerText += arguments[0];
			document.getElementById("faName").innerText += bannerData.minfo.alarm[dno].found.faName;
			document.getElementById("faPlace").innerText += bannerData.minfo.alarm[dno].found.faPlace;
			document.getElementById("faStatus").innerText += bannerData.minfo.alarm[dno].found.faStatus;
			document.getElementById("faDate").innerText += bannerData.minfo.alarm[dno].found.faDate;
			if(bannerData.minfo.alarm[dno].found.member.mmSns=='AG')
				document.getElementById("faOrgId").innerText += bannerData.minfo.alarm[dno].found.faMmId;
			else
				document.getElementById("faOrgId").innerText += bannerData.minfo.alarm[dno].found.faMmId.substring(0,3)+'***';
			
			if(arguments[0][0]=='S')
				document.getElementById("faUnique").innerText += bannerData.minfo.alarm[dno].found.faUnique.replace(/<br>/g, "\n");
			else
				document.getElementById("faUnique").innerText += bannerData.minfo.alarm[dno].found.faUnique;
			document.getElementById("faHour").innerText += bannerData.minfo.alarm[dno].found.faHour+'시';
			document.getElementById("faColor").innerText += bannerData.minfo.alarm[dno].found.faColor+'색';
			document.getElementById("faDepPlace").innerText += bannerData.minfo.alarm[dno].found.faDepPlace;
			document.getElementById("faCateCode").innerText += bannerData.minfo.alarm[dno].found.faMcCode+"<<"+bannerData.minfo.alarm[dno].found.faUcCode;
			if(bannerData.minfo.alarm[dno].found.member != null)
				document.getElementById("faOrName").innerText += bannerData.minfo.alarm[dno].found.member.mmName;
			if(bannerData.minfo.alarm[dno].found.member != null)
				document.getElementById("faOrTel").innerText += bannerData.minfo.alarm[dno].found.member.mmPhone;
			
			if(bannerData.minfo.alarm[dno].found.faImgList != ''){
			    document.getElementsByClassName("yesimg")[1].style.display="block";
			    document.getElementsByClassName("yesimg")[1].children[0].setAttribute("src", bannerData.minfo.alarm[dno].found.faImgList[0].fiLoc + '?' + new Date().getTime());
			}else{
			    document.getElementsByClassName("noimg")[1].style.display="block";
			}
			foundcomplatecomment(bannerData.minfo.alarm[dno].found);
			
			let inputBox = document.getElementById("keyword");
			let faDepPlace = bannerData.minfo.alarm[dno].found.faDepPlace;
			  if (faDepPlace.indexOf('&') !== -1) {
			    faDepPlace = faDepPlace.split('&')[0];
			  }
			if(bannerData.minfo.alarm[dno].found.member.mmSns=='AG')
				inputBox.value = faDepPlace;
			else{
				let temp = [];
				temp=faDepPlace.split(' ');
				inputBox.value = temp[0]+temp[1]+temp[2];
}
		}else{
			document.getElementById("founddetail").style.display = 'none';
			if(status==1)
				document.getElementById("regfound").style.display = 'block';
			else if(status==2)
				document.getElementById("lostdetail").style.display = 'block';
			else if(status==3)
				document.getElementById("matchingresult").style.display = 'block';
			
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
			if(bannerData.minfo.alarm[dno].found.member.mmSns=='AG'){
				document.getElementById("faOrName").innerText = '기관 명 : ';
				document.getElementById("faOrTel").innerText ='기관 전화번호 : ';
			}else{
				document.getElementById("faOrName").innerText = '닉네임 : ';
				document.getElementById("faOrTel").innerText ='전화번호 : ';
			}
			
			document.getElementsByClassName("noimg")[1].style.display="none";
			document.getElementsByClassName("yesimg")[1].style.display="none";
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
		
		for(i in bannerData.balist){
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
		    image.src = bannerData.balist[i].faImgList[0].fiLoc;
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
		document.getElementById('carouseltxt').innerText='습득물명 : '+bannerData.balist[0].faName;
		document.getElementById('carouseldtxt').innerText='색상 : '+bannerData.balist[0].faColor+'색';
		document.getElementById('carouseldtxt').innerText+='\n보관장소 : '+bannerData.balist[0].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[0].setAttribute('onClick',"bannerDetail('"+bannerData.balist[0].faCtNumber+"')");
		document.getElementById('carouseltxt2').innerText='습득물명 : '+bannerData.balist[10].faName;
		document.getElementById('carouseldtxt2').innerText='색상 : '+bannerData.balist[10].faColor+'색';
		document.getElementById('carouseldtxt2').innerText+='\n보관장소 : '+bannerData.balist[10].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[1].setAttribute('onClick',"bannerDetail('"+bannerData.balist[10].faCtNumber+"')");
		document.getElementById('carouseltxt3').innerText='습득물명 : '+bannerData.balist[20].faName;
		document.getElementById('carouseldtxt3').innerText='색상 : '+bannerData.balist[20].faColor+'색';
		document.getElementById('carouseldtxt3').innerText+='\n보관장소 : '+bannerData.balist[20].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[2].setAttribute('onClick',"bannerDetail('"+bannerData.balist[20].faCtNumber+"')");
		document.getElementById('carouseltxt4').innerText='습득물명 : '+bannerData.balist[30].faName;
		document.getElementById('carouseldtxt4').innerText='색상 : '+bannerData.balist[30].faColor+'색';
		document.getElementById('carouseldtxt4').innerText+='\n보관장소 : '+bannerData.balist[30].faDepPlace;
		document.getElementsByClassName("carouselExampleCaptions")[3].setAttribute('onClick',"bannerDetail('"+bannerData.balist[30].faCtNumber+"')");
		
		var banner1 = document.getElementsByClassName("carouselExampleCaptions")[0];
	    var banner2 = document.getElementsByClassName("carouselExampleCaptions")[1];
	    var banner3 = document.getElementsByClassName("carouselExampleCaptions")[2];
	    var banner4 = document.getElementsByClassName("carouselExampleCaptions")[3];
	    banner1.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item a');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item a active'){
	    			document.getElementById('carouseltxt').innerText='습득물명 : '+bannerData.balist[i].faName;
	    			document.getElementById('carouseldtxt').innerText='색상 : '+bannerData.balist[i].faColor+'색';
	    			document.getElementById('carouseldtxt').innerText+='\n보관장소 : '+bannerData.balist[i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[0].setAttribute('onClick',"bannerDetail('"+bannerData.balist[i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner2.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item b');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item b active'){
	    			document.getElementById('carouseltxt2').innerText='습득물명 : '+bannerData.balist[10+i].faName;
	    			document.getElementById('carouseldtxt2').innerText='색상 : '+bannerData.balist[10+i].faColor+'색';
	    			document.getElementById('carouseldtxt2').innerText+='\n보관장소 : '+bannerData.balist[10+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[1].setAttribute('onClick',"bannerDetail('"+bannerData.balist[10+i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner3.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item c');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item c active'){
	    			document.getElementById('carouseltxt3').innerText='습득물명 : '+bannerData.balist[20+i].faName;
	    			document.getElementById('carouseldtxt3').innerText='색상 : '+bannerData.balist[20+i].faColor+'색';
	    			document.getElementById('carouseldtxt3').innerText+='\n보관장소 : '+bannerData.balist[20+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[2].setAttribute('onClick',"bannerDetail('"+bannerData.balist[20+i].faCtNumber+"')");
	    		}
	    	}
	    });
	    banner4.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item d');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item d active'){
	    			document.getElementById('carouseltxt4').innerText='습득물명 : '+bannerData.balist[30+i].faName;
	    			document.getElementById('carouseldtxt4').innerText='색상 : '+bannerData.balist[30+i].faColor+'색';
	    			document.getElementById('carouseldtxt4').innerText+='\n보관장소 : '+bannerData.balist[30+i].faDepPlace;
	    			document.getElementsByClassName("carouselExampleCaptions")[3].setAttribute('onClick',"bannerDetail('"+bannerData.balist[30+i].faCtNumber+"')");
	    		}
	    	}
	    });
	}

window.addEventListener('scroll', function() {
		  updateCarouselPosition();
		});
	function updateCarouselPosition() {
		  var scrollPosition = window.scrollY;
		  var carousel = document.getElementById('banner');
		  var carousel2 = document.getElementById('banner2');
		  
		  var carouselTop = 83; // 새로운 top 값
		  if (scrollPosition > 100) { // 스크롤 위치가 100 이상이면
		    carouselTop = scrollPosition + 83; // 스크롤 위치에 따라 carousel 위치를 조정
		  }
		  carousel.style.top = carouselTop + 'px'; // carousel의 위치를 업데이트
		  carousel2.style.top = carouselTop + 'px';
		}
	function moveDetail() {
		let dno=null;
		for(let i=0; i<serverData.lalist.length; i++){
			for(key in serverData.lalist[i]) {
			    if(serverData.lalist[i].laCtNumber == arguments[0]){
			    	dno=i;
			    	break;
			    }
			}
		}
		if(arguments[0]!=0){
			detailNo=arguments[0];
			document.getElementById("lostdetail").style.display = 'block';
			document.getElementById("matchingresult").style.display = 'none';
			
			
			document.getElementById("laPostId").innerText += serverData.lalist[dno].laMmId;
			document.getElementById("laCtNumber").innerText += arguments[0];
			document.getElementById("laName").innerText += serverData.lalist[dno].laName;
			document.getElementById("laPlace").innerText += serverData.lalist[dno].laPlace;
			document.getElementById("laStatus").innerText += serverData.lalist[dno].laStatus;
			document.getElementById("laDate").innerText += serverData.lalist[dno].laDate;
			document.getElementById("laOrgId").innerText += serverData.lalist[dno].laMmId;
			document.getElementById("laUnique").innerText += serverData.lalist[dno].laUnique;
			document.getElementById("laHour").innerText += serverData.lalist[dno].laHour+'시';
			document.getElementById("laLocation").innerText += serverData.lalist[dno].laLocation;
			document.getElementById("laCateCode").innerText += serverData.lalist[dno].laMcCode+"<<"+serverData.lalist[dno].laUcCode;
			if(serverData.lalist[dno].member!=null)
				document.getElementById("laOrName").innerText += serverData.lalist[dno].member.mmName;
			if(serverData.lalist[dno].member!=null)
				document.getElementById("laOrTel").innerText += serverData.lalist[dno].member.mmPhone;
			
			if(serverData.lalist[dno].laImgList != ''){
			    document.getElementsByClassName("yesimg")[0].style.display="block";
			    document.getElementsByClassName("yesimg")[0].children[0].setAttribute("src",serverData.lalist[dno].laImgList[0].liLoc + '?_t=' + new Date().getTime());
			}else{
			    document.getElementsByClassName("noimg")[0].style.display="block";
			}
			lostcomplatecomment(serverData.lalist[dno]);
			let inputBox = document.getElementById("keyword");
			if(serverData.lalist[dno].member.mmSns =='AG')
				inputBox.value = serverData.lalist[dno].member.mmName;
			else{
				let temp = [];			
				temp=serverData.lalist[dno].laUnique.split(':')[0].split(' ');
				inputBox.value = temp[0]+temp[1]+temp[2];
			}
		}else{
			document.getElementById("lostdetail").style.display = 'none';
			document.getElementById("matchingresult").style.display = 'block';
			
			document.getElementById("laPostId").innerText ='등록 ID : ';
			document.getElementById("laCtNumber").innerText ='관리번호 : ';
			document.getElementById("laName").innerText ='분실물명 : ';
			document.getElementById("laPlace").innerText = '분실 장소 : ';
			document.getElementById("laStatus").innerText ='처리 상태 : '
			document.getElementById("laDate").innerText ='분실 날짜 : ';
			document.getElementById("laOrgId").innerText ='아이디 : ';
			document.getElementById("laUnique").innerText = '';
			document.getElementById("laHour").innerText = '분실 시간 : ';
			document.getElementById("laLocation").innerText ='분실 장소 : ';
			document.getElementById("laCateCode").innerText = '';
			document.getElementById("laOrName").innerText = '기관 명 : ';
			document.getElementById("laOrTel").innerText ='기관 전화번호 : ';
			
			document.getElementsByClassName("noimg")[0].style.display="none";
			document.getElementsByClassName("yesimg")[0].style.display="none";
			document.getElementById('lostcontents').innerText='';
		}
	}
	function pageCallBack(jsonData){
		serverData=jsonData;
		if(jsonData!='' && jsonData!='error'){
			console.log(jsonData);
			if(jsonData.lalist != null && jsonData.lalist != '' && jsonData != 'error')
			{
				console.log(faName);
				let clientData = [] ;
				for(let i=0; i<serverData.lalist.length; i++){
					if(serverData.lalist[i].member.mmSns != 'AG' && serverData.lalist[i].member.mmSns != '' && serverData.lalist[i].member.mmSns != null){
						clientData.push(["mInfo.alarm["+i+"].maLaCtNumber",serverData.lalist[i].laCtNumber]);
						clientData.push(["mInfo.alarm["+i+"].maMmId",serverData.lalist[i].member.mmId]);
						clientData.push(["mInfo.alarm["+i+"].maLaName",serverData.lalist[i].laName]);
						clientData.push(["mInfo.alarm["+i+"].maMmName",serverData.lalist[i].member.mmName]);
						clientData.push(["mInfo.alarm["+i+"].maFaName",serverData.minfo.alarm[0].maFaName]);
						clientData.push(["mInfo.alarm["+i+"].maFaCtNumber",serverData.minfo.alarm[0].maFaCtNumber]);
						clientData.push(["mInfo.alarm["+i+"].maMmEmail",serverData.lalist[i].member.mmEmail]);
					}
				}
				serverCallView('/View/ALERTMSG','post',clientData);
			}else
				moveService('User');
		}
	}  
	let subCategoryOptions = {		
			"NN": [["NN","중분류 선택"]],
			"BA": [["BA0","여성용가방"], ["BA1","남성용가방"], ["BA2","기타가방"]],
			"OR": [["OR0","반지"], ["OR1","목걸이"], ["OR2","귀걸이"], ["OR3","시계"], ["ET3","기타"]],
			"BO": [["BO0","학습서적"], ["BO1","소설"], ["BO2","컴퓨터서적"], ["BO3","만화책"], ["BO4","기타서적"]],
			"DO": [["DO0","서류"], ["ET4","기타물품"]],
			"IY": [["ET4","기타물품"]],
			"SH": [["SH0","쇼핑백"]],
			"SP": [["SP0","스포츠용품"]],
			"IN": [["IN0","건반악기"], ["IN1","관악기"], ["IN2","타악기"], ["IN3","현악기"], ["IN4","기타악기"]],
			"ST": [["ST0","어음"], ["ST1","상품권"], ["ST2","채권"], ["ET3","기타"]],
			"CL": [["CL0","여성의류"], ["CL1","남성의류"], ["CL2","아기의류"], ["CL3","모자"], ["CL4","신발"], ["CL5","기타의류"]],
			"CA": [["CA0","자동차열쇠"], ["CA1","네비게이션"], ["CA2","자동차번호판"], ["CA3","임시번호판"], ["ET5","기타용품"]],
			"EL": [["EL0","태블릿"], ["EL1","스마트워치"], ["EL2","무선이어폰"], ["EL3","카메라"], ["ET5","기타용품"]],
			"WA": [["WA0","여성용 지갑"], ["WA1","남성용 지갑"], ["WA2","기타 지갑"]],
			"CE": [["CE0","신분증 "], ["CE1","면허증"], ["CE2","여권"], ["ET3","기타"]],
			"CO": [["CO0","삼성노트북"], ["CO1","LG노트북"], ["CO2","애플노트북"], ["ET3","기타"]],
			"CR": [["CR0","신용(체크)카드"], ["CR1","일반카드"], ["CR2","기타카드"]],
			"CS": [["CS0","현금"], ["CS1","수표"], ["CS2","외화"], ["ET3","기타"]],
			"SM": [["SM0","삼성휴대폰"], ["SM1","LG휴대폰"], ["SM2","아이폰"], ["SM3","기타휴대폰"], ["SM4","기타통신기기"]],
			"ET": [["ET0","안경"], ["ET1","선글라스"], ["ET2","매장문화재"], ["ET3","기타"]],
			"LE": [["LE0","유류품"]]
		};
	serverCallByFetchAjax('', '/Api/getMgrsCate', 'post', 'addMgrsCate');
	function addMgrsCate(jsonData){
		console.log(jsonData);
		for(let i=0; i<jsonData.subCategoryList.length;i++){
			subCategoryOptions[jsonData.subCategoryList[i].ucmcCode]
			.splice(subCategoryOptions[jsonData.subCategoryList[i].ucmcCode].length-1, 0, 
					[jsonData.subCategoryList[i].ucCode, jsonData.subCategoryList[i].ucName]); 
		}
	}
	function updateSubCategories() {
		let mainCategorySelect = document.getElementById("MainCategories");
		let mainCategory = mainCategorySelect.value;
		let subCategorySelect = document.getElementById("SubCategories");
		subCategorySelect.innerHTML = "";
		if (mainCategory !== "") {
			let options = subCategoryOptions[mainCategory];
			for (let i = 0; i < options.length; i++) {
				let option = document.createElement("option");
				option.value = options[i][0];
				option.textContent = options[i][1];
				subCategorySelect.appendChild(option);
			}
		}
	}
	function createTag(containerId) {
	    let inputElement = document.getElementsByClassName(containerId+" form-control")[0];
	    let keyword = inputElement.value.trim().toLowerCase();
	    if (keyword === "") {
	        return;
	    }
	    let tagElements = document.querySelectorAll("#" + containerId + " .tag");
	    for (let i = 0; i < tagElements.length; i++) {
	        if (tagElements[i].textContent.trim().toLowerCase() === keyword) {
	            return;
	        }
	    }
	    let tagElement = document.createElement("span");
	    tagElement.classList.add("badge", "badge-primary", "mx-1", "tag");
	    tagElement.textContent = keyword;
	    let deleteButton = document.createElement("button");
	    deleteButton.classList.add("btn", "btn-link", "p-0", "m-0");
	    deleteButton.innerHTML = "&times;";
	    deleteButton.addEventListener("click", function() {
	        tagElement.remove();
	    });
	    tagElement.appendChild(deleteButton);
	    document.querySelector("#" + containerId).appendChild(tagElement);
	    tagElements = document.querySelectorAll("#" + containerId + " .tag");
	    for (i = 0; i < tagElements.length; i++) {
	        tagElements[i].style.marginRight = "5px";
	    }
	    inputElement.value = "";
	}
	function noticeCtl(){
		document.getElementsByClassName('messagebackground notice')[0].style.display = 'block';
	}
	const getCookie = (name) => {
	    const value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    return value ? value[2] : null;
	}
	const noticeClose = () => {
		document.querySelector('#wow').style.display = 'none';
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
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var banner1 = document
									.getElementsByClassName("carouselExampleCaptions")[0];
							var banner2 = document
									.getElementsByClassName("carouselExampleCaptions")[1];

							banner1
									.addEventListener(
											"slid.bs.carousel",
											function() {
												const item = document
														.getElementsByClassName('carousel-item a');
												for (let i = 0; i < item.length; i++) {
													if (item[i]
															.getAttribute('class') == 'carousel-item a active') {
														if (i == 0) {
															document
																	.getElementById('carouseltxt').innerText = '분실물명 : \n지갑';
															document
																	.getElementById('carouseldtxt').innerText = '분실지역 : 인천\n분실장소 : 버스\n분실날짜 : 2023-02-02\n색상 : 빨강';
														} else if (i == 1) {
															document
																	.getElementById('carouseltxt').innerText = '분실물명 : \n수건';
															document
																	.getElementById('carouseldtxt').innerText = '분실지역 : 서울\n분실장소 : 지하철\n분실날짜 : 2023-02-02\n색상 : 초록';
														} else if (i == 2) {
															document
																	.getElementById('carouseltxt').innerText = '분실물명 : 시계';
															document
																	.getElementById('carouseldtxt').innerText = '분실지역 : 부산\n분실장소 : 노상\n분실날짜 : 2023-02-02\n색상 : 검은색';
														}

													}
												}

											});
							banner2
									.addEventListener(
											"slid.bs.carousel",
											function() {
												const item = document
														.getElementsByClassName('carousel-item b');
												for (let i = 0; i < item.length; i++) {
													if (item[i]
															.getAttribute('class') == 'carousel-item b active') {
														if (i == 0) {
															document
																	.getElementById('carouseltxt2').innerText = '습득물명 : 지갑';
															document
																	.getElementById('carouseldtxt2').innerText = '습득지역 : 인천\n습득장소 : 버스\n습득날짜 : 2023-02-02\n색상 : 빨강';
														} else if (i == 1) {
															document
																	.getElementById('carouseltxt2').innerText = '습득물명 : 수건';
															document
																	.getElementById('carouseldtxt2').innerText = '습득지역 : 서울\n습득장소 : 지하철\n습득날짜 : 2023-02-02\n색상 : 초록';
														} else if (i == 2) {
															document
																	.getElementById('carouseltxt2').innerText = '습득물명 : 시계';
															document
																	.getElementById('carouseldtxt2').innerText = '습득지역 : 부산\n습득장소 : 노상\n습득날짜 : 2023-02-02\n색상 : 검은색';
														}

													}
												}

											});
						});
		
		function kakaoPostCodeAPI() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		           document.getElementById('regfounddep').value =  data.roadAddress
		           document.getElementById('regfounddep').focus();
		        }
		    }).open();
		}
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

		 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
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