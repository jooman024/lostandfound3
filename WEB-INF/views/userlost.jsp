<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - Lost</title>
<script src="resources/js/common.js" charset="UTF-8"></script>
<link href="resources/css/user.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap4.min.js"></script>
<script src="resources/js/datatables-demo.js"></script>
<!-- KaKao Map Api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7810961bb19f4af441b113056021427&libraries=services"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<style>
		::-webkit-scrollbar {
    width: 0px;
    height: 0px;
    background-color: transparent;
}
.search-wrapper {
    overflow-x: scroll;
    -webkit-overflow-scrolling: touch;
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
<body onLoad="pageOnLoad('')">
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
			style="width: 10vw; height: 60vw; position: absolute; display: none; z-index: 1; cursor: pointer;">
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
			style="width: 10vw; height: 60vw; position: absolute; right: 0;display: none; z-index: 1; cursor: pointer;">
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
		<div id="lost" style="margin: 2%; height: auto; display: block">
			<div
				style="display: flex; justify-content: space-between; align-items: center;">
				<h1 style="width: 55%;">
					<div id="lftitle" style="width: 50%; margin-bottom: 5%;">분실물
						목록</div>
				</h1>
			</div>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3" style="position: relative;">
  <div class="col-2 col-md-12 col-md-6" style="display:flex; align-items: center;">
    <label style="position:relative; left:0;">
      <select name="dataTable_length" id="sortselect" aria-controls="dataTable" onclick="selectHandler.action(this)" onblur="selectHandler.blur()" class="custom-select custom-select-sm form-control form-control-sm">
        <option value="1">날짜순</option>
        <option value="2">제목순</option>
        <option value="3">장소순</option>
      </select> 
      <div id="arrow" style="position: absolute; top: 50%; transform: translateY(-50%); left: 100%; margin-left: 0.5vw;">↑</div>
    </label>
    <div style="position:absolute; right:1vw;">
      <img onClick="searchDetailCtl(2)" class="img-profile rounded-circle" id="detailsearchimg" src="resources/images/menu/detailsearch.png" style="width: 2.5vw; height: 2.5vw; cursor:pointer;">
      <img onClick="imgSearchCtl(1)" class="img-profile rounded-circle" id="imgserarchimg" src="resources/images/menu/imgsearch.png" style="width: 2.5vw; height: 2.5vw; cursor:pointer;">
    </div>
</div>

</div>
				<div class="card-body">
					<div id="dataTable_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="dataTables_length" id="dataTable_length">
									<label>Show <select name="dataTable_length"
										id="entriesselect" aria-controls="dataTable"
										onChange="pageClick(1,1)"
										class="custom-select custom-select-sm form-control form-control-sm"><option
												value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option></select> entries
									</label>
								</div>
							</div>
							<!--  <div class="col-sm-12 col-md-6">
								<div id="dataTable_filter" class="dataTables_filter">
									<label>Search:<input type="search"
										class="form-control form-control-sm" placeholder=""
										aria-controls="dataTable"></label>
								</div>
							</div>-->
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>분실 날짜</th>
									<th>분실 제목</th>
									<th>분실 장소</th>
								</tr>
							</thead>

							<tbody id="losttbody" style="cursor: pointer">

							</tbody>
						</table>
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="dataTable_info" role="status"
									aria-live="polite"></div>
							</div>
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTable_paginate">
									<ul class="pagination" style="float: right;">
										<li class="paginate_button page-item previous"
											id="dataTable_previous"><a onClick="panigCtl(0)"
											aria-controls="dataTable" data-dt-idx="0" tabindex="0"
											class="page-link">Previous</a></li>
										<div id="panigdiv"></div>
										<li class="paginate_button page-item next" id="dataTable_next"><a
											onClick="panigCtl(1)" aria-controls="dataTable"
											data-dt-idx="3" tabindex="0" class="page-link">Next</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
							onClick="noticeCtl(2)">분실물 처리절차</button>
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
				<div style="width: 40%;">
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
							onClick="noticeCtl(3)">습득물 처리절차</button>
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
			<div class="messagebackground b" style="display: none; z-index:10;">
				<div class="map_wrap">
					<div id="roadview" style="width: 100%; height: 100%;"></div>
					<button class="btn btn-primary" onClick="mapsearch(0)">지도보기</button>
					<button class="btn btn-primary" onClick="mapsearch(2)">닫기</button>
				</div>
			</div>
		<div class="messagebackground imagesearch" style="display: none">
			<div
				style="display: flex; justify-content: center; align-items: center; height: 100vh;">
				<div
					style="display: flex; flex-direction: column; align-items: center; max-width: 60vw;">
					<div id="drop_zone"
						style="height: 20vw; display: flex; justify-content: center; align-items: center; max-width: 100%;">
						<svg xmlns="http://www.w3.org/2000/svg"
							class="d-block user-select-none"
							aria-label="Placeholder: Image cap" focusable="false" role="img"
							preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
							style="font-size: 1.125rem; text-anchor: middle; height: 100%;">
        <rect width="100%" height="100%" fill="#868e96"></rect>
        <text x="50%" y="50%" fill="#dee2e6" dy=".3em"
								style="font-size: 0.5vw;">여기로 이미지를 드래그하거나 파일을 업로드 하세요.</text>
      </svg>
					</div>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary"
							onClick="imgSearchCtl(2)">이미지 첨부</button>
						<button type="button" class="btn btn-primary"
							onClick="imgSearchCtl(3)">이미지 검색</button>
						<button type="button" class="btn btn-primary"
							onClick="imgSearchCtl(0)">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="messagebackground search" style="z-index: 2; display: block">
			<div
				style="background-color: #ffffff; border-radius: 2vw; width: 50vw; text-align: center; position: relative; left: 25vw; top: 2vw;">
				<h5>분류명 선택</h5>
				<div id="noticebody" style="height: 45vw">
					<section class="about-cards-section">
						<div class="container">
							<div class="row">
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%; ">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/searchbag.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(0,'BA')">가방</a> <a
											class="categorydetail" onClick="aCtl(1,'BA0')">여성용가방</a> <a
											class="categorydetail" onClick="aCtl(2,'BA1')">남성용가방</a> <a
											class="categorydetail" onClick="aCtl(3,'BA2')">기타가방</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/gem.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(4,'OR')">귀금속</a> 
										<a class="categorydetail" onClick="aCtl(5,'OR0')">반지</a> 
										<a class="categorydetail" onClick="aCtl(6,'OR1')">목걸이</a> 
										<a class="categorydetail" onClick="aCtl(7,'OR2')">귀걸이</a> 
										<a class="categorydetail" onClick="aCtl(8,'OR3')">시계</a> 
										<a class="categorydetail" onClick="aCtl(9,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/book.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(10,'BO')">도서용품</a> <a
											class="categorydetail" onClick="aCtl(11,'BO0')">학습서적</a> <a
											class="categorydetail" onClick="aCtl(12,'BO1')">소설</a> <a
											class="categorydetail" onClick="aCtl(13,'BO2')">컴퓨터서적</a> <a
											class="categorydetail" onClick="aCtl(14,'BO3')">만화책</a> <a
											class="categorydetail" onClick="aCtl(15,'BO4')">기타서적</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/document.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(16,'DO')">서류</a> <a
											class="categorydetail" onClick="aCtl(17,'DO0')">서류</a> <a
											class="categorydetail" onClick="aCtl(18,'ET4')">기타물품</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/hammer.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(19,'IY')">산업용품</a> <a
											class="categorydetail" onClick="aCtl(20,'ET4')">기타물품</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/shoppingbag.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(21,'SH')">쇼핑백</a> <a
											class="categorydetail" onClick="aCtl(22,'SH0')">쇼핑백</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/sports.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(23,'SP')">스포츠용품</a> <a
											class="categorydetail" onClick="aCtl(24,'SP0')">스포츠용품</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/violin.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(25,'IN')">악기</a> <a
											class="categorydetail" onClick="aCtl(26,'IN0')">건반악기</a> <a
											class="categorydetail" onClick="aCtl(27,'IN1')">관악기</a> <a
											class="categorydetail" onClick="aCtl(28,'IN2')">타악기</a> <a
											class="categorydetail" onClick="aCtl(29,'IN3')">현악기</a> <a
											class="categorydetail" onClick="aCtl(30,'IN4')">기타악기</a>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/stocks.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(31,'ST')">유가증권</a> <a
											class="categorydetail" onClick="aCtl(32,'ST0')">어음</a><a
											class="categorydetail" onClick="aCtl(33,'ST1')">상품권</a> <a
											class="categorydetail" onClick="aCtl(34,'ST2')">채권</a> <a
											class="categorydetail" onClick="aCtl(35,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/clothing.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(36,'CL')">의류</a> <a
											class="categorydetail" onClick="aCtl(37,'CL0')">여성의류</a> <a
											class="categorydetail" onClick="aCtl(38,'CL1')">남성의류</a> <a
											class="categorydetail" onClick="aCtl(39,'CL2')">아기의류</a> <a
											class="categorydetail" onClick="aCtl(40,'CL3')">모자</a> <a
											class="categorydetail" onClick="aCtl(41,'CL4')">신발</a> <a
											class="categorydetail" onClick="aCtl(42,'CL5')">기타의류</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/car.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(43,'CA')">자동차</a> <a
											class="categorydetail" onClick="aCtl(44,'CA0')">자동차열쇠</a> <a
											class="categorydetail" onClick="aCtl(45,'CA1')">네비게이션</a> <a
											class="categorydetail" onClick="aCtl(46,'CA2')">자동차번호판</a> <a
											class="categorydetail" onClick="aCtl(47,'CA3')">임시번호판</a> <a
											class="categorydetail" onClick="aCtl(48,'ET5')">기타용품</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/Electronics.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(49,'EL')">전자기기</a> <a
											class="categorydetail" onClick="aCtl(50,'EL0')">태블릿</a> <a
											class="categorydetail" onClick="aCtl(51,'EL1')">스마트워치</a> <a
											class="categorydetail" onClick="aCtl(52,'EL2')">무선이어폰</a> <a
											class="categorydetail" onClick="aCtl(53,'EL3')">카메라</a> <a
											class="categorydetail" onClick="aCtl(54,'ET5')">기타용품</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/wallet.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(55,'WA')">지갑</a> <a
											class="categorydetail" onClick="aCtl(56,'WA0')">여성용 지갑</a> <a
											class="categorydetail" onClick="aCtl(57,'WA1')">남성용 지갑</a> <a
											class="categorydetail" onClick="aCtl(58,'WA2')">기타 지갑</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/pass.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(59,'CE')">증명서</a> <a
											class="categorydetail" onClick="aCtl(60,'CE0')">신분증</a> <a
											class="categorydetail" onClick="aCtl(61,'CE1')">면허증</a> <a
											class="categorydetail" onClick="aCtl(62,'CE2')">여권</a> <a
											class="categorydetail" onClick="aCtl(63,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/computer.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(64,'CO')">컴퓨터</a> <a
											class="categorydetail" onClick="aCtl(65,'CO0')">삼성노트북</a> <a
											class="categorydetail" onClick="aCtl(66,'CO1')">LG노트북</a> <a
											class="categorydetail" onClick="aCtl(67,'CO2')">애플노트북</a> <a
											class="categorydetail" onClick="aCtl(68,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/card.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(69,'CR')">카드</a> <a
											class="categorydetail" onClick="aCtl(70,'CR0')">신용 체크카드</a> <a
											class="categorydetail" onClick="aCtl(71,'CR1')">일반카드</a> <a
											class="categorydetail" onClick="aCtl(72,'CR2')">기타카드</a>
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/banknotes.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(73,'CS')">현금</a> <a
											class="categorydetail" onClick="aCtl(74,'CS0')">현금</a> <a
											class="categorydetail" onClick="aCtl(75,'CS1')">수표</a> <a
											class="categorydetail" onClick="aCtl(76,'CS2')">외화</a> <a
											class="categorydetail" onClick="aCtl(77,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/smartphone.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(78,'SM')">휴대폰</a> <a
											class="categorydetail" onClick="aCtl(79,'SM0')">삼성휴대폰</a> <a
											class="categorydetail" onClick="aCtl(80,'SM1')">LG휴대폰</a> <a
											class="categorydetail" onClick="aCtl(81,'SM2')">아이폰</a> <a
											class="categorydetail" onClick="aCtl(82,'SM3')">기타휴대폰</a> <a
											class="categorydetail" onClick="aCtl(83,'SM4')">기타통신기기</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/andsoon.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(84,'ET')">기타물품</a> <a
											class="categorydetail" onClick="aCtl(85,'ET0')">안경</a> <a
											class="categorydetail" onClick="aCtl(86,'ET1')">선글라스</a> <a
											class="categorydetail" onClick="aCtl(87,'ET2')">매장문화재</a> <a
											class="categorydetail" onClick="aCtl(88,'ET3')">기타</a>
									</div>
								</div>
								<div class="col-2 col-md-1 search-wrapper"
									style="width: 12.499999995%">
									<div class="card border-0">
										<div
											class="position-relative overflow-hidden mx-auto custom-search-image" style="max-width: 100%;">
											<img class="w-100 h-100"
												src="resources/images/searchmenu/left.png"
												alt="Card image cap" onClick="itemStyleChanged(1)">
										</div>
										<a class="categorydetail" onClick="aCtl(89,'LE')">유류품</a> <a
											class="categorydetail" onClick="aCtl(90,'LE0')">유류품</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2" for="readOnlyInput">대분류명
										</label> <input class="form-control-sm-4" id="mcategoryname"
											type="text" placeholder="Readonly input here..." readonly=""
											style="width: 70%">
											<input type="hidden" id="mcategorycode" value="">
									</div>
								</div>
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2" for="readOnlyInput">중분류명
										</label> <input class="form-control-sm-4" id="scategoryname"
											type="text" placeholder="Readonly input here..." readonly=""
											style="width: 70%">
											<input type="hidden" id="scategorycode" value="">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2">기간 </label> <input type="date"
											class="datepicker sm-2"
											style="width: 35%; margin-left: 0.3vw; margin-right: 0.3vw;">
										<input type="date" class="datepicker sm-2" style="width: 35%">

									</div>
								</div>
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2">분실물명 </label> <input
											class="form-control-sm-4" id="slaname" type="text"
											placeholder="" style="width: 70%">
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2">분실장소 </label> <input
											class="form-control-sm-4" id="splace" type="text"
											placeholder="" style="width: 70%">
									</div>
								</div>
								<div class="col-12 col-md-6 search2-wrapper">
									<div class="form-group">
										<label class="form-label-sm-2">분실지역 </label> <select class="losel" name="location">
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
								</div>
							</div>
						</div>
					</section>
				</div>
				<button type="button" class="btn btn-secondary"
					onClick="searchDetailCtl(1)">검색</button>
				<button type="button" class="btn btn-secondary"
					onClick="searchDetailCtl(0)">닫기</button>
			</div>
		</div>
		<div id="wow" class="messagebackground notice modal" tabindex="-1" style="display: none;">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">안내문</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onClick="noticeClose()"></button>
					</div>
					<div class="modal-body" id="noticebody"><h2>분실물 처리 절차</h2>
			<br> ＊Lost and Found에서는 분실물 처리 글 센터를 운영하고 있습니다. <br>
			<br> Lost and Found에서는 <br>
			<br> 1. 경찰청의 최근 6개월과 서울시의 최근 1주일 연계된 데이터를 받아옵니다. <br>
			2.분실자는 Lost and Found의 분실 신고 글 등록을 통해 분실물의 정보를 입력합니다. <br>
			3.분실물 신고가 접수되고 경찰청과 서울시의 습득물 데이터를 분실자가 분실물을 검색 시 대조합니다. <br>
			4.분실물에 대한 전체 게시글이 표시됩니다. <br> 5.분실자는 상세페이지의 정보를 통하여 분실한
			물건의 정보를 제공받습니다. <br> 6.분실자는 관할서의 문의전화 또는 내방을 통하여 분실물을 습득하실
			수 있습니다. <br> Lost and Found에서는 분실처리 물품을 공공기관의 정보와 서비스를 동원해
			찾으실 수 있도록 최선의 노력을 다하겠습니다. 상담이 필요하시다면 언제든지 문의 글에 문의해주세요. <br>
			<br> 2.경찰청 홈페이지 분실 처리 절차 - Lost112 경찰청 홈페이지에 접속
			<a href="https://www.lost112.go.kr/index.do" target="_blank">https://www.lost112.go.kr/index.do</a> <br>
			- 회원가입 후 로그인 or 로그인 <br>
			-유실물 종합안내 <br>
			-분실물 처리절차 조회</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onClick="closeModalOneday()">Close</button>
					</div>
				</div>
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
		<div class="messagebackground loading" style="display: none">
		</div>
		<!-- Modal End -->
	</div>
	<script type="text/javascript">
	let serverData=${items};
	let bannerData=null;
	let status=1;
	let current=Math.floor(serverData.pageNo/serverData.rowNum);
	detailNo=null;
	window.addEventListener('scroll', function() {
		  updateCarouselPosition();
		});
	serverCallByFetchAjax('', '/Api/getMgrsCate', 'post', 'addMgrsCate');
	function addMgrsCate(jsonData){
		console.log(jsonData);
		let ctdel=document.getElementsByClassName('categorydetail');
		for(let i=0; i<ctdel.length;i++){
			
			for(let j=0; j<jsonData.subCategoryList.length;j++){
				const ctdelstr=ctdel[i].getAttribute('onclick');
				if(ctdelstr.substring(ctdelstr.indexOf("'") + 1, ctdelstr.lastIndexOf("'")
						)==jsonData.subCategoryList[j].ucmcCode)
				{
					const insposition = 
						parseInt(ctdel[i].parentNode.
								lastChild.previousSibling.getAttribute('onclick').split(",")[0].split("(")[1]);
					let a = document.createElement("a");
					a.className = "categorydetail";
					a.innerHTML = jsonData.subCategoryList[j].ucName;
					a.setAttribute("onClick", "aCtl("+insposition+",'"+jsonData.subCategoryList[j].ucCode+"')");
					
					let cnt=1;
					for(let k=insposition; k<ctdel.length;k++){
						ctdel[k].setAttribute(
						"onClick", "aCtl("+(insposition+cnt++)+",'"+
						ctdel[k].
						getAttribute('onclick').split(",'")[1].split("'")[0]
								+"')"		
						)
					}
					ctdel[i].parentNode.insertBefore
					(a, ctdel[i].parentNode.lastChild.previousSibling);
					
				}
			}
		}
	}
	function aCtl(){
		if(arguments[1].length==2){
			document.getElementById('mcategoryname').value=document
			.getElementsByClassName('categorydetail')[arguments[0]].innerText;
			document.getElementById('mcategorycode').value=arguments[1];
		}else{
			document.getElementById('scategoryname').value=document
			.getElementsByClassName('categorydetail')[arguments[0]].innerText;
			document.getElementById('scategorycode').value=arguments[1];
		}
	}
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
			if(document.getElementById("lost").style.display == 'block'){
				document.getElementById("lost").style.display = 'none';
				status=1;			
			}
			if(document.getElementById("lostdetail").style.display =='block'){
				document.getElementById("lostdetail").style.display = 'none';
				status=2;
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
			document.getElementById("faOrgId").innerText += bannerData.balist[dno].faMmId;
			
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
				document.getElementById("lost").style.display = 'block';
			else if(status==2)
				document.getElementById("lostdetail").style.display = 'block';
			
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
			document.getElementById("lost").style.display = 'none';
			document.getElementById("lostdetail").style.display = 'none';
			
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
			document.getElementById("lost").style.display = 'block';
			document.getElementById("lostdetail").style.display = 'none';
			
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
			document.getElementsByClassName('foundcontents').innerText='';
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
	function moveDetail() {
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
			document.getElementById("banner").style.display = 'block';
			document.getElementById("banner2").style.display = 'block';
			document.getElementById("lostdetail").style.display = 'block';
			document.getElementById("lost").style.display = 'none';
			
			if(serverData.lalist[dno].member.mmSns=='AG')
				document.getElementById("laPostId").innerText += serverData.lalist[dno].laMmId;
			else
				document.getElementById("laPostId").innerText += serverData.lalist[dno].laMmId.substring(0,3)+'***';
			document.getElementById("laCtNumber").innerText += arguments[0];
			document.getElementById("laName").innerText += serverData.lalist[dno].laName;
			document.getElementById("laPlace").innerText += serverData.lalist[dno].laPlace;
			document.getElementById("laStatus").innerText += serverData.lalist[dno].laStatus;
			document.getElementById("laDate").innerText += serverData.lalist[dno].laDate;
			if(serverData.lalist[dno].member.mmSns=='AG')
				document.getElementById("laOrgId").innerText += serverData.lalist[dno].laMmId;
			else
				document.getElementById("laOrgId").innerText += serverData.lalist[dno].laMmId.substring(0,3)+'***';
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
			document.getElementById("banner").style.display = 'none';
			document.getElementById("banner2").style.display = 'none';
			document.getElementById("lostdetail").style.display = 'none';
			document.getElementById("lost").style.display = 'block';
			
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
			if(serverData.lalist[dno].member.mmSns=='AG'){
				document.getElementById("laOrName").innerText = '기관 명 : ';
				document.getElementById("laOrTel").innerText ='기관 전화번호 : ';
			}else{
				document.getElementById("laOrName").innerText = '닉네임 : ';
				document.getElementById("laOrTel").innerText ='전화번호 : ';
			}
			
			document.getElementsByClassName("noimg")[0].style.display="none";
			document.getElementsByClassName("yesimg")[0].style.display="none";
			document.getElementById('lostcontents').innerText='';
		}
	}
	function panigCtl(){
		let pagebyrow=Math.floor(serverData.totalPageNo/10)+((serverData.totalPageNo%10==0)?0:1);
		if(arguments[0]==0){
			if(current>0){
				for(let i=0; i<pagebyrow;i++)
					document.getElementById("pagediv"+i).setAttribute("style","display:none");
				document.getElementById("pagediv"+(current-1)).setAttribute("style","display:flex");
				current--;
			}
		}else if(arguments[0]==1){
			if(current<pagebyrow-1){
				for(let i=0; i<pagebyrow;i++)
					document.getElementById("pagediv"+i).setAttribute("style","display:none");
				document.getElementById("pagediv"+(current+1)).setAttribute("style","display:flex");
				current++;
			}
		}else{
			for(let i=0; i<pagebyrow;i++)
				document.getElementById("pagediv"+i).setAttribute("style","display:none");
			document.getElementById("pagediv"+(current)).setAttribute("style","display:flex");
		}
	}
	function tbodyReplace(){
		if(serverData.pageType=='I'){
			LoadingSpinner(0);
		}
		let tbody=document.getElementById("losttbody");
		tbody.innerHTML='';
		for(let i=0; i<serverData.lalist.length; i++){
			const tr=document.createElement("tr");
			tr.setAttribute("onclick","moveDetail('"+serverData.lalist[i].laCtNumber+"')");
			if(serverData.lalist[i].laImgList != ''){
				tr.setAttribute("style","color:#337AB7");
			}	
			for(key in serverData.lalist[i]) {
			    if(key == 'laName'){
			    	const td=document.createElement("td");
			    	td.append(serverData.lalist[i].laName);
			    	tr.append(td);
			    }else if(key == 'laDate'){
			    	const td=document.createElement("td");
			    	td.append(serverData.lalist[i].laDate);
			    	td.setAttribute("tabindex",1);
			    	tr.prepend(td);
			    }else if(key == 'laPlace'){
			    	const td=document.createElement("td");
			    	td.append(serverData.lalist[i].laPlace);
			    	tr.append(td);
			    }
			}
			tbody.appendChild(tr);
		}	
		let list=document.getElementById("panigdiv");
		list.innerHTML='';
		for(let i=1; i<=serverData.totalPageNo ; i++){
			if((i-1)%10==0){
				const div=document.createElement("div");
				div.setAttribute("id","pagediv"+Math.floor((i-1)/10));
				if(i-1<10)
					div.setAttribute("style","display:flex");
				else
					div.setAttribute("style","display:none");
				const atag=document.createElement("a");
				atag.setAttribute("class","page-link");
				atag.setAttribute("onClick","pageClick("+i+")");
				atag.innerText=i;
				div.append(atag);
				list.append(div);
			}else{
				const atag=document.createElement("a");
				atag.setAttribute("class","page-link");
				atag.setAttribute("onClick","pageClick("+i+")");
				atag.innerText=i;
				document.getElementById("pagediv"+Math.floor((i-1)/10)).appendChild(atag);
			}
			
		}
		document.getElementById("dataTable_info").innerText=serverData.totalPageNo+"총 페이지 중"+serverData.pageNo+"페이지";
		document.getElementById("arrow").innerText=(serverData.sortInfo.asc)?'↑':'↓';
		panigCtl();
	}
	function pageOnLoad(){
		if(serverData != ''){
			tbodyReplace();
			serverCallByFetchAjax('', '/Api/getBannerData', 'post', 'bannerCallBack');
		}
	}
	let isselect=false;
	function pageClick(){
		let formData = new FormData();
		formData.set("pageNo",arguments[0]);
		formData.set("rowNum",serverData.rowNum);
		if(arguments[1] == 1){
			const select = document.getElementById("entriesselect");
			formData.set("rowNum",select[select.selectedIndex].value);
		}
		const select = document.getElementById("sortselect");
		formData.set("sortInfo.sortNum",select[select.selectedIndex].value);
		if(isselect) {formData.set("sortInfo.asc",!serverData.sortInfo.asc);isselect=false;}
		else formData.set("sortInfo.asc",serverData.sortInfo.asc);
		
		formData.set("totalCount",serverData.totalCount);
		formData.set("totalPageNo",serverData.totalPageNo);
		formData.set("pageType",serverData.pageType);
		if(serverData.pageType=='T')
			serverCallByFetchAjax(formData, '/Api/getUserLostByPageNo', 'post', 'pageCallBack');
		else if(serverData.pageType=='S')
		{
			if(serverData.sinfo.mcCode!=null)
				formData.set("sInfo.mcCode",serverData.sinfo.mcCode);
			if(serverData.sinfo.ucCode!=null)
				formData.set("sInfo.ucCode",serverData.sinfo.ucCode);
			if(serverData.sinfo.place != null)
				formData.set("sInfo.place",serverData.sinfo.place);
			if(serverData.sinfo.location != null)
				formData.set("sInfo.location",serverData.sinfo.location);
			if(serverData.sinfo.name != null) 
				formData.set("sInfo.name",serverData.sinfo.name);
			if(serverData.sinfo.sdate != null)
				formData.set("sInfo.sDate",serverData.sinfo.sdate);
			if(serverData.sinfo.edate != null)
				formData.set("sInfo.eDate",serverData.sinfo.edate);
			serverCallByFetchAjax(formData, '/Api/getLostDetailSearch', 'post', 'pageCallBack');			
		}else if(serverData.pageType=='I')
		{
			if(serverData.isInfo.imageCate != null)
				formData.set("isInfo.imageCate",serverData.isInfo.imageCate);
			if(serverData.isInfo.imageColorCate != null)
				formData.set("isInfo.imageColorCate",serverData.isInfo.imageColorCate);
			if(serverData.isInfo.keyword != null && serverData.isInfo.keyword != '')
				formData.set("isInfo.keyword",serverData.isInfo.keyword);
			serverCallByFetchAjax(formData, '/Api/ImageSearchLL', 'post', 'pageCallBack');
		}
	}
	function pageCallBack(jsonData){
		serverData=jsonData;
		if(jsonData!='' && jsonData!='error'){
			current=Math.floor(serverData.pageNo/10)+((serverData.pageNo%10==0)?-1:0);
			tbodyReplace();
		}   
	}
	selectHandler = {
        clickCount : 0,
        action : function(select)
        {
            selectHandler.clickCount++;
            if(selectHandler.clickCount%2 == 0)
            {
                selectedValue = select.options[select.selectedIndex].value;
                selectHandler.check(selectedValue);
            }
        },
        blur : function()
        {
            if(selectHandler.clickCount%2 != 0)
            {
                selectHandler.clickCount--;
            }
        },
        check : function(value)
        {
        	isselect=true;
        	pageClick(1,2);
        }
    }
	function searchDetailCtl(){
		if(arguments[0]==1){
			document.getElementsByClassName('messagebackground search')[0].style.display = 'none';
			let formData = new FormData();
			
			if(document.getElementById('mcategoryname').value!='')
				formData.set("sInfo.mcCode",document.getElementById('mcategorycode').value);
			if(document.getElementById('scategoryname').value!='')
				formData.set("sInfo.ucCode",document.getElementById('scategorycode').value);
			if(document.getElementById('splace').value != '')
				formData.set("sInfo.place",document.getElementById('splace').value);
			if(document.getElementsByClassName("losel")[0].value != '')
				formData.set("sInfo.location",document.getElementsByClassName("losel")[0].value);
			if(document.getElementById('slaname').value != '') 
				formData.set("sInfo.name",document.getElementById('slaname').value);
			if(document.getElementsByClassName('datepicker sm-2')[0].value != '')
				formData.set("sInfo.sDate",document.getElementsByClassName('datepicker sm-2')[0].value);
			if(document.getElementsByClassName('datepicker sm-2')[1].value != '')
				formData.set("sInfo.eDate",document.getElementsByClassName('datepicker sm-2')[1].value);
			
			searchDetailInit();
			serverCallByFetchAjax(formData, '/Api/getLostDetailSearch', 'post', 'pageCallBack');
		}
		else if(arguments[0]==0){
			document.getElementsByClassName('messagebackground search')[0].style.display = 'none';
		}else if(arguments[0]==2){
			document.getElementsByClassName('messagebackground search')[0].style.display = 'block';
		}
	}
	function searchDetailInit(){
		document.getElementById('mcategoryname').value='';
		document.getElementById('mcategorycode').value='';
		document.getElementById('scategoryname').value='';
		document.getElementById('scategorycode').value='';
		document.getElementsByClassName('losel')[0][0].selected=true;
		document.getElementById('splace').value='';
		document.getElementById('slaname').value='';
		document.getElementsByClassName('datepicker sm-2')[0].value='';
		document.getElementsByClassName('datepicker sm-2')[1].value='';
	}
	function lostandfoundMenuChagned() {
		document.getElementById("banner").style.display = 'block';
		document.getElementById("banner2").style.display = 'block';
		document.getElementById("lostdetail").style.display = 'block';
		document.getElementById("lost").style.display = 'none';
	}
	document.addEventListener("DOMContentLoaded", function(){
	    var banner1 = document.getElementsByClassName("carouselExampleCaptions")[0];
	    var banner2 = document.getElementsByClassName("carouselExampleCaptions")[1];
	    
	    banner1.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item a');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item a active'){
	    			if(i==0){
	    				document.getElementById('carouseltxt').innerText='분실물명 : \n지갑';
	    				document.getElementById('carouseldtxt').innerText='분실지역 : 인천\n분실장소 : 버스\n분실날짜 : 2023-02-02\n색상 : 빨강';
	    			}
	    			else if(i==1){
	    				document.getElementById('carouseltxt').innerText='분실물명 : \n수건';
	    				document.getElementById('carouseldtxt').innerText='분실지역 : 서울\n분실장소 : 지하철\n분실날짜 : 2023-02-02\n색상 : 초록';
	    			}
	    			else if(i==2){
	    				document.getElementById('carouseltxt').innerText='분실물명 : 시계';
	    				document.getElementById('carouseldtxt').innerText='분실지역 : 부산\n분실장소 : 노상\n분실날짜 : 2023-02-02\n색상 : 검은색';
	    			}
	    				
	    			
	    		}
	    	}
	       
	    });
	    banner2.addEventListener("slid.bs.carousel", function(){
	    	const item=document.getElementsByClassName('carousel-item b');
	    	for(let i=0; i<item.length; i++){
	    		if(item[i].getAttribute('class') == 'carousel-item b active'){
	    			if(i==0){
	    				document.getElementById('carouseltxt2').innerText='습득물명 : 지갑';
	    				document.getElementById('carouseldtxt2').innerText='습득지역 : 인천\n습득장소 : 버스\n습득날짜 : 2023-02-02\n색상 : 빨강';
	    			}
	    			else if(i==1){
	    				document.getElementById('carouseltxt2').innerText='습득물명 : 수건';
	    				document.getElementById('carouseldtxt2').innerText='습득지역 : 서울\n습득장소 : 지하철\n습득날짜 : 2023-02-02\n색상 : 초록';
	    			}
	    			else if(i==2){
	    				document.getElementById('carouseltxt2').innerText='습득물명 : 시계';
	    				document.getElementById('carouseldtxt2').innerText='습득지역 : 부산\n습득장소 : 노상\n습득날짜 : 2023-02-02\n색상 : 검은색';
	    			}
	    				
	    			
	    		}
	    	}
	       
	    });
	});
		function imgSearchCtl() {
			if (arguments[0] == 0) {
				document.getElementById("drop_zone").innerHTML = "";
				// SVG 태그 추가
				  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
				  svg.setAttribute("xmlns", "http://www.w3.org/2000/svg");
				  svg.setAttribute("class", "d-block user-select-none");
				  svg.setAttribute("aria-label", "Placeholder: Image cap");
				  svg.setAttribute("focusable", "false");
				  svg.setAttribute("role", "img");
				  svg.setAttribute("preserveAspectRatio", "xMidYMid slice");
				  svg.setAttribute("viewBox", "0 0 318 180");
				  svg.setAttribute("style", "font-size: 1.125rem; text-anchor: middle; height: 100%;");

				  const rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
				  rect.setAttribute("width", "100%");
				  rect.setAttribute("height", "100%");
				  rect.setAttribute("fill", "#868e96");

				  const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
				  text.setAttribute("x", "50%");
				  text.setAttribute("y", "50%");
				  text.setAttribute("fill", "#dee2e6");
				  text.setAttribute("dy", ".3em");
				  text.setAttribute("style", "font-size:0.5vw");
				  text.textContent = "여기로 이미지를 드래그하거나 파일을 업로드 하세요.";

				  svg.appendChild(rect);
				  svg.appendChild(text);
				  document.getElementById("drop_zone").appendChild(svg);
				  dropZone.setAttribute('style',"height:20vw;display: flex; justify-content: center; align-items: center; max-width: 100%;");
				  document.getElementsByClassName('messagebackground imagesearch')[0].style.display = 'none';
			} else if (arguments[0] == 1) {
				document.getElementsByClassName('messagebackground imagesearch')[0].style.display = 'block';
			}else if (arguments[0] == 2) { 
				const input = document.createElement("input");
				input.type = "file";
				input.accept = "image/*";
				input.addEventListener("change", function(event) {
				  const file = event.target.files[0];
				  if (file.type.startsWith("image/")) {
					  filetype=file.type;
				    const reader = new FileReader();
				    reader.addEventListener("load", function() {
				      const image = new Image();
				      image.src = reader.result;
				      image.addEventListener("load", function() {
				        dropZone.innerHTML = "";
				        dropZone.appendChild(image);
				        dropZone.setAttribute('style',"height:"+image.height+"px;display: flex; justify-content: center; align-items: center; max-width: 100%;");
				      });
				    });
				    reader.readAsDataURL(file);
				  }
				});
				input.click();
			}else if (arguments[0] == 3) { 
				const image = document.getElementById('drop_zone').querySelector('img');

				if (image) {
				  const canvas = document.createElement('canvas');
				  const ctx = canvas.getContext('2d');
				  if (image.width > 600 || image.height > 600) {
				    canvas.width = 600;
				    canvas.height = 600;
				  } else {
				    canvas.width = image.width;
				    canvas.height = image.height;
				  }
				  ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
				  canvas.toBlob(function(blob) {
				    const formData = new FormData();
				    formData.append("file", blob);
				    console.dir(formData);
				    serverCallByFetchAjax(formData, '/Api/ImageSearchL', 'post', 'pageCallBack');
				    imgSearchCtl(0);
				    LoadingSpinner(1);
				  }, filetype, 0.9);
				}
			}
		}
		function LoadingSpinner(){
			const modal=document.getElementsByClassName('messagebackground loading')[0];
			if(arguments[0]==1){
				const img =document.createElement("img");
				img.setAttribute('src',"resources/images/loading.png");
				img.setAttribute('style',"position:absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);");
				modal.appendChild(img);
				modal.style.display = 'block';
			}else{
				modal.innerHTML='';
				modal.style.display = 'none';			
			}
		}
		let filetype=null;
		const dropZone = document.getElementById("drop_zone");

		dropZone.addEventListener("dragover", function(event) {
		  event.preventDefault();
		});

		dropZone.addEventListener("drop", function(event) {
		  event.preventDefault();

		  const files = event.dataTransfer.files;

		  if (files.length === 1 && files[0].type.startsWith("image")) {
		    const file = files[0];
		    const reader = new FileReader();
		    filetype=file.type;
		    reader.addEventListener("load", function() {
		    	const svgImage = document.querySelector("#drop_zone svg");
		        if (svgImage) {
		          svgImage.parentNode.removeChild(svgImage);
		        }
		      const image = new Image();
		      image.src = reader.result;
		      
		      image.addEventListener("load", function() {
		    	  dropZone.innerHTML = "";
		    	  dropZone.appendChild(image);
		      dropZone.setAttribute('style',"height:"+image.height+"px;display: flex; justify-content: center; align-items: center; max-width: 100%;");
		    	});
		    });
		    reader.readAsDataURL(file);
		  }
		}); 

		function noticeCtl(){
			if(arguments[0]==2)
				document.getElementsByClassName('messagebackground notice')[0].style.display = 'block';
			if(arguments[0]==3)
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