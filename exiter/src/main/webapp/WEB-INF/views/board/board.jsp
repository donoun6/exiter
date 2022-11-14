<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/board.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>board</title>
</head>
<body>
<% String userId = (String)session.getAttribute("userId");
if (userId == null){
	response.sendRedirect("/exiter/user/login");
	return;
}%>
	<div id="wrap">
	<!-- header 영역 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 메인 영역 -->
		<main>
			<h2>커뮤니티</h2>
			<section id="section">
				<div class="table-wrap">
					<table>
						<c:forEach var="boardInfo" items="${boardInfo }"> 
							<tr>
							<td>
							<div class="boardInfo">
							<a href="/exiter/board/boardDetail/${boardInfo.bid }"></a>
							<h1 class="title">${boardInfo.BTitle }</h1>
							<p class="def">${boardInfo.BDef }</p>
							<div>
							<span>${boardInfo.UGrade }${boardInfo.userId }</span>
							${boardInfo.regDate }
							</div>
							</div>
							</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="write-btn">
					<a href="<c:url value='/board/boardWrite'/>" class="in-btn">글쓰기</a>
				</div>
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>