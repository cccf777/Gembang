<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="g-sidenav-show   bg-gray-100">
	<c:import url="/etc/aside" />
	<main class="main-content mt-1 border-radius-lg">
		<c:import url="/etc/nav" />
		<form action="edit" method="post">
			<table border="1">
				<tr>
					<th>게시판 종류</th>
					<td><select name="boardid">
							<c:forEach var="li" items="${BoardList}">
								<c:if test="${userRank == 'A'}">
									<option value="${li.boardid}"
										<c:if test="${li.boardid==nt.boardid}"> selected</c:if>>${li.boardname }</option>
								</c:if>
								<c:if test="${userRank != 'A' }">
									<c:if test="${li.boardid ==1 }">
									</c:if>
									<c:if test="${li.boardid != 1}">
										<option value="${li.boardid}"
											<c:if test="${li.boardid==nt.boardid}"> selected</c:if>>${li.boardname }</option>
									</c:if>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${nt.writeid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${nt.title}"></td>
				</tr>
				<tr>
					<th>부제</th>
					<td>
						<div>
							<select name="titleid">
								<option value="1" <c:if test="${titleid==1}">selected</c:if>>잡담</option>
								<option value="2" <c:if test="${titleid==2}">selected</c:if>>질문</option>
								<option value="3" <c:if test="${titleid==3}">selected</c:if>>정보</option>
								<option value="4" <c:if test="${titleid==4}">selected</c:if>>공지</option>
							</select>
							 <input type="checkbox" name="secret" value="Y"  <c:if test="${nt.secret=='Y'}">checked</c:if>>비밀글
						</div>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${nt.hit }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${nt.regdate}</td>
				</tr>
				<tr>
					<th colspan=2>내용</th>
				</tr>
				<tr>
					<td colspan=2><textarea name="content">${nt.content}</textarea>
				</tr>
			</table>
			<input type="hidden" name="id" value="${nt.id}" />
				<input type="hidden" name="boardid" value="${nt.boardid}" />
			 <input type="submit" value="저장" />
		</form>
	</main>
</body>
</html>