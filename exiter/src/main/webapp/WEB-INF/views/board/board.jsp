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
			<h2>게시판</h2>
			<section id="section">
				<div class="sec1">
					<div class="select" tabindex="1">
						<select class="cate">
							<option value="cate1" checked>카테고리1</option>
							<option value="cate2">카테고리2</option>
							<option value="cate3">카테고리3</option>
							<option value="cate4">카테고리4</option>
						</select>
					</div>
					<div class="search-box">
						<form action="/">
							<input class="search-txt" type="text" placeholder="검색어를 입력해 주세요">
							<button class="search-btn" type="submit">검색</button>
						</form>
					</div>
				</div>
				<div class="table-wrap">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>8</td>
								<td>게시판 제목입니다</td>
								<td>작성자1</td>
								<td>2022-09-11</td>
							</tr>
							<tr>
								<td>2</td>
								<td>게시판 제목입니다</td>
								<td>작성자1</td>
								<td>2022-09-11</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="write-btn">
					<a href="<c:url value='/qna_write'/>" class="in-btn">글쓰기</a>
				</div>
			</section>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>