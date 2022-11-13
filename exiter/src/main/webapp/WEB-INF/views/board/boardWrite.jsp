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
	<header>
		<nav id="top-nav">
			<div class="cube">
				<div class="face top">
					<a href="#">E</a>
				</div>
				<div class="face bottom">
					<a href="#">E</a>
				</div>
				<div class="face left">
					<a href="#">E</a>
				</div>
				<div class="face right">
					<a href="#">E</a>
				</div>
				<div class="face front">
					<a href="#">E</a>
				</div>
				<div class="face back">
					<a href="#">E</a>
				</div>
				<!-- <div class="logo-img"><a href="/exiter">E</a></div> -->
			</div>

			<div class="right-img">
				<div class="search-img">
					<a href="#"></a>
				</div>
				<div class="login-img">
					<a href="user/login"></a>
				</div>
			</div>
		</nav>
	</header>
	<div id="wrap">
		<main>
			<h2>글쓰기</h2>
			<section id="section">
			<form:form modelAttribute="board" method="post">
				<form:input path="bTtitle"/>
			</form:form>
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>