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
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>