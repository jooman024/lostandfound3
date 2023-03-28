<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - Manager Profile</title>
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
}</style>
</head>
<body onLoad="onLoadfunc()">
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
					class="fas fa-fw fa-cog"></i> <span style="font-size: 1.5vw;">매니저
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
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 매니저 관리
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
				<!-- Content Wrapper. Contains page content -->
				<div class="content-wrapper" id="mgrprofile" style="display: block">
					<!-- Content Header (Page header) -->
					<section class="content-header">
						<div class="container-fluid">
							<div class="row mb-2">
								<div class="col-sm-6">
								</div>
								<div class="col-sm-6">
									<ol class="breadcrumb float-sm-right">
										<li class="breadcrumb-item active">Profile</li>
									</ol>
								</div>
							</div>
						</div>
						<!-- /.container-fluid -->
					</section>

					<!-- Main content -->
					<div class="container-fluid" id="foundmanage" style="display: block">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" id="postmanagetitle">매니저 관리</h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>이메일</th>
											<th>전화 번호</th>
											<th>소셜 타입</th>
											<th>메니저 임명</th>
										</tr>
									</thead>
									<tbody id="mgrProfilebody" style="cursor: pointer">
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
					<!-- /.content -->
				</div>
				<!-- Content End -->
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
	<!-- End of Footer -->
	<input type="hidden" id="memberinfo" name='${AccessInfo.mmSns}'  />
	<script type="text/javascript">
	const mmSns=JSON.parse('{"mmSns":\"'+document.getElementById('memberinfo').name+'\"}');
	let serverData=null;
	let bannerData=null;
	function onLoadfunc(){
    	serverCallByFetchAjax('', '/Api/getMainCategory', 'post', 'CallBackFunc');
    	serverCallByFetchAjax('', '/Api/getMgrProfile', 'post', 'pageCallBack');
    }
	function CallBackFunc(jsonData){
    	for(let i=0; i<jsonData.mainCategoryList.length; i++){
    		const atag=document.createElement('a');
    		atag.setAttribute("class","collapse-item");
    		atag.setAttribute("onClick","moveService(\'MgrCate\',\'"+jsonData.mainCategoryList[i].mcCode+"\')");
    		atag.innerText=jsonData.mainCategoryList[i].mcName;
    		document.getElementById('maincate').appendChild(atag);
    	}
    }
    function pageCallBack(jsonData){
		serverData=jsonData;
		if(jsonData!='' && jsonData!='error'){
			tbodyReplace();
		}  
	}
    function updateMgr(){
		let formData = new FormData();
		formData.set("serviceCode","M30");
		formData.set('mmId',arguments[0]);
		formData.set('mmSns',arguments[1]);
		serverCallByFetchAjax(formData, '/Api/updateMgr', 'post', 'pageCallBack');
	}
    function tbodyReplace(){
		let tbody=document.getElementById("mgrProfilebody");
		tbody.innerHTML='';
		const table = $('#dataTable').DataTable();
		table.clear();
		for(let i=0; i<serverData.memberList.length; i++){
			const data = [
				serverData.memberList[i].mmId, 
				serverData.memberList[i].mmName,
				serverData.memberList[i].mmEmail,
				serverData.memberList[i].mmPhone,
				serverData.memberList[i].mmSns,
					  '<button class="btn btn-link p-0 m-0">변환</button>'
				];
				const row = table.row.add(data).draw().node();
			  const updateButton = row.querySelector('button');
			  updateButton.onclick = function() {
				  updateMgr(serverData.memberList[i].mmId, serverData.memberList[i].mmSns);
			  };
		}
	}
	</script>
</body>
