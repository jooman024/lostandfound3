<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - Category Manager</title>
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
<body onLoad="onLoadfunc('${serverData}')">
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
				<!-- Begin Page Content -->
				<div class="container-fluid" id="categorymgr" style="display: block">
					<div
						style="height: 90vh; display: flex; justify-content: space-around; position: relative; top: 30%; background: #1f5b8308;">
						<div class="content" style="width: 100%;">
							<div class="card">
								<div class="card-body" style="position: absolute; width: 100%;">
									<div class="table-responsive">
										<div style="width: 50%; margin-bottom: 5%; font-size: 3vw;">
											카테고리 관리
										</div>
										<button class="btn btn-secondary my-2 my-sm-0" 
												onClick="subcateCtl(1)">추가</button>
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>대분류 코드</th>
													<th>대분류 이름</th>
													<th>중분류 코드</th>
													<th>중분류 이름</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody id="catetbody" style="cursor: pointer">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- Main Content End -->
		</div>
		<!-- Centent Wrapper End -->
		<!-- modal -->
		<div class="messagebackground categroymodal"
			style="display: none; z-index: 10;">
			<div
				style="background-color: #ffffff; border-radius: 2vw; width: 30vw; text-align: center; position: relative; left: 35vw; top: 20vw;">
				<div id="noticebody" style="height: 20vw">
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">중분류명 입력</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="분류명을 입력해주세요" id="subCateAdd" style="width: 100%">
					</div>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary"
							onClick="subcateCtl(1,1)">카테고리 추가</button>
						<button type="button" class="btn btn-primary"
							onClick="subcateCtl(0)">닫기</button>
					</div>

				</div>
			</div>
		</div>
		<div class="messagebackground categroymodal"
			style="display: none; z-index: 10;">
			<div
				style="background-color: #ffffff; border-radius: 2vw; width: 30vw; text-align: center; position: relative; left: 35vw; top: 20vw;">
				<div id="noticebody" style="height: 20vw">
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">중분류명 입력</label> <input
							class="form-control form-control-lg" type="text"
							placeholder="분류명을 입력해주세요" id="subCateMod" style="width: 100%">
					</div>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary"
							onClick="modsub(10)">카테고리 수정</button>
						<button type="button" class="btn btn-primary"
							onClick="modsub(0)">닫기</button>
					</div>

				</div>
			</div>
		</div>
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
	let serverData=null;
	let bannerData=null;
	const mmSns=JSON.parse('{"mmSns":\"'+document.getElementById('memberinfo').name+'\"}');
		let cateData = null;
		let temp=null;
		let temp2=null;
		function onLoadfunc(){
			let formData= new FormData();
			formData.set('subCategoryList[0].ucmcCode',arguments[0]);
	    	serverCallByFetchAjax(formData, '/Api/getSubCategory', 'post', 'CallBackFunc');
	    }
		function subcateCtl() {
			if (arguments[0] == 0) {
				document.getElementsByClassName("messagebackground categroymodal")[0].style.display = 'none';
				document.getElementsByClassName("messagebackground categroymodal")[1].style.display = 'none';
				document.getElementById('subCateAdd').value='';
			} else if (arguments[0] == 1) {
				document.getElementsByClassName("messagebackground categroymodal")[0].style.display = 'block';
				if (arguments[1] == 1) {
					let formData= new FormData();
					formData.set('subCategoryList[0].ucmcCode',cateData.subCategoryList[0].ucmcCode);
					formData.set('subCategoryList[0].ucName',document.getElementById('subCateAdd').value);
					serverCallByFetchAjax(formData, '/Api/addSubCategory', 'post', 'audCallBack');
					document.getElementById('subCateAdd').value='';
					document.getElementsByClassName("messagebackground categroymodal")[0].style.display = 'none';
				} 
			}
		}
		function delCate(){
			let formData= new FormData();
			formData.set('subCategoryList[0].ucmcCode',arguments[0]);
			formData.set('subCategoryList[0].ucCode',arguments[1]);
			serverCallByFetchAjax(formData, '/Api/delSubCategory', 'post', 'audCallBack');
		}
		function modsub(){
			let formData= new FormData();
			document.getElementsByClassName("messagebackground categroymodal")[1].style.display = 'block';
			if(arguments[0]==10){
				formData.set('subCategoryList[0].ucmcCode',temp);
				formData.set('subCategoryList[0].ucCode',temp2);
				formData.set('subCategoryList[0].ucName',document.getElementById('subCateMod').value);
				serverCallByFetchAjax(formData, '/Api/updSubCategory', 'post', 'audCallBack');
				document.getElementsByClassName("messagebackground categroymodal")[1].style.display = 'none';
			}else if(arguments[0]==0){
				document.getElementsByClassName("messagebackground categroymodal")[1].style.display = 'none';
			}else{
				temp=arguments[0];
				temp2=arguments[1];
			}
		}
		function audCallBack(jsonData){
			cateData = jsonData;
			let tbody=document.getElementById("catetbody");
			tbody.innerHTML='';
			const table = $('#dataTable').DataTable();
			table.clear();
			for(let i=0; i<jsonData.subCategoryList.length; i++){
				const data = [
					  	  jsonData.subCategoryList[i].ucmcCode, 
						  jsonData.subCategoryList[i].ucmcName,
						  jsonData.subCategoryList[i].ucCode,
						  jsonData.subCategoryList[i].ucName,
						  '<button class="btn btn-link p-0 m-0">×</button>',
					];
				const row = table.row.add(data).draw().node();
				  const deleteButton = row.querySelector('button');
				  deleteButton.onclick = function() {
					  delCate(jsonData.subCategoryList[i].ucmcCode,jsonData.subCategoryList[i].ucCode);
				  };
				  for (let j = 0; j < data.length - 1; j++) {
				    const column = row.children[j];
				    column.onclick = function() {
				      subcateCtl(2,jsonData.subCategoryList[i].ucCode);
				    };
				  }
			}
		}
	    function CallBackFunc(jsonData){
	    	cateData=jsonData;
	    	for(let i=0; i<jsonData.mainCategoryList.length; i++){
	    		const atag=document.createElement('a');
	    		atag.setAttribute("class","collapse-item");
	    		atag.setAttribute("onClick","moveService(\'MgrCate\',\'"+jsonData.mainCategoryList[i].mcCode+"\')");
	    		atag.innerText=jsonData.mainCategoryList[i].mcName;
	    		document.getElementById('maincate').appendChild(atag);
	    	}
			let tbody=document.getElementById("catetbody");
			tbody.innerHTML='';
			const table = $('#dataTable').DataTable();
			table.clear();
			for(let i=0; i<jsonData.subCategoryList.length; i++){
				const data = [
					  	  jsonData.subCategoryList[i].ucmcCode, 
						  jsonData.subCategoryList[i].ucmcName,
						  jsonData.subCategoryList[i].ucCode,
						  jsonData.subCategoryList[i].ucName,
						  '<button class="btn btn-link p-0 m-0">×</button>',
					];
				const row = table.row.add(data).draw().node();
				  const deleteButton = row.querySelector('button');
				  deleteButton.onclick = function() {
					  delCate(jsonData.subCategoryList[i].ucmcCode,jsonData.subCategoryList[i].ucCode);
				  };
				  for (let j = 0; j < data.length - 1; j++) {
				    const column = row.children[j];
				    column.onclick = function() {
				    	modsub(jsonData.subCategoryList[i].ucmcCode,jsonData.subCategoryList[i].ucCode);
				    };
				  }
			}		
	    }
	</script>
</body>
