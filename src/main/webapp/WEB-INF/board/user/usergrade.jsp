<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  	<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="${root}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${root}/assets/img/favicon.png">
  <title>
    Soft UI Dashboard by Creative Tim
  </title>

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

<style>
table {
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body class="g-sidenav-show   bg-gray-100">

	<jsp:include page="/WEB-INF/board/etc/aside.jsp"></jsp:include>
	<main class="main-content mt-1 border-radius-lg">
		<jsp:include page="/WEB-INF/board/etc/nav.jsp"></jsp:include>


		<c:forEach var="ntt"  items="${nt2}">

			<div>${ntt.id }아이디</div>

			<form action="${root}/UsergradeSave" method="post">
				<table border="1">
					<tr>
						<td>
						유저 ${ntt.id} 를 어느등급으로 철퇴를? <br />
						
						<label for="g">게스트</label>
						<input type="radio" name="mrank" id="g" value="G" <c:if test="${ntt.rank eq 'G'}"> checked </c:if>>
						
						<label for="u">유저</label>
						<input type="radio" name="mrank" id="u" value="U" <c:if test="${ntt.rank eq 'U'}"> checked </c:if>>
						
						<label for="a">어드민</label>
						<input type="radio" name="mrank" id="a" value="A" <c:if test="${ntt.rank eq 'A'}"> checked </c:if>>
						
						</td>
					</tr>
					<tr>
						<td>
						<input type="hidden" name="name" value="${ntt.name}">
						<input type="hidden" name="id" value="${ntt.id}">					
							<input type="submit" value="철퇴내리기">
						</td>
					</tr>

				</table>
			</form>
		
		</c:forEach>
	</main>
</body>
</html>