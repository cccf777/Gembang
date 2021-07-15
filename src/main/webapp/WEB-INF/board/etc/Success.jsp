<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<section>
		<div>
			<a href="${root}/main"><video id="video" src="../img/signupvideo/signup.mp4" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
</video></a>		
		</div>
	</section>
</body>
</html>