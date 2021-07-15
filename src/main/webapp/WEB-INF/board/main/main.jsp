<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${root}/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${root}/img/favicon.png">
  <title>
    Gem방
  </title>
  	<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${root}/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${root}/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${root}/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${root}/css/soft-ui-dashboard.css?v=1.0.2" rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
  <c:import url="/etc/aside" /> 
  <main class="main-content mt-1 border-radius-lg">
    <!-- Navbar -->
   <c:import url="/etc/nav" />  
    <!-- End Navbar -->
    <div class="container-fluid py-4">
		<div class="row">
			<c:forEach var="cnt" items="${count}" varStatus="status">
				<!-- 게시물 리스트 시작 -->
				<div class="col-xxl-4 col-md-6 col-xs-12 mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-6" >
									<h6>${cnt.boardname}</h6>
									<p class="text-sm mb-0"></p>
								</div>
								<div class="col-lg-6 col-5 my-auto text-end">
									<div class="dropdown float-lg-end pe-4">
										<a href="#여기에 베스트 게시물 주소"> <i
											class="fa fa-ellipsis-v text-secondary"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body pb-0">
							<div class="table-responsive">
								<table class="table align-items-center table-sm">
									<thead>
										<tr>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder">제목</th>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder">작성자</th>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder">추천수</th>
										</tr>
									</thead>

									<!-- foreach item 의 동적처리를 위한 변수 선언 -->
									<c:set var="boardnum" value="board${cnt.boardid}" />
									<!-- requestScope 를 이용한 동적변수 명 받음 -->
									<c:forEach var="board" items="${requestScope[boardnum]}">
									<tbody>
										<tr>
											<td class="text-sm ml-1 col-md-10">
											<c:choose> 
    											<c:when test="${board.boardid eq 1}">  
													<img src="${root}/img/small-logos/notice.svg" class="avatar avatar-sm">
    											</c:when>
    											<c:when test="${board.boardid eq 2}">
													<img src="${root}/img/small-logos/hipchat.svg" class="avatar avatar-sm">
    											</c:when>
    											<c:when test="${board.boardid eq 3}"> 											
													<img src="${root}/img/small-logos/humor.svg" class="avatar avatar-sm">
    											</c:when>
    											<c:when test="${board.boardid eq 4}"> 											
													<img src="${root}/img/small-logos/football.svg" class="avatar avatar-sm">
    											</c:when>
     											<c:when test="${board.boardid eq 5}"> 											
													<img src="${root}/img/small-logos/game.svg" class="avatar avatar-sm">
    											</c:when>
    											<c:when test="${board.boardid eq 6}"> 											
													<img src="${root}/img/small-logos/science.svg" class="avatar avatar-sm">
    											</c:when>     											
    											<c:otherwise>
													<img src="${root}/img/small-logos/game.svg" class="avatar avatar-sm">
    											</c:otherwise>
											</c:choose>
											<span class="text-xs">[${board.titlename}] ${board.title}</span>
											</td>
											<td>
												<div class="text-center text-sm col-md-1">
													<span class="text-xs">${board.writeid}</span>
												</div>
											</td>
											<td class="text-center text-sm col-md-1"><span
												class="text-xs">${board.recommend}</span></td>
										</tr>
									</tbody>
									</c:forEach>
									<!-- 하나의 컨텐츠 끝 -->
								</table>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>	
				<div class="col-xxl-4 col-md-6 col-xs-12 mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-6" >
									<h6>크롤링게시판</h6>
									<p class="text-sm mb-0"></p>
								</div>
								<div class="col-lg-6 col-5 my-auto text-end">
									<div class="dropdown float-lg-end pe-4">
										<a href="#여기에 베스트 게시물 주소"> <i
											class="fa fa-ellipsis-v text-secondary"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body pb-0">
							<div class="table-responsive">
								<table class="table align-items-center table-sm">
									<thead>
										<tr>
											<th class="text-center text-uppercase text-secondary text-xs font-weight-bolder">제목</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="list" items="${list}">
										<tr>
											<td class="text-sm ml-1 col-md-10">
											<img src="${root}/img/small-logos/hipchat.svg" class="avatar avatar-sm">
											<a href="${list.url}" target="_blank"><span class="text-xs">${list.title}</span></a>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 게시물 목록 종료 -->
			</div>
		</div>
		<!-- footer -->
		<footer class="footer pt-3">
			<div class="container-fluid">
				<div class="row align-items-center justify-content-lg-between">
					<div class="col-lg-6 mb-lg-0 mb-4">
						<div class="copyright text-center text-sm text-muted text-lg-left">
							©
							<script>
								document.write(new Date().getFullYear())
							</script>
							, made with <i class="fa fa-heart"></i> by <a
								href="https://www.creative-tim.com" class="font-weight-bold"
								target="_blank">Creative Tim</a> for a better web.
						</div>
					</div>
					<div class="col-lg-6">
						<ul
							class="nav nav-footer justify-content-center justify-content-lg-end">
							<li class="nav-item">
								<a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
							</li>
							<li class="nav-item">
								<a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
							</li>
							<li class="nav-item">
								<a href="http://blog.creative-tim.com" class="nav-link text-muted" target="_blank">Blog</a>
							</li>
							<li class="nav-item">
								<a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</main>
		<!--   Core JS Files   -->
  <script src="${root}/js/core/popper.min.js"></script>
  <script src="${root}/js/core/bootstrap.min.js"></script>
  <script src="${root}/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${root}/js/plugins/chartjs.min.js"></script>
  <script src="${root}/js/plugins/Chart.extension.js"></script>
  <script>
    var ctx = document.getElementById("chart-bars").getContext("2d");

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Sales",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          backgroundColor: "#fff",
          data: [450, 200, 100, 220, 500, 100, 400, 230, 500],
          maxBarThickness: 6
        }, ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false,
        },
        tooltips: {
          enabled: true,
          mode: "index",
          intersect: false,
        },
        scales: {
          yAxes: [{
            gridLines: {
              display: false,
            },
            ticks: {
              suggestedMin: 0,
              suggestedMax: 500,
              beginAtZero: true,
              padding: 0,
              fontSize: 14,
              lineHeight: 3,
              fontColor: "#fff",
              fontStyle: 'normal',
              fontFamily: "Open Sans",
            },
          }, ],
          xAxes: [{
            gridLines: {
              display: false,
            },
            ticks: {
              display: false,
              padding: 20,
            },
          }, ],
        },
      },
    });

    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(203,12,159,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(203,12,159,0)'); //purple colors

    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)'); //purple colors


    new Chart(ctx2, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "Mobile apps",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#cb0c9f",
            borderWidth: 3,
            backgroundColor: gradientStroke1,
            data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
            maxBarThickness: 6

          },
          {
            label: "Websites",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 0,
            borderColor: "#3A416F",
            borderWidth: 3,
            backgroundColor: gradientStroke2,
            data: [30, 90, 40, 140, 290, 290, 340, 230, 400],
            maxBarThickness: 6

          },
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
          display: false,
        },
        tooltips: {
          enabled: true,
          mode: "index",
          intersect: false,
        },
        scales: {
          yAxes: [{
            gridLines: {
              borderDash: [2],
              borderDashOffset: [2],
              color: '#dee2e6',
              zeroLineColor: '#dee2e6',
              zeroLineWidth: 1,
              zeroLineBorderDash: [2],
              drawBorder: false,
            },
            ticks: {
              suggestedMin: 0,
              suggestedMax: 500,
              beginAtZero: true,
              padding: 10,
              fontSize: 11,
              fontColor: '#adb5bd',
              lineHeight: 3,
              fontStyle: 'normal',
              fontFamily: "Open Sans",
            },
          }, ],
          xAxes: [{
            gridLines: {
              zeroLineColor: 'rgba(0,0,0,0)',
              display: false,
            },
            ticks: {
              padding: 10,
              fontSize: 11,
              fontColor: '#adb5bd',
              lineHeight: 3,
              fontStyle: 'normal',
              fontFamily: "Open Sans",
            },
          }, ],
        },
      },
    });
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${root}/js/soft-ui-dashboard.min.js?v=1.0.2"></script>
</body>

</html>