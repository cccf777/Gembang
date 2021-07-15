<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
            
            <!-- 페이지 표시 -->
            <c:if test="${select==1}">
              Home 
            </c:if>
          	<c:if test="${select==2}">
          		공지사항
          	</c:if>
          	<c:if test="${select==3}">
          		유머게시판
          	</c:if>
          	<c:if test="${select==4}">
          		축구게시판
          	</c:if>
          	<c:if test="${select==5}">
          		영화게시판
          	</c:if>
          	<c:if test="${select==6}">
          		Billing
          	</c:if>
          	<c:if test="${select==7}">
          		profile
          	</c:if>
            
            </li>
          </ol>
          <h6 class="font-weight-bolder mb-0">
         	<c:if test="${select==1}">
              Home
            </c:if>
          	<c:if test="${select==2}">
          		공지사항
          	</c:if>
          	<c:if test="${select==3}">
          		유머게시판
          	</c:if>          	
          	<c:if test="${select==4}">
          		축구게시판
          	</c:if>
          	<c:if test="${select==5}">
          		영화게시판
          	</c:if>
          	<c:if test="${select==6}">
          		Billing
          	</c:if>
          	<c:if test="${select==7}">
          		profile
          	</c:if>
          </h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
          </div>
	
          <ul class="navbar-nav  justify-content-end">
          	<c:if test="${userName==null}">
		      <li class="nav-item d-flex align-items-center">
              <a href="${root}/user/login" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">로그인/</span>
              </a>
            </li>
             <li class="nav-item d-flex align-items-center">
              <a href="${root}/user/SignUp" class="nav-link text-body font-weight-bold px-0">
                <span class="d-sm-inline d-none">회원가입</span>
              </a>
            </li>
			</c:if>
			<c:if test="${userName!=null && userName!='' }">
				<li class="nav-item d-flex align-items-center">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">${userName}/</span>
            </li>
             <li class="nav-item d-flex align-items-center">
              <a href="${root}/user/logout" class="nav-link text-body font-weight-bold px-0">
                <span class="d-sm-inline d-none">로그아웃</span>
              </a>
            </li>
			</c:if>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            <!-- 마이페이지로 넘어가기 -->
            <c:if test="${not empty userID}">
           
            <li class="nav-item px-3 d-flex align-items-center">
            	<form method="post" action="${root}/user/mytables" class="nav-link text-body p-0">
            		<input type="hidden" name="userName" value="${userName}" />
            		<input type="hidden" name="userRank" value="${userRank}" />
					<input type="hidden" name="userID" value="${userID}" />
					<button type="submit" class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></button>
				</form>
            </li>
            </c:if>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${root}/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${root}/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 ">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g id="Basic-Elements" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g id="Rounded-Icons" transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g id="Icons-with-opacity" transform="translate(1716.000000, 291.000000)">
                                <g id="credit-card" transform="translate(453.000000, 454.000000)">
                                  <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" id="Path" opacity="0.593633743"></path>
                                  <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z" id="Shape"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          Payment successfully completed
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          2 days
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
</body>
</html>