<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - Found Manager</title>
	<script src="resources/js/common.js" charset="UTF-8"></script>
	<link href="resources/css/mgr.css" rel="stylesheet">
	<script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
     <script src="resources/js/jquery.dataTables.min.js"></script>
     <script src="resources/js/dataTables.bootstrap4.min.js"></script>
     <script src="resources/js/datatables-demo.js"></script>
     <style>
    	.electricity {
  position: absolute;
   top: 0;
  left: 0;
  width: 80vw;
  height: 1.5vw;
  background-image: url('resources/images/menu/ani.png');
  background-size: cover;
}
    </style>
</head>
<body onLoad="pageOnLoad('')">
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar"
			style="background-color: #2c3e50; background-image: linear-gradient(180deg, #173176 10%, #01162a 100%);">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				onclick="moveService('Mgr')" style="cursor: pointer; z-index: 0;">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Lost &amp; Found</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard 
			<li class="nav-item"><a class="nav-link"
				onClick="moveService('Mgr')" style="cursor: pointer;"> <i
					class="fas fa-fw fa-table"></i> <span style="font-size: 1.5vw;">통계</span></a>
			</li>

			<hr class="sidebar-divider">-->

			<!-- Heading -->
			<div class="sidebar-heading" style="font-size: 1vw;">관리</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span style="font-size: 1.5vw;">글관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" onClick="moveService('MgrLost')">분실물 관리</a>
						<a class="collapse-item" onClick="moveService('MgrFound')">습득물 관리</a>
						<a class="collapse-item" onClick="moveService('MgrComments')">댓글 관리</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span style="font-size: 1.5vw;">카테고리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div id="maincate" class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">카테고리 종류</h6>
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">기타</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				onClick="moveService('MgrProfile')" style="cursor: pointer;"> <i
					class="fas fa-fw fa-cog"></i> <span style="font-size: 1.5vw;">회원
						관리</span></a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" onclick="Logout()"
				style="cursor: pointer;"> <i class="fas fa-fw fa-table"></i> <span
					style="font-size: 1.5vw;">로그아웃</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
		</ul>
		<!-- Sidebar end-->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<div class="electricity"></div>
						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">관리자
									${AccessInfo.mmName}님</span> <img class="img-profile rounded-circle"
								src="resources/images/menu/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" onClick="moveService('MgrProfile')"
									style="cursor: pointer;"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 회원 관리
								</a>  
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" onclick="Logout()" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid" id="foundmanage" style="display: block">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" id="postmanagetitle">습득글 관리</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>습득 날짜</th>
											<th>관리 번호</th>
											<th>등록 Id</th>
											<th>습득 제목</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody id="foundtbody" style="cursor: pointer">
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
				<!-- Begin Page Content -->
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
						<h5 class="card-title" id="faOrName">닉네임 : </h5>
						<h5 class="card-title" id="faOrTel">전화번호 : </h5> 

					</div>
					<div id="yesimg" style="display:none">
					<img src="" class="d-block w-100" alt="...">
					</div>
					<div id="noimg" style="display:none"><svg preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle; height: 100%;">
    
      <rect width="100%" height="100%" fill="#868e96"></rect>
    <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
  </svg></div>
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
					
				</div>
				<div class="card-body">
					<p class="card-text" id="faUnique"></p>
				</div>
				<div class="card-footer bg-light">
						<button type="button" class="btn btn-primary"
							onclick="moveDetail(0)">이전</button>
				</div>
			</div>
		</div>
				<!-- Small Content End -->
			</div>
			<!-- Main Content End -->
		</div>
		<!-- Centent Wrapper End -->

		<!-- modal -->
		<!-- modal end -->
	</div>
	<!-- wrapper end -->
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; LostPortal 2023</span>
			</div>
		</div>
	</footer>
	<input type="hidden" id="memberinfo" name='${AccessInfo.mmSns}'  />
	<!-- End of Footer -->
	<script type="text/javascript">
	const mmSns=JSON.parse('{"mmSns":\"'+document.getElementById('memberinfo').name+'\"}');
	let serverData=null;
	let bannerData=null;
	serverCallByFetchAjax('', '/Api/getMainCategory', 'post', 'CallBackFunc');
    function CallBackFunc(jsonData){
    	for(let i=0; i<jsonData.mainCategoryList.length; i++){
    		const atag=document.createElement('a');
    		atag.setAttribute("class","collapse-item");
    		atag.setAttribute("onClick","moveService(\'MgrCate\',\'"+jsonData.mainCategoryList[i].mcCode+"\')");
    		atag.innerText=jsonData.mainCategoryList[i].mcName;
    		document.getElementById('maincate').appendChild(atag);
    	}
    }
	function pageOnLoad(){
		serverCallByFetchAjax('', '/Api/getMgrFound', 'post', 'pageCallBack');
	}
	function pageCallBack(jsonData){
		serverData=jsonData;
		if(jsonData!='' && jsonData!='error'){
			tbodyReplace();
		}  
	}
	function delFound(){
		let formData = new FormData();
		formData.set("serviceCode","M15");
		formData.set('temp',arguments[0]);
		formData.set('temp2',arguments[1]);
		serverCallByFetchAjax(formData, '/Api/delFound', 'post', 'pageCallBack');
	}
	function tbodyReplace(){
		let tbody=document.getElementById("foundtbody");
		tbody.innerHTML='';
		const table = $('#dataTable').DataTable();
		table.clear();
		for(let i=0; i<serverData.falist.length; i++){
			const data = [
				serverData.falist[i].faDate, 
				serverData.falist[i].faCtNumber,
				serverData.falist[i].faMmId,
				serverData.falist[i].faName,
					  '<button class="btn btn-link p-0 m-0">×</button>'
				];
				const row = table.row.add(data).draw().node();
			  const deleteButton = row.querySelector('button');
			  deleteButton.onclick = function() {
				  delFound(serverData.falist[i].faCtNumber,serverData.falist[i].faDate);
			  };
			  for (let j = 0; j < data.length - 1; j++) {
			    const column = row.children[j];
			    column.onclick = function() {
			      moveDetail(serverData.falist[i].faCtNumber,serverData.falist[i].faDate);
			    };
			  }
		}
	}	
	function moveDetail() {
		let dno=null;
		for(let i=0; i<serverData.falist.length; i++){
			for(key in serverData.falist[i]) {
			    if(serverData.falist[i].faCtNumber == arguments[0]){
			    	dno=i;
			    	break;
			    }
			}
		}
		if(arguments[0]!=0){
			moveDetail(0);
			document.getElementById("founddetail").style.display = 'block';
			document.getElementById("foundmanage").style.display = 'none';
			
			document.getElementById("faPostId").innerText += serverData.falist[dno].faMmId.substring(0,3)+"***";
			document.getElementById("faCtNumber").innerText += arguments[0];
			document.getElementById("faName").innerText += serverData.falist[dno].faName;
			document.getElementById("faPlace").innerText += serverData.falist[dno].faPlace;
			document.getElementById("faStatus").innerText += serverData.falist[dno].faStatus;
			document.getElementById("faDate").innerText += serverData.falist[dno].faDate;
			document.getElementById("faOrgId").innerText += serverData.falist[dno].faMmId;
			
			if(arguments[0][0]=='S')
				document.getElementById("faUnique").innerText += serverData.falist[dno].faUnique.replace(/<br>/g, "\n");
			else
				document.getElementById("faUnique").innerText += serverData.falist[dno].faUnique;
			document.getElementById("faHour").innerText += serverData.falist[dno].faHour+'시';
			document.getElementById("faColor").innerText += serverData.falist[dno].faColor+'색';
			document.getElementById("faDepPlace").innerText += serverData.falist[dno].faDepPlace;
			document.getElementById("faCateCode").innerText += serverData.falist[dno].faMcCode+"<<"+serverData.falist[dno].faUcCode;
			if(serverData.falist[dno].member != null)
				document.getElementById("faOrName").innerText += serverData.falist[dno].member.mmName;
			if(serverData.falist[dno].member != null)
				document.getElementById("faOrTel").innerText += serverData.falist[dno].member.mmPhone;
			
			if(serverData.falist[dno].faImgList != ''){
			    document.getElementById("yesimg").style.display="block";
			    document.getElementById("yesimg").children[0].setAttribute("src", serverData.falist[dno].faImgList[0].fiLoc + '?' + new Date().getTime());
			}else{
			    document.getElementById("noimg").style.display="block";
			}
		}else{
			document.getElementById("founddetail").style.display = 'none';
			document.getElementById("foundmanage").style.display = 'block';
			
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
			document.getElementById("faOrName").innerText = '닉네임 : ';
			document.getElementById("faOrTel").innerText ='전화번호 : ';
			
			document.getElementById("noimg").style.display="none";
			document.getElementById("yesimg").style.display="none";
		}
	}
	
	</script>
</body>
