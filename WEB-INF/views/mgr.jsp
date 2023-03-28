<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lost And Found - Dashboard</title>
	<script src="resources/js/common.js" charset="UTF-8"></script>
	<link href="resources/css/mgr.css" rel="stylesheet">
	<script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/Chart.min.js"></script>
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
.nav-tabs .nav-link.active {
	border-radius : 1px solid;
    background-color: #4e73df;
    color: white;
    border-color: #4e73df;
}
.nav-tabs {
    border-radius: 10px;
    overflow: hidden; 
}

.nav-item:first-child .nav-link {
    border-top-left-radius: 10px; 
    border-bottom-left-radius: 10px;
}

.nav-item:last-child .nav-link {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}
    </style>
</head>
<body onLoad="onLoadfunc(0)">
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
				<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<ul class="nav nav-tabs" role="tablist" style="margin-left:1.5vw;">
								<li onClick="onLoadfunc(0)" class="nav-item" role="presentation" style="cursor: pointer;"><a
									class="nav-link a active" data-bs-toggle="tab" 
									aria-selected="false" role="tab" tabindex="0">전체</a></li>
								<li onClick="onLoadfunc(1)" class="nav-item" role="presentation" style="cursor: pointer;"><a
									class="nav-link a" data-bs-toggle="tab" 
									aria-selected="false" role="tab" tabindex="1">일주일</a></li>
								<li onClick="onLoadfunc(2)" class="nav-item" role="presentation" style="cursor: pointer;"><a
									class="nav-link a" data-bs-toggle="tab" 
									aria-selected="false" role="tab" tabindex="2">오늘</a></li>
							</ul>
					</div>
				<div class="container-fluid" id="statistics" style="display: block">
					<!-- Page Heading -->
					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												분실물 게시글 수</div>
											<div id="lostnum" class="h5 mb-0 font-weight-bold text-gray-800">33건</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												습득물 게시글 수</div>
											<div id="foundnum" class="h5 mb-0 font-weight-bold text-gray-800">44
												건</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">코멘트 수
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div id="commentnum" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">222개</div>
												</div>
												<!--  <div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>-->
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												이용 유저 수</div>
											<div id="usernum" class="h5 mb-0 font-weight-bold text-gray-800">50명</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- https://pikon.tistory.com/entry/%EA%B5%AC%EA%B8%80-%EC%95%A0%EB%84%90%EB%A6%AC%ED%8B%B1%EC%8A%A4-%EC%84%B8%EC%85%98-%EC%9D%B4%ED%83%88%EB%A5%A0-%EB%93%B1-%EC%9A%A9%EC%96%B4-%EC%A0%95%EB%A6%AC -->
					</div>

					<!-- Content Row -->

					<div class="row">
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">페이지 방문 기록</h6>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myBarChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">토큰</h6>
									<h6 class="m-0 font-weight-bold text-primary"></h6>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myChart" height="210"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">
						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">브라우저</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="broswerPieChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">SNS</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="snsPieChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- Doughnut Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">방문자</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="noobDoughnutChart"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

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
	<input type="hidden" id="memberinfo" name='${AccessInfo.mmSns}'  />
	<!-- End of Footer -->
	<script>
	let serverData=null;
	let bannerData=null;
	
	let tabParent = document.querySelector('.nav-tabs');
	tabParent.addEventListener('click', function(e) {
	    if (e.target.tagName === 'A') {
	        var siblings = e.target.parentNode.parentNode.querySelectorAll('.nav-item');
	        siblings.forEach(function(sibling) {
	            sibling.querySelector('.nav-link').classList.remove('active');
	        });
	        e.target.classList.add('active');
	    }
	});
	const mmSns=JSON.parse('{"mmSns":\"'+document.getElementById('memberinfo').name+'\"}');
	var ctx5 = document.getElementById("myChart").getContext("2d");
	var myChart = new Chart(ctx5, {
		  type: "bar",
		  data: {
		    labels: [""],
		    datasets: [{
		          label: "리프래시토큰(중복)",
		          backgroundColor: "#1cc88a",
		          data: [50]
		        },{
		      label: "리프래시토큰",
		      backgroundColor: "#4e73df",
		      data: [50]
		    }, {
		      label: "토큰",
		      backgroundColor: "#36b9cc",
		      data: [100]
		    }]
		  },
		  options: {
		    responsive: true,
		    maintainAspectRatio: false,
		    scales: {
		      xAxes: [{
		        stacked: true
		      }],
		      yAxes: [{
		        stacked: true
		      }]
		    }
		  },
		  width: 800,
		  height: 400
		});

	var ctx4 = document.getElementById("noobDoughnutChart");
	var noobDoughnutChart = new Chart(ctx4, {
	  type: 'doughnut',
	  data: {
	    labels: ["신규 유저", "기존 유저"],
	    datasets: [{
	      data: [10, 10],
	      backgroundColor: ['#4e73df', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 10,
	      yPadding: 10,
	      displayColors: false,
	      caretPadding: 10,
	      },
	      legend: {
	      display: true,
	      position: "bottom",
	      labels: {
	      fontColor: "#858796",
	      }
	      },
	      cutoutPercentage: 0,
	      },
	      });
	const bardata = [10, 20, 30, 40, 90];
	const ctx3 = document.getElementById('myBarChart').getContext('2d');

	let myBarChart = new Chart(ctx3, {
	  type: 'bar',
	  data: {
	    labels: ['MGR', 'MGRCATE', 'MGRFOUND', 'MGRLOST', 'MGRPROFILE','MGRCOMMENTS',
	    	'USER', 'USERFOUND', 'USERFOUNDREG', 'USERLOST', 'USERLOSTREG',
	    	'USERMYCOMMENT', 'USERMYFOUND', 'USERMYLOST', 'USERMYPAGE', 'USERSCENTER'
	    	],
	    datasets: [{
	      label: 'Page',
	      data: bardata,
	      backgroundColor: ['#4e73df', '#4e73df', '#4e73df','#4e73df','#4e73df','#4e73df',
	    	  '#1cc88a', '#1cc88a', '#1cc88a','#1cc88a','#1cc88a',
	    	  '#1cc88a', '#1cc88a', '#1cc88a','#1cc88a','#1cc88a'],
	      borderColor: 'black',
	      borderWidth: 1
	    }]
	  },
	  options: {
	    responsive: true,
	    maintainAspectRatio: false,
	    scales: {
	      yAxes: [{
	        ticks: {
	          beginAtZero: true,
	         // max: 50 // y축의 최대값을 50으로 지정
	        }
	      }]
	    }
	  }
	});
	
	var ctx1 = document.getElementById("broswerPieChart");
	var myPieChart1 = new Chart(ctx1, {
	  type: 'pie',
	  data: {
	    labels: ["Edge", "Chrome", "WHALE","OPERA","FIREFOX","DUCKDUCKGO","IE","SAFARI"],
	    datasets: [{
	      data: [10, 10, 10,10,30,451],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','red','orange','purple','yellow','green'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 10,
	      yPadding: 10,
	      displayColors: false,
	      caretPadding: 10,
	      },
	      legend: {
	      display: true,
	      position: "bottom",
	      labels: {
	      fontColor: "#858796",
	      }
	      },
	      cutoutPercentage: 80,
	      },
	      });
	var ctx2 = document.getElementById("snsPieChart");
	var myPieChart2 = new Chart(ctx2, {
	  type: 'pie',
	  data: {
	    labels: ["카카오", "네이버", "구글"],
	    datasets: [{
	      data: [30, 25, 45],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 10,
	      yPadding: 10,
	      displayColors: false,
	      caretPadding: 10,
	      },
	      legend: {
	      display: true,
	      position: "bottom",
	      labels: {
	      fontColor: "#858796",
	      }
	      },
	      cutoutPercentage: 80,
	      },
	      });
	
	</script>
	<script type="text/javascript">
	let statData=null;
	function onLoadfunc(){
		if(arguments[0]==0)
    		serverCallByFetchAjax('', '/Api/getStat', 'post', 'CallBackStat');
		else if(arguments[0]==1)
    		serverCallByFetchAjax('', '/Api/getStatWeek', 'post', 'CallBackStat');
		else if(arguments[0]==2)
    		serverCallByFetchAjax('', '/Api/getStatDay', 'post', 'CallBackStat');
    }
	function CallBackStat(jsonData){
		statData=jsonData;
		updateStat();
		serverCallByFetchAjax('', '/Api/getMainCategory', 'post', 'CallBackFunc');
	}
	function updateStat(){
		myPieChart1.data.datasets[0].data = [statData.stat.edge,statData.stat.chrome,statData.stat.whale,statData.stat.opera,statData.stat.fireFox,statData.stat.duckDuckGo,statData.stat.ie,statData.stat.safari];
		myPieChart2.data.datasets[0].data = [statData.stat.kakaoLogin, statData.stat.naverLogin, statData.stat.googleLogin];
		myBarChart.data.datasets[0].data =[statData.stat.g00,statData.stat.g01,statData.stat.g02,statData.stat.g03,statData.stat.g04,statData.stat.g15,statData.stat.g05,statData.stat.g06,statData.stat.g07,statData.stat.g08,statData.stat.g09,statData.stat.g10,statData.stat.g11,statData.stat.g12,statData.stat.g13,statData.stat.g14];
		noobDoughnutChart.data.datasets[0].data =[statData.stat.noob,statData.stat.returning];
		myChart.data.datasets[0].data[0] =statData.stat.dupRToken;
		myChart.data.datasets[1].data[0] =statData.stat.ndupRToken;
		myChart.data.datasets[2].data[0] =statData.stat.token;
		noobDoughnutChart.update();
		myChart.update();
		myBarChart.update();	
		myPieChart1.update();
		myPieChart2.update();
		document.getElementById('lostnum').innerText=statData.stat.ulTotal+'개';
		document.getElementById('foundnum').innerText=statData.stat.ufTotal+'개';
		document.getElementById('commentnum').innerText=statData.stat.cmTotal+'개';
		document.getElementById('usernum').innerText=statData.stat.mmTotal+'명';
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
	</script>
</body>
