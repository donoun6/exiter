<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="<c:url value='/exiter.ico'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/initial.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/default.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/header.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common/footer.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/board/boardWrite.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/common/jquery.js'/>"></script>
<title>board</title>
</head>
<body>
	<div id="wrap">
	<!-- header 영역 -->
        <jsp:include page="../common/only_logo_header.jsp"></jsp:include> 
		<main>
			<h2>글쓰기</h2>
			<form:form modelAttribute="board" method="post">
			<input type="hidden" name="uid" value="${uid }">
			<table>
				<tr>
					<td>
						<ul>
							<li><label style="margin-top: 10px;">제목</label></li>
							<li><input type="text" name="bTtitle" placeholder="제목을 입력하세요."></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						<ul>
							<li><label>카테고리</label></li>
							<li>
								<select name="bCategory">
								<% if( session.getAttribute("userId").equals("admin") ){%>
									<option class="option" value="공지사항">공지사항</option>
									<% } %>
									<option class="option" value="자유게시판">자유게시판</option>
									<option class="option" value="일행구하기">일행구하기</option>
									<option class="option" value="QnA">QnA</option>
								</select>
							</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						<ul>
							<li><label>내용</label></li>
							<li><textarea name="bDef" placeholder="내용을 입력하세요."></textarea></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						<ul>
							<li><button type="submit">등록</button></li>
						</ul>
					</td>
				</tr>
			</table>
			</form:form>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>